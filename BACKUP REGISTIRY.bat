@echo off
setlocal EnableExtensions
title SVHYPER-X ^| SYSTEM RESTORE POINT
color 0B
mode con: cols=90 lines=28

:: ============================================================
:: SVHYPER-X - BACKUP REGISTRY
:: Create Windows System Restore Point
:: Restore Point Name: BACKUP REGISTRY
:: ============================================================

:: ---- CHECK ADMINISTRATOR ----
net session >nul 2>&1
if %errorlevel% neq 0 (
    cls
    echo.
    echo  ===============================================================
    echo                     SVHYPER-X PROTECTION
    echo  ===============================================================
    echo.
    echo       [!] Administrator permission required.
    echo       [>] Requesting elevation...
    echo.
    powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

cls
echo.
echo  ============================================================================
echo                             S V H Y P E R - X
echo                        SYSTEM BACKUP ^& PROTECTION
echo  ============================================================================
echo.
echo       Developer : VazerX
echo       Function  : Create System Restore Point
echo       Name      : BACKUP REGISTRY
echo.
echo  ----------------------------------------------------------------------------
echo.

:: ---- CHECK SYSTEM RESTORE ----
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"try { ^
    $drive = $env:SystemDrive; ^
    $sr = Get-ComputerRestorePoint -ErrorAction SilentlyContinue; ^
    if (-not (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore')) { ^
        Write-Host '[!] System Restore component unavailable.'; ^
        exit 2 ^
    } ^
    Enable-ComputerRestore -Drive ($drive + '\') -ErrorAction Stop; ^
    Write-Host '[+] System Restore is enabled.' ^
} catch { ^
    Write-Host ('[!] Failed: ' + $_.Exception.Message); ^
    exit 1 ^
}"

if errorlevel 2 (
    echo.
    echo  [X] System Restore is unavailable on this Windows installation.
    echo.
    pause
    exit /b 1
)

if errorlevel 1 (
    echo.
    echo  [X] Could not enable System Restore.
    echo  [!] Check Windows System Protection settings.
    echo.
    pause
    exit /b 1
)

echo.
echo  [>] Creating restore point...
echo.

:: ---- CREATE RESTORE POINT ----
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"try { ^
    Checkpoint-Computer -Description 'BACKUP REGISTRY' -RestorePointType 'MODIFY_SETTINGS' -ErrorAction Stop; ^
    Write-Host ''; ^
    Write-Host '    [OK] RESTORE POINT CREATED SUCCESSFULLY' -ForegroundColor Green; ^
    Write-Host '    Name: BACKUP REGISTRY' -ForegroundColor Cyan; ^
} catch { ^
    Write-Host ''; ^
    Write-Host ('    [X] FAILED: ' + $_.Exception.Message) -ForegroundColor Red; ^
    exit 1 ^
}"

if errorlevel 1 (
    echo.
    echo  ============================================================================
    echo                          BACKUP FAILED
    echo  ============================================================================
    echo.
    echo  Kemungkinan penyebab:
    echo  - Restore point baru saja dibuat sebelumnya
    echo  - System Protection memiliki batas pembuatan restore point
    echo  - Tidak tersedia cukup ruang untuk Restore Point
    echo.
    pause
    exit /b 1
)

echo.
echo  ============================================================================
echo                           BACKUP COMPLETED
echo  ============================================================================
echo.
echo       Restore Point : BACKUP REGISTRY
echo       Status        : SUCCESS
echo.
echo       Jangan matikan PC saat proses backup berlangsung.
echo.
echo  ============================================================================
echo.
pause
exit /b 0
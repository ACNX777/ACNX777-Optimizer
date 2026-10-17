# ACNX777+ OPTIMIZER

> Windows tweaking & performance optimizer — berbasis registry, dengan menu interaktif, dijalankan sebagai **Administrator**.
> *Rebranded from "Platinum+ Optimizer".*

![Platform](https://img.shields.io/badge/platform-Windows%2010%20%7C%2011-0078D6?style=flat-square)
![Language](https://img.shields.io/badge/script-Batch%20%2F%20CMD-4D4D4D?style=flat-square)
![License](https://img.shields.io/badge/license-MIT-3DA639?style=flat-square)
![Status](https://img.shields.io/badge/version-9.3-blue?style=flat-square)

---

## ✨ Fitur

- **Menu interaktif** berwarna (tema hijau) + logo ASCII `ACNX777+ OPTIMIZER`.
- **Microsoft Store** dan **Windows Update** configurable (enable / disable) sebelum eksekusi.
- **Restore point otomatis** + backup registry (`acnx777_backup.reg` di Desktop) sebelum tweak.
- **Tweak performa & latensi** tingkat registry yang umum dipakai gamer:
  - NVIDIA tweaks (registry) — termasuk **Shader Cache**, **OpenGL**, **Dynamic PState**, **Power/GraphicsDrivers**, dll.
  - Multimedia / MMCSS gaming profile, network throttling, system responsiveness.
  - Input latency (mouse/keyboard), Game DVR / Game Bar control.
- **NVIDIA Overlay (Alt+Z) sengaja tetap DIAKTIFKAN** — script hanya *menghapus* kemungkinan blokir lama (`DisableOverlay` di-set `0`), jadi recording/shadowplay tetap bisa dipakai.
- **CompactOS**, service tuning, dan lain-lain (lihat komentar di dalam script).
- **Aman untuk Wi-Fi & Ethernet** — tidak ada service jaringan yang di-disable.
- **BitLocker aman** — proteksi otomatis di-*suspend* 1 reboot sebelum tweak, jadi **tidak diminta 48-digit recovery key** saat boot (lihat bagian BitLocker di bawah).

> ⚠️ **Catatan penting:** script ini mengubah registry dan beberapa konfigurasi sistem secara permanen. **Buat restore point / backup** dulu. Gunakan dengan risiko Anda sendiri.

---

## 🌐 Aman untuk Wi-Fi & Ethernet

Script ini **tidak men-disable service jaringan**: `WlanSvc` (Wi-Fi), `Wcmsvc`, `NlaSvc`, `Dhcp`, `Dnscache`, `Eaphost`, `dot3svc`, dan `Netman` tetap berjalan — dan Windows Firewall (`mpssvc`) justru dipastikan aktif. Jadi internet lewat **Wi-Fi maupun kabel (Ethernet) tetap normal**.

Yang **tidak** didukung (service-nya memang di-disable): VPN / PPPoE (`RasMan`, `RemoteAccess`), Mobile Hotspot / Internet Connection Sharing (`icssvc`, `SharedAccess`), dan modem 4G/WWAN (`WwanSvc`).

---

## 🔐 BitLocker (tidak perlu 48-digit recovery key)

Sebelum tweak dijalankan, script **mendeteksi BitLocker** pada volume sistem. Kalau proteksi aktif, script otomatis melakukan:

- `manage-bde -protectors -disable %SystemDrive% -rebootcount 1`
- fallback (kalau di atas gagal): `Suspend-BitLocker -MountPoint $env:SystemDrive -RebootCount 1`

Artinya proteksi **di-pause untuk 1 kali reboot** dan **aktif kembali otomatis** setelah restart — jadi **tidak muncul layar minta 48-digit recovery key**.

> Kalau versi lama sudah pernah dijalankan dan PC Anda sekarang minta recovery key: buka **https://aka.ms/myrecoverykey** pakai akun Microsoft Anda untuk melihat kuncinya.
>
> Tetap disarankan menyimpan recovery key sendiri sebelum menjalankan tool apa pun yang mengubah boot config (`manage-bde -protectors -get C:`).
>
> Service `BDESVC` (BitLocker) **tidak** ikut di-disable, supaya BitLocker tetap bisa dikelola dan auto-resume-nya jalan.

---

## 📋 Kebutuhan

- Windows 10 / 11 (x64).
- **Dijalankan sebagai Administrator** (klik kanan → *Run as administrator*).
- PowerShell (sudah tersedia di Windows) untuk pembuatan restore point.

---

## 🚀 Cara Pakai

1. Download **ZIP**-nya di halaman **[Releases](../../releases/latest)** (udah lengkap semua file), atau clone repo ini.
2. Klik kanan **`ACNX777+Optimizer.cmd`** → **Run as administrator**.
3. Pilih konfigurasi Microsoft Store & Windows Update.
4. Tunggu proses selesai. Ada backup registry + restore point otomatis.

Script tambahan (opsional):

- `BACKUP REGISTIRY.bat` — membuat System Restore Point manual (nama: `BACKUP REGISTRY`).

---

## 📁 Isi Repo

```
ACNX777-Optimizer/
├── ACNX777+Optimizer.cmd               # tool utama (menu interaktif)
├── BACKUP REGISTIRY.bat                # buat System Restore Point
├── MAX INPUT.reg                       # keyboard + mouse responsiveness
├── MAX LOW-LATENCY DISPLAY.reg         # display / game presentation latency
├── Ultra Zero Input Delay.reg          # input latency (safe base)
├── 60HZ Monitor And Laptop Max .reg    # preset refresh rate 60 Hz / laptop
├── 75HZ.reg                            # preset 75 Hz
├── 100HZ.reg                           # preset 100 Hz
├── 120HZ.reg                           # preset 120 Hz
├── 144HZ.reg                           # preset 144 Hz
├── 185HZ SMOOTH LATECY.reg             # preset 185 Hz
├── BACA INI SEBELUM MELAKUKAN !!!.txt  # petunjuk preset refresh rate
├── README.md
└── LICENSE
```

---

## 🖥️ Preset Refresh Rate (`Hertz Monitor X`)

**Sesuaikan preset dengan refresh rate monitor Anda.**

| Preset | Untuk monitor |
|---|---|
| `60HZ Monitor And Laptop Max .reg` | 60 Hz / laptop |
| `75HZ.reg` | 75 Hz |
| `100HZ.reg` | 100 Hz |
| `120HZ.reg` | 120 Hz |
| `144HZ.reg` | 144 Hz |
| `185HZ SMOOTH LATECY.reg` | 185 Hz (smooth latency) |

> Jangan asal pakai preset yang tidak sesuai monitor. Klik dua kali file `.reg` untuk menerapkan, lalu restart bila perlu.

---

## 💾 Backup & Restore

- Sebelum tweak, `ACNX777+Optimizer.cmd` membuat **restore point** dan mengekspor backup registry ke Desktop: **`acnx777_backup.reg`**.
- `BACKUP REGISTIRY.bat` juga bisa dipakai untuk membuat restore point manual (nama: `BACKUP REGISTRY`).

---

## 👤 Kredit & Terima Kasih

- **ACNX777+ Optimizer** — `@acenkk13`
- Komponen pendukung (registry preset & backup tool) — **SVHYPER-X / VazerX**

---

## ⚠️ Disclaimer

Repo ini disediakan **"AS IS"**, tanpa jaminan apa pun. Mengubah registry dan konfigurasi sistem dapat menyebabkan:
- sistem tidak stabil,
- fitur Windows (Store/Update) mati,
- masalah driver / game.

Gunakan hanya jika Anda paham risikonya. Penulis **tidak bertanggung jawab** atas kerusakan atau kehilangan data. Selalu siapkan backup / restore point.

---

## 📄 Lisensi

Dirilis dengan **MIT License** — lihat [LICENSE](LICENSE).

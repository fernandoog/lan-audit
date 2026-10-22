# lan-audit

Auditoría defensiva de tu red local (LAN) y Bluetooth: inventario de equipos e informe de vulnerabilidades / riesgos.

Genera un informe Markdown con hosts, fabricantes (OUI), puertos abiertos, banners HTTP/HTTPS y hallazgos priorizados (CRITICAL → INFO).

## Requisitos

- `bash`, `nmap`, `curl`, `iproute2`
- Opcional: `bluetoothctl` (`bluez-utils`), `openssl`, `rfkill`

```bash
# Arch / Omarchy
sudo pacman -S --needed nmap curl bluez-utils openssl
```

## Instalación

```bash
git clone https://github.com/fernandoog/lan-audit.git
cd lan-audit
./install.sh
```

## Uso

```bash
lan-audit --quick          # todas las redes de interfaces UP
lan-audit --full           # top-1000 + scripts NSE seguros + BT
lan-audit --full --no-bt   # sin Bluetooth
lan-audit --cidr 192.168.1.0/24
lan-audit --cidr 192.168.1.0/24 --cidr 10.141.197.0/24   # dos redes
```

Con **dos Wi‑Fi**, conecta ambos adaptadores (p. ej. `HOUSE` + `HOUSE2`) y lanza `lan-audit`:
escanea **todas** las subredes activas y todos los hosts alcanzables en ellas.
No escanea SSIDs a los que no estás asociado.

Informes en:

`~/.local/share/lan-audits/<fecha>/INFORME.md`

También: `findings.tsv`, salidas `nmap/` y banners en `raw/`.

## Qué detecta (ejemplos)

- Telnet, FTP, SMB, ADB, TR-069
- Kernels IoT antiguos (p. ej. Linux 4.4)
- Panel admin del router en LAN
- Servicios HTTP embebidos / UPnP
- Adaptador Bluetooth y dispositivos cercanos

## Notas

- Pensado para **tu propia red**. No incluye exploits ni PoCs ofensivos.
- Sin root usa connect-scan TCP (válido en LAN doméstica).
- Compatible con [privacy-toolkit](https://github.com/fernandoog/privacy-toolkit) (detecta Tor VPN / LAN stealth si están activos).

## Licencia

MIT

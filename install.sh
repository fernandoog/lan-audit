#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN="${HOME}/.local/bin"
mkdir -p "$BIN"
install -m 755 "${ROOT}/lan-audit" "${BIN}/lan-audit"
case ":$PATH:" in
  *":${BIN}:"*) ;;
  *) echo "Añade a tu PATH: export PATH=\"${BIN}:\$PATH\"" ;;
esac
echo "Instalado: ${BIN}/lan-audit"
echo "Prueba:    lan-audit --quick"

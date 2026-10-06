#!/usr/bin/env bash
set -e

export PATH="$HOME/flutter/bin:$PATH"

cd "$(dirname "$0")/bai_thi_flutter"
flutter pub get
flutter run -d web-server --web-hostname=0.0.0.0 --web-port=3000

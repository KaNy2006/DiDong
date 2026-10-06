#!/usr/bin/env bash
set -e
export PATH="$HOME/flutter/bin:$PATH"
PROJECT_DIR="${1:-bai_thi_flutter}"
if [ ! -f "$PROJECT_DIR/pubspec.yaml" ]; then
  echo "Khong tim thay Flutter project: $PROJECT_DIR"
  echo "Tao project moi: flutter create bai_thi_flutter"
  echo "Sau do chay: bash run_flutter.sh bai_thi_flutter"
  exit 1
fi
cd "$PROJECT_DIR"
flutter pub get
flutter run -d web-server --web-hostname=0.0.0.0 --web-port=3000

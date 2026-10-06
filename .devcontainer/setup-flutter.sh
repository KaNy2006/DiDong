#!/usr/bin/env bash
set -e

FLUTTER_DIR="$HOME/flutter"

if [ ! -d "$FLUTTER_DIR" ]; then
  git clone https://github.com/flutter/flutter.git -b stable "$FLUTTER_DIR"
fi

grep -qxF 'export PATH="$HOME/flutter/bin:$PATH"' "$HOME/.bashrc" ||   echo 'export PATH="$HOME/flutter/bin:$PATH"' >> "$HOME/.bashrc"

export PATH="$HOME/flutter/bin:$PATH"

flutter config --enable-web
flutter precache --web

if [ -f "bai_thi_flutter/pubspec.yaml" ]; then
  cd bai_thi_flutter
  flutter pub get
fi

echo
echo "Flutter setup complete."
echo "Run:"
echo "  cd bai_thi_flutter"
echo "  flutter run -d web-server --web-hostname=0.0.0.0 --web-port=3000"

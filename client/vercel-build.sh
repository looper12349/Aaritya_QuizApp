#!/bin/bash

# Download Flutter
git clone https://github.com/flutter/flutter.git
export PATH="$PATH:`pwd`/flutter/bin"

# Build the project
cd quiz_app_frontend
flutter pub get
flutter build web
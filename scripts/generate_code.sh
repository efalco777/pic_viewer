  cd ..
  flutter pub get
  flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart -S assets/translations
  flutter pub run build_runner build --delete-conflicting-outputs
# Pic Viewer
Project made for an assesment for Videoslots.

## SDK 
Flutter sdk version used: 3.7.5. 

Note:
If you're upgrading to this version you might need to delete "$FLUTTER_SDK/bin/cache" before executing "flutter pub get".
I've upgraded to this version on two separate devices and each time "flutter pub get" would just hang until cache is deleted.

## Supported platforms
Android, iOS.

## How to run

TERMINAL
1. Go to root diretory,
1. Input "flutter pub get",
2. Input "flutter run". The "--profile", "--release" commands should work as well.

VSCode
1. Open project via "workspace.code-workspace",
1. Either Input "flutter pub get" or open pubspec.yaml and get dependencies using VSCode ui,
2. Run the application by one of the three run configurations available.
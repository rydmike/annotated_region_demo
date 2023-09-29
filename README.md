# Demo of transparent AnnotatedRegion

This repo was originally used to test issue: 
https://github.com/flutter/flutter/issues/135657

But later modified to demonstrate usage of `AnnotatedRegion` to use transparent system navigation bar on Android.

Note that for this to work you must also set `SystemUiMode.edgeToEdge` so:

```dart
  // If opacity is specified, we need to enable SystemUiMode.edgeToEdge to
  // be able to see content scrolling behind the transparent bar. Only do
  // this when using opacity or transparent system navigation bar.
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
```

In this example that is done in the [`main.dart`](https://github.com/rydmike/annotated_region_demo/blob/main/lib/main.dart) file.

After that setting the transparent system navigation bar style is typically enough to do in the screen(s) that can chnage the theme mode between light and dark mode.

There you can do something like:

```dart
  @override
  Widget build(BuildContext context) {
    final bool isLight = Theme.of(context).brightness == Brightness.light;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness:
            isLight ? Brightness.dark : Brightness.light,
      ),
      child: Scaffold(...),
    );
```

In this demo it is done in file [`settings_view.dart`](https://github.com/rydmike/annotated_region_demo/blob/main/lib/src/settings/settings_view.dart).

The bottom navigation bar on the home screen does not do anything, it is only there to show what it looks like when one is present. The theme settings and details page show the look when a navigator is not present.

The system nav also changes correctly in this demo when the `ThemeMode.system` is used and light/dark mode is toggled via Android system settings.


## Getting Started

This project is a starting point for a Flutter application that follows the
[simple app state management
tutorial](https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple).

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Assets

The `assets` directory houses images, fonts, and any other files you want to
include with your application.

The `assets/images` directory contains [resolution-aware
images](https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).

## Localization

This project generates localized messages based on arb files found in
the `lib/src/localization` directory.

To support additional languages, please visit the tutorial on
[Internationalizing Flutter
apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)

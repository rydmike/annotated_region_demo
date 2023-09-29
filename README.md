# test_always_use_24h_format

This repo was used to test issue: 

https://github.com/flutter/flutter/issues/135657

But now demonstrate usage of `AnnotatedRegion` to use transparent system navigation bar.

Not that for it to work you must also set `SystemUiMode.edgeToEdge` so:

```dart
  // If opacity is specified, we need to enable SystemUiMode.edgeToEdge to
  // be able to see content scrolling behind the transparent bar. Only do
  // this when using opacity or transparent system navigation bar.
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

```

After that setting the transparent style is typically enough to do in the screens that can
chnage the theme mode between light and dark mode.

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

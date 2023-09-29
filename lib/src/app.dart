import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    final use24Hour = MediaQuery.alwaysUse24HourFormatOf(context);
    debugPrint('Use 24 hour format: $use24Hour at ${DateTime.now()} above MA');
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(useMaterial3: true),
          darkTheme: ThemeData.dark(useMaterial3: true),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                return

                    // AnnotatedRegion<SystemUiOverlayStyle>(
                    // value: SystemUiOverlayStyle(
                    //   // The top status bar settings.
                    //   // systemStatusBarContrastEnforced: false,
                    //   // statusBarColor: statusBarColor,
                    //   // statusBarBrightness: statusBarBrightness,
                    //   // statusBarIconBrightness: statusBarIconBrightness,
                    //   // The bottom navigation bar settings.
                    //   systemNavigationBarContrastEnforced: false,
                    //   systemNavigationBarColor: Colors.black.withAlpha(0x01),
                    //   // Divider setting.
                    //   systemNavigationBarDividerColor: Colors.transparent,
                    //   // Bottom system navigation bar icon or swipe bar navigator color.
                    //   systemNavigationBarIconBrightness:
                    //       Theme.of(context).brightness == Brightness.dark
                    //           ? Brightness.light
                    //           : Brightness.dark,
                    // ),
                    // child:

                    switch (routeSettings.name) {
                  SettingsView.routeName =>
                    SettingsView(controller: settingsController),
                  SampleItemDetailsView.routeName =>
                    const SampleItemDetailsView(),
                  SampleItemListView.routeName => const SampleItemListView(),
                  _ => const SampleItemListView(),
                };
                // );
              },
            );
          },
        );
      },
    );
  }
}

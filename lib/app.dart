import 'package:casino_test/app/constants/app_constants.dart';
import 'package:casino_test/app/constants/http_urls.dart';
import 'package:casino_test/app/libs/locale_manager/locale_manager.dart';
import 'package:casino_test/app/models/general/config/environment_config_model.dart';
import 'package:casino_test/app/theme/themes/app_primary_theme.dart';
import 'package:casino_test/core/i10n/i10n.dart';
import 'package:flutter/material.dart';
import 'app/libs/app/size_config.dart';
import 'app/navigation/route.dart';
import 'app/navigation/route_factory.dart';
import 'app/theme/theme.dart';
import 'core/i10n/default_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future run(EnvironmentConfigModel config) async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager.cacheInit();
  HttpUrl.baseUrl = config.apiBaseUrl;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final String? appName;

  const MyApp({Key? key, this.appName}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        SizeConfig.setScreenSizeFromConstraints(constraints);
        return ValueListenableBuilder<Locale>(
          valueListenable: localeValueNotifier,
          builder: (context, Locale value, _) {
            return MaterialApp(
              navigatorKey: MyRouteFactory.instance.navigatorKey,
              locale: value,
              supportedLocales: getSupportedLocalList,
              localizationsDelegates: [GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, GlobalCupertinoLocalizations.delegate, AppLocalization.delegate],
              builder: (BuildContext context, Widget? child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                  child: child!,
                );
              },
              title: appName ?? generalAppName,
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.light,
              theme: getTheme(AppPrimaryTheme()),
              onGenerateRoute: MyRouteFactory.instance.main.onGenerateRoute,
              initialRoute: MainScreensRoutes.init,
            );
          },
        );
      },
    );
  }
}

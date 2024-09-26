import 'package:departure_bhagavadgita_app/screen/home/provider/home_provider.dart';
import 'package:departure_bhagavadgita_app/screen/home/view/home_screen.dart';
import 'package:departure_bhagavadgita_app/utils/app_routes.dart';
import 'package:departure_bhagavadgita_app/utils/app_them.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: HomeProvider()..getTheme(),
        ),
      ],
      child: Consumer<HomeProvider>(builder: (context, value, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode:value.theme =="Light"
            ?ThemeMode.light
            :value.theme=="Dark"
            ?ThemeMode.dark
            :ThemeMode.system,
        routes: app_routes,
      ),
      ),
    ),
  );
}

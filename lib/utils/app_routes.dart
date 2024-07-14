
import 'package:departure_bhagavadgita_app/screen/detil/view/detil_screen.dart';
import 'package:departure_bhagavadgita_app/screen/home/view/home_screen.dart';
import 'package:flutter/material.dart';

import '../screen/splash/view/splash_screen.dart';
Map<String,WidgetBuilder> app_routes={
  '/':(context) => const SplashScreen(),
  'home':(context) => HomeScreen(),
  'details':(context) => DetailsScreen(),

};
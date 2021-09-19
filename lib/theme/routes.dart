import 'package:firebasestore/screen/login_screen.dart';
import 'package:firebasestore/screen/menu.dart';
import 'package:firebasestore/screen/register_screen.dart';
import 'package:flutter/material.dart';


class AppRoutes {
  AppRoutes._();

  static const String authLogin = '/auth-login';
  static const String authRegister = '/auth-register';
  static const String menu = '/menu';

  static Map<String, WidgetBuilder> define() {
    return {
      authLogin: (context) => Login(),
      authRegister: (context) => Register(),

      menu: (context) => MenuScreen(),
    };
  }
}
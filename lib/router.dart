import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_work_utils/models/routing_data.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:silvertime/include.dart';
import 'package:silvertime/providers/auth.dart';
import 'package:silvertime/providers/ui.dart';
import 'package:silvertime/screens/account.dart';
import 'package:silvertime/screens/auth/login.dart';
import 'package:silvertime/screens/first_time.dart';
import 'package:silvertime/screens/home.dart';
import 'package:silvertime/screens/not_found.dart';
import 'package:silvertime/screens/notifications.dart';
import 'package:silvertime/screens/reports/reports.dart';
import 'package:silvertime/screens/splash.dart';

class RouterAdmin {
  static PageTransition getMaterialPageRoute(
    component, settings, dark
  ) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    var newComponent = AnnotatedRegion<SystemUiOverlayStyle>(
      value: !dark
      ? SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent
      ) :  SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent
      ),
      child: component,
    );
    return PageTransition(
      child: newComponent,
      type: PageTransitionType.fade,
      settings: settings
    );
  }

  static Route<dynamic> generateRoute (
    BuildContext context, RouteSettings settings
  ) {
    try {
      RoutingData routingData = settings.name!.getRoutingData;
      String? forceRoute;

      printLog (
        'queryParameters: ${routingData.queryParameters} path: ${settings.name}'
      );

      bool auth = Provider.of<Auth> (context, listen: false).tryAutoLogin ();
      if (routingData.route != "/splash" || routingData.route != "/first-time") {
        if (!auth) {
          printWarning ("Not authenticated");
          printWarning ("Redirecting");
          forceRoute = LoginScreen.routeName;
          settings = RouteSettings (
            arguments: settings.arguments, name: forceRoute
          );
        }
      }

      String routeToLook = forceRoute ?? routingData.route ?? "";

      bool dark = Provider.of<UI> (context, listen: false).modeVal == Mode.dark;

      Provider.of<UI> (context, listen: false).currentRoute = routeToLook;

      switch (routeToLook) {
        case AccountScreen.routeName:
          return getMaterialPageRoute (
            const AccountScreen (),
            settings, dark
          );
        case FirstTimeScreen.routeName:
          return getMaterialPageRoute(
            const FirstTimeScreen(), 
            settings, dark
          );
        case HomeScreen.routeName:
          return getMaterialPageRoute(
            const HomeScreen (), 
            settings, dark
          );
        case LoginScreen.routeName:
          return getMaterialPageRoute(
            const LoginScreen(), 
            settings, dark
          );
        case NotificationsScreen.routeName:
          return getMaterialPageRoute(
            const NotificationsScreen(), 
            settings, dark
          );
        case ReportsScreen.routeName:
          return getMaterialPageRoute(
            const ReportsScreen(), 
            settings, dark
          );
        case SplashScreen.routeName:
          return getMaterialPageRoute(
            const SplashScreen (), 
            settings, dark
          );
        default:
          settings = const RouteSettings (
            name: "/not-found",
            arguments: {}
          );

          return getMaterialPageRoute(
            const NotFoundScreen (), 
            settings, dark
          );
      }

    } catch (error, bt) {
      Completer().completeError(error, bt);
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Error on auth!'),
          ),
        ),
      );
    }
  }
}
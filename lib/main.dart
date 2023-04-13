import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:silvertime/include.dart';
import 'package:silvertime/models/notifications/notification_subject.dart';
import 'package:silvertime/providers.dart';
import 'package:silvertime/providers/auth.dart';
import 'package:silvertime/providers/notifications/notifications.dart';
import 'package:silvertime/providers/notifications/push_notifications.dart';
import 'package:silvertime/providers/ui.dart';
import 'package:silvertime/router.dart';
import 'package:silvertime/screens/splash.dart';
import 'package:silvertime/style/themes.dart';
import 'package:url_strategy/url_strategy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized ();
  await PushNotificationsService.initializeApp ();
  setPathUrlStrategy();
  await setupLocator ();
  runApp(const SilverTime());
}

class SilverTime extends StatefulWidget {
  const SilverTime({super.key});

  @override
  State<SilverTime> createState() => _SilverTimeState();
}

class _SilverTimeState extends State<SilverTime> {
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();
  StreamSubscription? _firebaseSubscription;

  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage ("assets/logos/silvertime.png"), context);
    precacheImage(const AssetImage ("assets/logos/silvertime0.5.png"), context);
    precacheImage(const AssetImage ("assets/logos/silvertime_white.png"), context);
    precacheImage(const AssetImage ("assets/logos/silvertime_white0.5.png"), 
      context
    );
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _firebaseSubscription?.cancel();
    super.dispose();
  }

  void _listeners (BuildContext context) {
    _firebaseSubscription = PushNotificationsService.notifications.listen(
      (event) async {
        NotificationSubject? subject = await Provider.of<Notifications> (
          context, listen: false
        ).getSubject (
          event.subject,
          ignore404: true
        );
        _scaffoldKey.currentState!.showSnackBar(
          SnackBar (
            content: InkWell(
              onTap: () async {
                locator<NavigationService> ()
                .navigatorKey.currentState?.pushReplacementNamed("/notifications");
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Text(
                  "New 🔔: ${event.title}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            shape: RoundedRectangleBorder (
              borderRadius: BorderRadius.circular(48),
            ),
            backgroundColor: subject?.color ??
            Theme.of(context).primaryColor,
            margin: const EdgeInsets.fromLTRB(15, 5, 15, 20),
            behavior: SnackBarBehavior.floating,
          )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setApplicationSwitcherDescription(
      ApplicationSwitcherDescription(
      label: appName,
        primaryColor: Theme.of(context).primaryColor.value, // This line is required
      )
    );

    return MultiProvider(
      providers: [
        ...mainProviders,
        ...overviewProviders,
        ...resourceProviders,
        ...statusProviders
      ],
      child: Consumer<UI>(
        builder: (context, ui, _) {
          ui.fetchSettings ();
          Provider.of<Auth> (context, listen: false).tryAutoLogin ();
          _listeners (context);
          return MaterialApp(
            title: appName,
            debugShowCheckedModeBanner: runtime == "Test",
            scaffoldMessengerKey: _scaffoldKey,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
            initialRoute: SplashScreen.routeName,
            navigatorKey: locator<NavigationService> ().navigatorKey,
            builder: (ctx, child) {
              return ScrollConfiguration(
                behavior: ScrollClean ().copyWith(
                  scrollbars: false
                ), 
                child: child ?? Container ()
              );
            },
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: Locale (ui.locale),
            onGenerateRoute: (settings) => RouterAdmin.generateRoute (
              context, settings
            ),
            navigatorObservers: [
              locator<RouteObserver> ()
            ],
          );
        }, 
      ),
    );
  }
}
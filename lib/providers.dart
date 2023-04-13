import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:silvertime/providers/auth.dart';
import 'package:silvertime/providers/notifications/notifications.dart';
import 'package:silvertime/providers/overview.dart';
import 'package:silvertime/providers/resources/services/instances.dart';
import 'package:silvertime/providers/resources/services/services.dart';
import 'package:silvertime/providers/resources/services/tags.dart';
import 'package:silvertime/providers/status/interruptions.dart';
import 'package:silvertime/providers/status/maintenances.dart';
import 'package:silvertime/providers/status/reports.dart';
import 'package:silvertime/providers/ui.dart';
import 'package:silvertime/providers/users.dart';

final List<SingleChildWidget> mainProviders = [
  ChangeNotifierProvider.value(
    value: UI ()
  ),
  ChangeNotifierProvider.value(
    value: Auth ()
  ),
  ChangeNotifierProxyProvider<Auth, Users>(
    create: (ctx) => Users (), 
    update: (ctx, auth, users) => users!..update (auth)
  ),
  ChangeNotifierProxyProvider<Auth, Notifications>(
    create: (ctx) => Notifications (), 
    update: (ctx, auth, notifications) => notifications!..update (auth)
  ),
];

final List<SingleChildWidget> resourceProviders = [
  ChangeNotifierProxyProvider<Auth, Services>(
    create: (ctx) => Services (), 
    update: (ctx, auth, services) => services!..update (auth)
  ),
  ChangeNotifierProxyProvider2<Auth, Services, ServiceInstances>(
    create: (ctx) => ServiceInstances (), 
    update: (ctx, auth, services, instances) => instances!..update (auth)
  ),
  ChangeNotifierProxyProvider2<Auth, Services, ServiceTags>(
    create: (ctx) => ServiceTags (), 
    update: (ctx, auth, services, tags) => tags!..update (auth)
  )
];

final List<SingleChildWidget> overviewProviders = [
  ChangeNotifierProxyProvider<Auth, Overviews>(
    create: (ctx) => Overviews (), 
    update: (ctx, auth, overviews) => overviews!..update (auth)
  )
];

final List<SingleChildWidget> statusProviders = [
  ChangeNotifierProxyProvider<Auth, Interruptions>(
    create: (ctx) => Interruptions (), 
    update: (ctx, auth, interruptions) => interruptions!..update (auth)
  ),
  ChangeNotifierProxyProvider<Auth, Maintenances>(
    create: (ctx) => Maintenances (), 
    update: (ctx, auth, maintenances) => maintenances!..update (auth)
  ),
  ChangeNotifierProxyProvider<Auth, Reports>(
    create: (ctx) => Reports (), 
    update: (ctx, auth, reports) => reports!..update (auth)
  )
];
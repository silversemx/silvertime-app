import 'dart:io' show Platform;

import 'package:provider/provider.dart';
import 'package:silvertime/include.dart';
import 'package:silvertime/providers/notifications/push_notifications.dart';
import 'package:silvertime/providers/ui.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  Widget _button ({
    required IconData icon, 
    required IconData selectedIcon,
    required String route,
    Map<String, String>? queryParams
  }) {
    return IconButton (
      padding: EdgeInsets.zero,
      icon: Icon (
        Provider.of<UI> (context).currentRoute == route
        ? selectedIcon
        : icon,
        size: 32,
      ),
      onPressed: () {
        Navigator.of(context).pushReplacementNamed(
          generateNavRoute(route, queryParams: queryParams)
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Container (
        margin: EdgeInsets.only (
          bottom: orientation == Orientation.landscape
          ? 16
          : Platform.isIOS 
          ? 24
          : kBottomNavigationBarHeight,
          left: orientation == Orientation.landscape
          ? MediaQuery.of(context).size.width * 0.3 : 8,
          right: orientation == Orientation.landscape
          ? MediaQuery.of(context).size.width * 0.3 : 8,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 8 
        ),
        decoration: BoxDecoration (
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(72)
        ),
        child: Row (
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _button (
              icon: Icons.house_outlined,
              selectedIcon: Icons.house_sharp,
              route: "/home"
            ),
            _button (
              icon: Icons.report_problem_outlined,
              selectedIcon: Icons.report_problem_sharp,
              route: "/reports"
            ),
            SizedBox.square(
              dimension: 32,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: _button (
                      icon: Icons.notifications_outlined,
                      selectedIcon: Icons.notifications_sharp,
                      route: "/notifications"
                    ),
                  ),
                  Positioned (
                    top: 0,
                    right: 0,
                    child: StreamBuilder(
                      stream: NotificationsManager.instance.notificationStream,
                      builder: (context, _) {
                        return Visibility(
                          visible: NotificationsManager
                            .instance.getUnreadNotificationsLength () > 0,
                          child: Container (
                            width: 16,
                            height: 16,
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration (
                              color: UIColors.error,
                              shape: BoxShape.circle
                            ),
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Text (
                                "${
                                  NotificationsManager.instance.getUnreadNotificationsLength ()
                                }",
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: UIColors.white
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    ),
                  )
                ],
              ),
            ),
            _button (
              icon: Icons.person_outline,
              selectedIcon: Icons.person_sharp,
              route: "/account"
            )
          ],
        ),
  );
      }
    );
  }
}
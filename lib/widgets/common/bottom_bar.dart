import 'dart:io' show Platform;

import 'package:provider/provider.dart';
import 'package:silvertime/include.dart';
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
    return Container (
    margin: EdgeInsets.only (
      bottom: Platform.isIOS 
      ? 24
      : kBottomNavigationBarHeight,
      left: 8,
      right: 8
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
          icon: Icons.notifications_outlined,
          selectedIcon: Icons.notifications_sharp,
          route: "/notifications"
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
}
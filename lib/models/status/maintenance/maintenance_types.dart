import 'package:silvertime/include.dart';

enum MaintenanceStatus {
  none,
  created,
  progress,
  done,
  removed
}

extension MaintenanceStatusExt on MaintenanceStatus {
  String name (BuildContext context) {
    switch (this) {
      case MaintenanceStatus.none:
        return S.of(context).status_none;
      case MaintenanceStatus.created:
        return S.of(context).status_created;
      case MaintenanceStatus.progress:
        return S.of(context).status_progress;
      case MaintenanceStatus.done:
        return S.of(context).status_done;
      case MaintenanceStatus.removed:
        return S.of(context).status_removed;
    }
  }

  String get emoji {
    switch (this) {
      case MaintenanceStatus.none:
      case MaintenanceStatus.removed:
        return "";
      case MaintenanceStatus.created:
        return "👾";
      case MaintenanceStatus.progress:
        return "👩🏻‍💻";
      case MaintenanceStatus.done:
        return "✅";
    }
  }

  Color get color {
    switch (this) {
      case MaintenanceStatus.none:
        return Colors.grey;
      case MaintenanceStatus.created:
        return Colors.orange;
      case MaintenanceStatus.progress:
        return Colors.blue;
      case MaintenanceStatus.done:
        return Colors.green;
      case MaintenanceStatus.removed:
        return Colors.red;
    }

  }

  Widget widget (BuildContext context) {
    return Container (
      constraints: const BoxConstraints (
        minWidth: 110,
        minHeight: 70
      ),
      decoration: BoxDecoration (
        borderRadius: BorderRadius.circular(20),
        color: color,
        boxShadow: [
          BoxShadow (
            offset: Offset.zero,
            blurRadius: 4,
            spreadRadius: 3,
            color: color.withOpacity(0.2)
          )
        ]
      ),
      padding: const EdgeInsets.all(8),
      child: RichText (
        text: TextSpan (
          text: "${name (context)}\n",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: getColorContrast(color)
          ),
          children: [
            TextSpan (
              text: emoji,
              style: Theme.of(context).textTheme.headlineSmall
            )
          ]
        ),
        maxLines: 2,
        textAlign: TextAlign.center,
      )
    );
  }
}

enum MaintenanceTime {
  none,
  free,
  range,
  // other
}

extension MaintenanceTimeExt on MaintenanceTime {
  String name (BuildContext context) {
    switch (this) {
      case MaintenanceTime.none:
        return S.of(context).maintenanceTime_none;
      case MaintenanceTime.free:
        return S.of(context).maintenanceTime_free;
      case MaintenanceTime.range:
        return S.of(context).maintenanceTime_range;
      // case MaintenanceTime.other:
      //   return S.of(context).maintenanceTime_other;
    }
  }
}
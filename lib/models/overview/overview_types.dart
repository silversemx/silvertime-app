import 'package:silvertime/include.dart';

enum OverviewFilter {
  none,
  interruptions,
  maintenances,
  instances
}

extension OverviewFilterExt on OverviewFilter {
  String name (BuildContext context) {
    switch (this) {
      case OverviewFilter.none:
        return S.of(context).selectOne;
      case OverviewFilter.interruptions:
        return S.of(context).majorInterruptions;
      case OverviewFilter.maintenances:
        return S.of(context).maintenances;
      case OverviewFilter.instances:
        return S.of(context).instanceInterruptions;
    }
  }

  String get emoji {
    switch (this) {
      case OverviewFilter.none:
        return "";
      case OverviewFilter.interruptions:
        return "❌";
      case OverviewFilter.maintenances:
        return "🛠️";
      case OverviewFilter.instances:
        return "〽️";
    }
  }
}
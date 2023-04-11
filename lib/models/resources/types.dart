import 'package:silvertime/include.dart';

enum ResourceTypes {
  services,
  maintenance,
  interruptions,
  reports
}

extension ResourceTypesExt on ResourceTypes {
  String name (BuildContext context) {
    switch (this) {
      case ResourceTypes.services:
        return S.of(context).resourceType_services;
      case ResourceTypes.maintenance:
        return S.of(context).resourceType_maintenance;
      case ResourceTypes.interruptions:
        return S.of(context).resourceType_interruptions;
      case ResourceTypes.reports:
        return S.of(context).resourceType_reports;
    }
  }
}
import 'package:http_request_utils/body_utils.dart';
import 'package:silvertime/include.dart';
import 'package:silvertime/models/resources/service/service.dart';
import 'package:silvertime/models/resources/service/service_instance.dart';
import 'package:silvertime/models/status/interruption/interruption.dart';
import 'package:silvertime/models/status/maintenance/maintenance.dart';
class OverviewData {
  DateTime date = DateTime.now ();
  List<Interruption> interruptions = [];
  List<Interruption> instances = [];
  List<Maintenance> maintenances = [];
  
  OverviewData ({
    required this.date,
    required this.interruptions,
    required this.maintenances,
    required this.instances
  });

  Color get color {
    if (interruptions.isNotEmpty) {
      return UIColors.error;
    } else if (instances.isNotEmpty) {
      return UIColors.warning;
    } else if (maintenances.isNotEmpty) {
      return UIColors.maintenance;
    } else {
      return UIColors.inputSuccess;
    }
  }

  factory OverviewData.fromJson (dynamic json) {
    return OverviewData (
      date: dateTimefromMillisecondsNoZero(
        jsonField<int> (json, ["date", "\$date"]),
        defaultNow: true
      )!,
      interruptions: jsonListField<Interruption> (
        json, ["interruptions"], map: Interruption.fromJson, nullable: false
      ),
      instances: jsonListField<Interruption> (
        json, ["instances"], map: Interruption.fromJson, skipExceptions: true,
        defaultValue: []
      ),
      maintenances: jsonListField<Maintenance> (
        json, ["maintenance"], map: Maintenance.fromJson, nullable: false
      ),
    );
  }
}

class Overview {
  late Service service;
  List<ServiceInstance> instances = [];
  List<OverviewData> data = [];
  
  Overview ({
    required this.service,
    required this.instances,
    required this.data
  });

  factory Overview.fromJson (dynamic json) {
    return Overview (
      service: jsonClassField<Service> (
        json, ["service"], Service.fromJson, nullable: false
      ),
      instances: jsonListField<ServiceInstance> (
        json, ["instances"], map: ServiceInstance.fromJson, nullable: false
      ),
      data: jsonListField<OverviewData> (
        json, ["data"], map: OverviewData.fromJson, nullable: false
      ),
    );
  }
}
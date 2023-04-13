import 'dart:typed_data';

import 'package:http_request_utils/body_utils.dart';
import 'package:silvertime/include.dart';
import 'package:silvertime/models/status/reports/report_types.dart';
import 'package:silvertime/models/system/types.dart';

export 'package:silvertime/models/status/reports/report_types.dart';
export 'package:silvertime/models/system/types.dart';

class ReportImageFile {
  Uint8List? bytes;
  String? filename;
}

class Report {
  String id = "";
  ReportPriority priority = ReportPriority.none;
  ReportType type = ReportType.none;
  String? service;
  String? serviceName;
  String? instance;
  String? instanceName;
  ExecutionScope scope = ExecutionScope.none;
  String? user;
  ReportStatus status = ReportStatus.none;
  String title = "";
  String text = "";
  String? solution;
  DateTime date = DateTime.now ();
  ReportImageFile? image;


  Report ({
    required this.id,
    required this.priority,
    required this.type,
    required this.scope,
    required this.status,
    required this.title,
    required this.text,
    required this.date,
    this.service,
    this.serviceName,
    this.instance,
    this.instanceName,
    this.solution,
    this.user
  });

  Report.empty ();

  factory Report.fromJson (dynamic json) {
    return Report (
      id: jsonField<String> (json, ["_id", "\$oid"], nullable: false),
      priority: ReportPriority.values[
        jsonField<int> (json, ["priority",], defaultValue: 0) 
      ],
      type: ReportType.values [
        jsonField<int> (json, ["report_type",], defaultValue: 0) 
      ],
      scope: ExecutionScope.values [
        jsonField<int> (json, ["scope",], defaultValue: 0) 
      ],
      status: ReportStatus.values [
        jsonField<int> (json, ["status",], defaultValue: 0) 
      ],
      title: jsonField<String> (json, ["title",],  nullable: false),
      text: jsonField<String> (json, ["text",],  nullable: false),
      service: jsonField<String> (json, ["service", "_id", "\$oid"]),
      serviceName: jsonField<String> (json, ["service", "name"]),
      instance: jsonField<String> (json, ["service_instance", "_id", "\$oid"]),
      instanceName: jsonField<String> (json, ["service_instance", "name"]),
      solution: jsonField<String> (json, ["solution",]),
      user: jsonField<String> (json, ["user", "\$oid"]),
      date: dateTimefromMillisecondsNoZero(
        jsonField<int> (json, ["date", "\$date"]),
        defaultNow: true
      )!
    );
  }

  Map<String, bool> isComplete () {
    bool priority = this.priority != ReportPriority.none;
    bool type = this.type != ReportType.none;
    bool scope = this.scope != ExecutionScope.none;
    bool title = this.title.isNotEmpty;
    bool text = this.text.isNotEmpty;
    bool service = this.scope == ExecutionScope.global || (
      this.service?.isNotEmpty ?? false);
    bool instance = this.scope != ExecutionScope.instance || (
      this.instance?.isNotEmpty ?? false);

    return {
      "priority": !priority,
      "type": !type,
      "scope": !scope,
      "title": !title,
      "text": !text,
      "service": !service,
      "instance": !instance,
      "total": priority &&
        type &&
        scope &&
        title &&
        text &&
        service &&
        instance
    };
  }

  Map<String, String> toJson () {
    Map<String, String> retval = {
      "priority": priority.index.toString(),
      "type": type.index.toString(),
      "scope": scope.index.toString(),
      "title": title,
      "text": text,
    };

    if (service?.isNotEmpty ?? false) {
      retval["service"] = service!;
    } 
    if (instance?.isNotEmpty ?? false) {
      retval ['instance'] = instance!;
    }

    if (solution?.isNotEmpty ?? false) {
      retval ['solution'] = solution!;
    }

    return retval;
  }
}
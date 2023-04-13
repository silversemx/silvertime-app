import 'package:http_request_utils/body_utils.dart';
import 'package:silvertime/include.dart';

class NotificationSubject {
  String id = "";
  String? organization;
  String? workspace;
  String name = "";
  String description = "";
  Color color = Colors.red;
  DateTime date = DateTime.now ();

  NotificationSubject ({
    required this.id,
    this.organization,
    this.workspace,
    required this.name,
    required this.description,
    required this.color,
    required this.date
  });

  factory NotificationSubject.fromJson (dynamic json) {
    return NotificationSubject (
      id: jsonField<String> (json, ["_id", "\$oid"], nullable: false),
      organization: jsonField<String> (json, ["organization", "\$oid"]),
      workspace: jsonField<String> (json, ["workspace", "\$oid"]),
      name: jsonField<String> (json, ["name",],  nullable: false),
      description: jsonField<String> (json, ["description",],  nullable: false),
      color: jsonClassField<Color> (json, ["color"], (color) => colorFromString (color), defaultValue: Colors.red),
      date: DateTime.fromMillisecondsSinceEpoch(
        jsonField<int> (json, ["date", "\$date"]),
      )
    );
  }
}
import 'package:silvertime/include.dart';
import 'package:silvertime/models/notifications/notification.dart';
import 'package:silvertime/models/notifications/notification_subject.dart';

class NotificationDialog extends StatefulWidget {
  final NotificationSubject subject;
  final PushNotification notification;
  const NotificationDialog({Key? key, required this.notification, required this.subject}) : super(key: key);

  @override
  State<NotificationDialog> createState() => _NotificationDialogState();
}

class _NotificationDialogState extends State<NotificationDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container (
        padding: const EdgeInsets.all(16),
        child: Column (
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text (
              widget.notification.title,
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text (
              widget.notification.body,
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 16,),
            Text (
              "${widget.notification.sentDate.dateTimeString} - ${widget.notification.date.dateTimeString}",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 16),
            Container (
              decoration: BoxDecoration (
                borderRadius: BorderRadius.circular(24),
                color: widget.subject.color,
                boxShadow: [
                  BoxShadow (
                    blurRadius: 4,
                    spreadRadius: 3,
                    color: widget.subject.color.withOpacity(0.4),
                  )
                ]
              ),
              padding: const EdgeInsets.all(4),
              child: Text (
                widget.subject.name,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: getColorContrast(widget.subject.color)
                ),
              ),
            ),
            const SizedBox(height: 16),
            Align (
              alignment: Alignment.bottomRight,
              child: TextButton (
                onPressed: Navigator.of(context).pop,
                child: Text (
                  S.of(context).okay,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: Theme.of(context).primaryColorLight
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
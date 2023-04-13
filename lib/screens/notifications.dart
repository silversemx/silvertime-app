import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http_request_utils/models/http_exception.dart';
import 'package:provider/provider.dart';
import 'package:silvertime/include.dart';
import 'package:silvertime/models/notifications/notification.dart';
import 'package:silvertime/models/notifications/notification_subject.dart';
import 'package:silvertime/providers/notifications/notifications.dart';
import 'package:silvertime/providers/notifications/push_notifications.dart';
import 'package:silvertime/style/container.dart';
import 'package:silvertime/widgets/common/bottom_bar.dart';
import 'package:silvertime/widgets/in_app_messages/confirm_dialog.dart';
import 'package:silvertime/widgets/in_app_messages/error_dialog.dart';
import 'package:silvertime/widgets/notification_dialog.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);
  static const String routeName = "/notifications";

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> with TickerProviderStateMixin{
  bool _loading = true;
  late TabController _tabController;
  List<NotificationSubject> _subjects = [];
  
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => _fetchInfo ());
  }
  
  @override
  void reassemble() {
    Future.delayed(Duration.zero, () => _fetchInfo ());
    super.reassemble();
  }

  void _fetchInfo() async {
    setState(() {
      _loading = true;
    });
    try {
      NotificationsManager.instance.loadNotifications();
      Notifications notifications = Provider.of<Notifications> (
        context, listen: false
      );
      _subjects = await notifications.getSubjects();
    } on HttpException catch(error) {
      showErrorDialog(context, exception: error);
    } finally {
      _subjects.add(
        NotificationSubject (
          color: const Color.fromARGB(105, 68, 81, 97),
          id: "other_internal",
          name: S.of(context).serviceType_other,
          description: "Other subject",
          date: DateTime.now ()
        )
      );

      _tabController = TabController(length: _subjects.length, vsync: this);
      setState(() {
        _loading = false;
      });
    }
  }

  Widget _tabs () {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16
      ),
      child: CustomDropdownFormField<String>(
        value: _subjects [_tabController.index].id, 
        items: _subjects.map<String> (
          (subject)=> subject.id
        ).toList (), 
        onChanged: (val) {
          _tabController.animateTo(
            _subjects.indexWhere((element) => element.id == val)
          );
        }, 
        name: (val) {
          return _subjects.firstWhere((element) => element.id == val).name;
        }, 
        label: S.of  (context).subject, 
        validation: false
      ),
    );
  }
  
  Widget _notification (PushNotification notification) {
    return InkWell(
      onTap: () async {
        NotificationSubject? subject = _subjects.firstWhereOrNull((element) => element.id == notification.subject);

        if (subject?.name == "Result") {
          locator<NavigationService> ().navigateTo("/payload-indicators", queryParams: {
            "payload": notification.data ["payload"],
          });
        } else {
          await showDialog (
            context: context,
            builder: (ctx) => NotificationDialog (
              notification: notification,
              subject:_subjects.firstWhereOrNull((element) => element.id == notification.subject) ?? _subjects.last,
            )
          );
        }
        NotificationsManager.instance.changeNotificationReadState(notification.id);
      },
      child: Container (
        decoration: containerDecoration,
        margin: const EdgeInsets.symmetric(
          vertical: 16
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 32
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Visibility(
              visible: !notification.read,
              child: Container (
                width: 8,
                height: 8,
                decoration: BoxDecoration (
                  shape: BoxShape.circle,
                  color: Colors.amber [800],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.amber[800]!.withOpacity(0.4),
                      spreadRadius: 5,
                      blurRadius: 8
                    )
                  ]
                ),
              ),
            ),
            const SizedBox(width: 32),
            Expanded(
              child: Column (
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text (
                    notification.title,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(height: 16),
                  Text (
                    notification.body
                  )
                ],
              ),
            ),
          ],
        )
      ),
    );
  }

  Widget _notifications (List<PushNotification> notifications) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16
      ),
      child: ListView.builder(
        itemCount: notifications.length + 1,
        itemBuilder: (ctx, i) {
          if (notifications.length == i) {
            return const SizedBox(
              height: 32,
            );
          }
          PushNotification notification = notifications [i];
          return Slidable(
            startActionPane: ActionPane (
              motion: const DrawerMotion(),
              // dismissible: DismissiblePane(onDismissed: () {}),
              children: [
                SlidableAction(
                  onPressed: (ctx) async {
                    bool? retval = await showConfirmDialog(context, title: S.of(context).areYouSure, body: S.of(context).thisCantBeUndone);
    
                    if (retval ?? false) {
                      NotificationsManager.instance.deleteNotification(notification.id);
                    }
                  },
                  backgroundColor: Theme.of(context).secondaryHeaderColor,
                  icon: Icons.delete,
                )
              ],
            ),
            child: Container(
              child: _notification(notification)
            ),
          );
        },
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushReplacementNamed("/home");
        return false;
      },
      child: Scaffold(
        bottomNavigationBar: const BottomBar(),
        appBar: AppBar (
          title: Text (
            S.of (context).notifications,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        body: SafeArea(
          bottom: false,
          child: StreamBuilder<List<PushNotification>>(
            stream: NotificationsManager.instance.notificationStream,
            builder: (context, snapshot) {
              if (_loading) {
                return Center (
                  child: SpinKitDoubleBounce (
                    color: Theme.of(context).primaryColor,
                    size: 24,
                  ),
                );
              }
              Map<String, List<PushNotification>> notificationsGroupedBySubject = (
                snapshot.data ?? []).groupListsBy((element) => element.subject
              );
        
              List<Widget> children = [];
              for (NotificationSubject subject in _subjects) {
                List<PushNotification>? notifs = notificationsGroupedBySubject [subject.id];
            
                if (notifs != null) {
                  children.add (
                    _notifications(notifs),
                  );
                } else {
                  children.add (
                    Center (
                      child: Text (
                        S.of (context).noInformation,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    )
                  );
                }
              }
        
              return Column (
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  _tabs (),
                  Expanded(
                    child: ExtendedTabBarView(
                      controller: _tabController,
                      children: children
                    ),
                  )
                ],
              );
            }
          ),
        )
      ),
    );
  }
}
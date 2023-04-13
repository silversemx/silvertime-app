import 'package:http_request_utils/models/http_exception.dart';
import 'package:provider/provider.dart';
import 'package:silvertime/include.dart';
import 'package:silvertime/models/status/reports/report.dart';
import 'package:silvertime/models/user/user.dart';
import 'package:silvertime/providers/auth.dart';
import 'package:silvertime/providers/status/reports.dart';
import 'package:silvertime/providers/users.dart';
import 'package:silvertime/style/container.dart';
import 'package:silvertime/widgets/in_app_messages/error_dialog.dart';
import 'package:silvertime/widgets/quill/quill_reader.dart';
import 'package:skeletons/skeletons.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});
  static const String routeName = "/report";

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  Report? report;
  bool _loading = true;
  
  @override
  void initState() {
    super.initState();
    Future.microtask(() => _fetchInfo ());
  }
  
  @override
  void reassemble() {
    Future.microtask(() => _fetchInfo ());
    super.reassemble();
  }

  void _fetchInfo() async {
    setState(() {
      _loading = true;
    });
    try {
      report = await Provider.of<Reports> (context, listen: false).getReport(
        getQueryParam(context, "report")!
      );

      if (report == null) {
        throw HttpException(
          S.of (context).noInformation,
          status: 404,
          code: Code.request
        );
      }
    } on HttpException catch(error) {
      await showErrorDialog(context, exception: error);
      Navigator.of (context).pop ();
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  Widget _richValue (String key, String value, {Color? color}) {
    return RichText (
      text: TextSpan (
        text: key,
        style: Theme.of(context).textTheme.displaySmall,
        children: [
          const TextSpan (
            text: ": "
          ),
          TextSpan(
            text: value,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: color
            )
          )
        ]
      ),
    );
  }

  Widget _reportPriority () {
    if (_loading) {
      return SkeletonAvatar (
        style: SkeletonAvatarStyle (
          borderRadius: BorderRadius.circular(24),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.1
        ),
      );
    } else {
      return Container (
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: containerDecoration.copyWith(
          color: report!.priority.color.withOpacity(0.3),
          boxShadow: [
            BoxShadow (
              blurRadius: 12,
              spreadRadius: 2,
              offset: Offset.zero,
              color: report!.priority.color.withOpacity(0.1) 
            )
          ]
        ),
        child: Center (
          child: Text (
            report!.priority.name(context),
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
              color: report!.priority.color
            ),
          ),
        ),
      );
    }
  }

  Widget _reportTypes () {
    return Container (
      decoration: containerDecoration.copyWith(
        color: UIColors.hint.withOpacity(0.15)
      ),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: Wrap (
        alignment: WrapAlignment.spaceAround,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 16,
        runSpacing: 16,
        children: _loading
        ? List.generate (3, 
        (i) => i).map<Widget> (
          (i) => SkeletonAvatar (
            style: SkeletonAvatarStyle( 
              borderRadius: BorderRadius.circular(32),
              height: 24,
              width: 150
            ),
          )
        ).toList ()
        : [
          _richValue(S.of (context).type, report!.type.name (context)),
          _richValue(S.of (context).scope, report!.scope.name (context))
        ],
      ),
    );
  }

  Widget _userInfo () {
    if (_loading) {
      return SkeletonAvatar (
        style: SkeletonAvatarStyle (
          borderRadius: BorderRadius.circular(24),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.1
        ),
      );
    } else {
      return Center(
        child: FutureBuilder<User?>(
          future: Provider.of<Users> (context, listen: false).getUser(report!.user),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text (
                "${S.of (context).postedBy} ${snapshot.data?.fullName}",
                style: Theme.of(context).textTheme.displaySmall,
              );
            } else {
              return Text (
                S.of (context).noInformation,
                style: Theme.of(context).textTheme.bodyLarge,
              );
            }
          }
        ),
      );
    }
  }

  Widget _serviceAndInstanceInfo () {
    return Container (
      width: double.infinity,
      decoration: containerDecoration.copyWith(
        color: UIColors.maintenance.withOpacity(0.3),
      ),
      padding: const EdgeInsets.all(16),
      child: _loading
      ? SkeletonListView (
        scrollable: false,
        itemCount: 2,
        itemBuilder: (ctx, i) {
          return const SkeletonLine (
            style: SkeletonLineStyle (
              height: 24,
              maxLength: 55,
              minLength: 45,
              randomLength: true
            ),
          );
        },
      )
      : Column (
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _richValue(
            S.of (context).service,
            report!.serviceName ?? S.of(context).noInformation
          ),
          const SizedBox(height: 16),
          _richValue(
            S.of (context).instance,
            report!.instanceName ?? S.of(context).noInformation
          ),
        ],
      ),
    );
  }

  Widget _image () {
    return Center(
      child: SizedBox (
        height: MediaQuery.of(context).size.height * 0.3,
        child: Image.network (
          "$serverURL/api/state/reports/${report?.id}/image",
          fit: BoxFit.contain,
          headers: {
            "Authorization": Provider.of<Auth> (context, listen: false).token!
          },
          errorBuilder: (ctx, _ ,__) {
            return Container ();
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: _loading
        ? SkeletonLine(
          style: SkeletonLineStyle (
            borderRadius: BorderRadius.circular(20),
            height: 24,
            maxLength: 150,
            minLength: 75,
            randomLength: true
          ),
        )
        : Text (
          report!.title,
          style: Theme.of(context).textTheme.displayMedium,
        )
      ),
      body: Container (
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column (
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _reportPriority (),
              const SizedBox(height: 16),
              Center(
                child: report?.status.widget(context) 
                ?? Container ()
              ),
              const SizedBox(height: 16),
              _reportTypes (),
              const SizedBox(height: 16),
              Text (
                S.of(context).description,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 16),
              Container (
                decoration: containerDecoration,
                padding: const EdgeInsets.all(16),
                child: _loading
                ? SkeletonAvatar(
                  style: SkeletonAvatarStyle (
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    borderRadius: BorderRadius.circular(24)
                  ),
                )
                : QuillReaderWidget (
                  value: report!.text,
                ),
              ),
              const SizedBox(height: 16),
              _serviceAndInstanceInfo (),
              const SizedBox(height: 16),
              Text (
                S.of (context).userInformation,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(height: 16),
              _userInfo (),
              const SizedBox(height: 16),
              _image (),
              const SizedBox(height: 16),
              report!.solution != null
              ? Container (
                decoration: containerDecoration.copyWith(
                  color: UIColors.inputSuccess
                ),
                padding: const EdgeInsets.all(16),
                child: _loading
                ? SkeletonAvatar(
                  style: SkeletonAvatarStyle (
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    borderRadius: BorderRadius.circular(24)
                  ),
                )
                : QuillReaderWidget (
                  value: report!.solution,
                )
              )
              : Container (),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
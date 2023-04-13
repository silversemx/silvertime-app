import 'package:http_request_utils/models/http_exception.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:silvertime/include.dart';
import 'package:silvertime/models/status/reports/report.dart';
import 'package:silvertime/providers/status/reports.dart';
import 'package:silvertime/screens/reports/report_input.dart';
import 'package:silvertime/style/container.dart';
import 'package:silvertime/widgets/common/bottom_bar.dart';
import 'package:silvertime/widgets/in_app_messages/error_dialog.dart';
import 'package:silvertime/widgets/in_app_messages/status_snackbar.dart';
import 'package:silvertime/widgets/quill/quill_reader.dart';
import 'package:skeletons/skeletons.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});
  static const String routeName = "/reports";

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  bool _loading = true;
  int _currentPage = 0;
  int get currentPage => _currentPage;

  set currentPage (int newPage) {
    _currentPage = newPage;
    _fetchInfo ();
  }

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

  Future<void> _fetchInfo() async {
    setState(() {
      _loading = true;
    });
    try {
      await Provider.of<Reports> (context, listen: false).getReports(
        skip: _currentPage * 20, limit: 20
      );
    } on HttpException catch(error) {
      showErrorDialog(context, exception: error);
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }
  
  void _create () async {
    bool? retval = await Navigator.of (context).push (
      PageTransition(
        child: const InputReportScreen (), 
        type: PageTransitionType.fade
      )
    );

    if (retval ?? false){
      showStatusSnackbar(context, S.of (context).reportSuccessfullyCreated);
    }
  }

  Widget _title () {
    return SizedBox (
      width: double.infinity,
      child: Wrap (
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        runSpacing: 16,
        spacing: 16,
        children: [
          Text (
            S.of (context).reports,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          ElevatedButton (
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              shape: MaterialStateProperty.all(const CircleBorder())
            ),
            onPressed: _create,
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon (
                Icons.add,
                color: UIColors.white,
              ),
            ),
          )
        ],
      ),
    );
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

  
  Widget _report (Report report) {
    return InkWell(
      onTap: () {
        locator<NavigationService> ()
        .navigateTo(
          "/report", 
          queryParams: {"report": report.id}
        );
      },
      child: Container (
        margin: const EdgeInsets.only(
          bottom: 16
        ),
        decoration: containerDecoration,
        padding: const EdgeInsets.all(16),
        child: Column (
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text (
              report.date.dateTimeString,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text (
                      report.title,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    _richValue(
                      S.of (context).priority, 
                      report.priority.name(context),
                      color: report.priority.color
                    ),
                  ],
                ),
                report.status.widget(context)
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 16
              ),
              decoration: containerDecoration.copyWith(
                color: Theme.of(context).scaffoldBackgroundColor
              ),
              padding: const EdgeInsets.all(8),
              child: QuillReaderWidget(
                value: report.text,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox (
              width: double.infinity,
              child: Wrap (
                alignment: WrapAlignment.spaceAround,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  _richValue(
                    S.of (context).scope, report.scope.name (context),
                  ),
                  _richValue(
                    S.of (context).type, report.type.name(context),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: report.solution != null,
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 16
                ),
                decoration: containerDecoration.copyWith(
                  color: UIColors.inputSuccess.withOpacity(0.3)
                ),
                padding: const EdgeInsets.all(8),
                child: QuillReaderWidget(
                  value: report.solution,
                ),
              ),
            ),
          ],
        )
      ),
    );
  }

  Widget _reports () {
    return Consumer<Reports> (
      builder: (ctx, reports, _) {
        if (_loading) {
          return ListView.separated (
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (ctx, i) {
              return SkeletonAvatar (
                style: SkeletonAvatarStyle (
                  borderRadius: BorderRadius.circular(20),
                  height: 70,
                  width: double.infinity,
                ),
              );
            },
            separatorBuilder: (ctx, i) => const SizedBox (height: 16),
          );
        } else if (reports.reports.isEmpty) {
          return Container (
            constraints: BoxConstraints (
              minHeight: MediaQuery.of(context).size.height * 0.7,
            ),
            child: Center (
              child: Text (
                S.of (context).noInformation,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            )
          );
        } else {
          return ListView.builder (
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: reports.reports.length,
            itemBuilder: (ctx, i) {
              return _report (reports.reports [i]);
            },
          );
        }
      },
    );
  }

  Widget _pageIndicator () {
    return Center (
      child: Container (
        decoration: containerDecoration.copyWith(
          boxShadow: [
            BoxShadow (
              color: Theme.of(context).shadowColor,
              blurRadius: 5,
              spreadRadius: 1
            )
          ]
        ),
        padding: const EdgeInsets.all(4),
        child: Row (
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton (
              icon: const Icon (
                Icons.keyboard_arrow_left,
                size: 24,
              ),
              onPressed: () {
                if (_currentPage > 0) {
                  currentPage = _currentPage -1;
                }
              },
            ),
            Text (
              "${_currentPage + 1} / ${
                Provider.of<Reports> (context).pages
              }",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            IconButton (
              icon: const Icon (
                Icons.keyboard_arrow_right,
                size: 24,
              ),
              onPressed: () {
                if (
                  _currentPage 
                  < Provider.of<Reports> (context, listen: false).pages - 1
                ) {
                  currentPage = _currentPage + 1;
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      bottomNavigationBar: const BottomBar(),
      body: SafeArea(
        bottom: false,
        child: RefreshIndicator(
          onRefresh: () async {
            await _fetchInfo();
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: SingleChildScrollView(
                  child: Container (
                    constraints: BoxConstraints (
                      minHeight: MediaQuery.of(context).size.height
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16
                    ),
                    child: Column (
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        _title(),
                        const SizedBox(height: 16),
                        _reports (),
                        const SizedBox(height: 56),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned (
                bottom: 16,
                right: 16,
                child: _pageIndicator(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
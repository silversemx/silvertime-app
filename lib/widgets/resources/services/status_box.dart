import 'package:flutter/scheduler.dart';
import 'package:http_request_utils/models/http_exception.dart';
import 'package:provider/provider.dart';
import 'package:silvertime/include.dart';
import 'package:silvertime/models/overview.dart';
import 'package:silvertime/models/resources/service/service.dart';
import 'package:silvertime/providers/overview.dart';
import 'package:silvertime/screens/resources/service_overview.dart';
import 'package:silvertime/style/container.dart';
import 'package:silvertime/widgets/in_app_messages/error_dialog.dart';
import 'package:skeletons/skeletons.dart';

class StatusBoxWidget extends StatefulWidget {
  final Service service;
  const StatusBoxWidget({
    super.key,
    required this.service
  });

  @override
  State<StatusBoxWidget> createState() => _StatusBoxWidgetState();
}

class _StatusBoxWidgetState extends State<StatusBoxWidget> {
  bool _loading = true;
  final ScrollController _scrollController = ScrollController();
  late Overview overview;
  double unitIndicatorWidth = 16;
  double unitIndicatorRightMargin = 12;

  void _initController () async {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
          _scrollController.position.maxScrollExtent, 
          duration: const Duration (milliseconds: 300), 
          curve: Curves.bounceIn
        );
    });
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(_fetchInfo);
  }

  @override
  void reassemble() {
    super.reassemble();
    Future.microtask(_fetchInfo);
  }

  void _fetchInfo() async {
    setState(() {
      _loading = true;
    });
    try {
      overview = await Provider.of<Overviews> (
        context, listen: false
      ).getOverviewState(
        widget.service.id
      );
      if (_scrollController.positions.isNotEmpty) {
        _initController();
      }
    } on HttpException catch(error) {
      showErrorDialog(context, exception: error);
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
      }
    }
  }

  Widget _statusIndicator (OverviewData data) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration (
        color: data.color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: data.color.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 3,
            offset: Offset.zero
          )
        ]
      ),
    );
  }

  Widget _title () {
    return SizedBox(
      width: double.infinity,
      child: Wrap (
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 16,
        runSpacing: 16,
        children: [
          Text (
            widget.service.name,
            style: Theme.of(context).textTheme.displaySmall,
          ),
          _statusIndicator(OverviewData (date: DateTime.now (), instances: [], interruptions: [], maintenances: []))
        ],
      ),
    );
  }

  Widget _unitIndicator (OverviewData data) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push (
          MaterialPageRoute(
            builder: (ctx) => ServiceOverviewScreen (
              data: data,
              service: widget.service,
            )
          )
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: unitIndicatorRightMargin),
        width: unitIndicatorWidth,
        height: 35,
        decoration: BoxDecoration (
          color: data.color,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: data.color.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 0.5,
              offset: Offset.zero
            )
          ]
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: containerDecoration,
      padding: const EdgeInsets.all(16),
      child: Column (
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title (),
          const SizedBox(height: 16),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics (),
            scrollDirection: Axis.horizontal,
            controller: _scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Builder(
                  builder: (context) {
                    if (_loading) {
                      return SkeletonAvatar (
                        style: SkeletonAvatarStyle (
                          height: 35,
                          width: MediaQuery.of(context).size.width,
                          borderRadius: BorderRadius.circular(24)
                        ),
                      );
                    } else {
                      return SizedBox(
                        height: 35,
                        child: Row (
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: overview.data.map<Widget> (
                            (data) => _unitIndicator(data)
                          ).toList(),
                        )
                      );
                    }
                  }
                ),
                const SizedBox(height: 8),
                _loading
                ? Container ()
                : SizedBox(
                  width: constrainedBigWidth(
                    context, 
                    (
                      overview.data.length * unitIndicatorWidth + (
                        unitIndicatorRightMargin * overview.data.length
                      )
                    ).toDouble(),
                    constraintWidth: 150
                  ),
                  child: Row (
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text (
                        Provider.of<Overviews> (context, listen: false).range.end
                        .equalsIgnoreTime(DateTime.now ())
                        ? "${overview.data.length} days ago"
                        : Provider.of<Overviews> (
                          context, listen: false
                        ).range.start.dateString,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: UIColors.hint
                        ),
                      ),
                      const Expanded(
                        child: Divider (
                          indent: 10,
                          endIndent: 10,
                        )
                      ),
                      Text (
                        Provider.of<Overviews> (context, listen: false).range.end
                        .equalsIgnoreTime(DateTime.now ())
                        ? "Today"
                        : Provider.of<Overviews> (
                          context, listen: false
                        ).range.end.dateString,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: UIColors.hint
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
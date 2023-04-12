import 'dart:async';
import 'dart:math';

import 'package:flutter/scheduler.dart';
import 'package:http_request_utils/models/http_exception.dart';
import 'package:provider/provider.dart';
import 'package:silvertime/include.dart';
import 'package:silvertime/models/overview/overview.dart';
import 'package:silvertime/models/overview/overview_types.dart';
import 'package:silvertime/models/resources/service/service.dart';
import 'package:silvertime/models/status/interruption/interruption.dart';
import 'package:silvertime/models/status/maintenance/maintenance.dart';
import 'package:silvertime/providers/overview.dart';
import 'package:silvertime/screens/resources/service_overview.dart';
import 'package:silvertime/style/container.dart';
import 'package:silvertime/widgets/in_app_messages/error_dialog.dart';
import 'package:skeletons/skeletons.dart';

class StatusBoxWidget extends StatefulWidget {
  final Service service;
  final bool dummy;
  final OverviewFilter filter;
  const StatusBoxWidget({
    super.key,
    this.dummy = false,
    this.filter = OverviewFilter.none,
    required this.service
  });

  @override
  State<StatusBoxWidget> createState() => _StatusBoxWidgetState();
}

class _StatusBoxWidgetState extends State<StatusBoxWidget> {
  bool _loading = true;
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _dummyTooltipKey = GlobalKey();
  Overview overview = Overview.empty ();
  double unitIndicatorWidth = 16;
  double unitIndicatorRightMargin = 12;
  Timer? dummyTimer;
  OverviewData dummyServiceStatus = OverviewData.empty ();

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
  void dispose() {
    dummyTimer?.cancel();
    super.dispose();
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

  void _initDummyData () {
    setState(() {
      overview = Overview (
      service: widget.service,
      instances: [],
      data: List<OverviewData>.generate(
        10, 
        (index) => OverviewData (
          date: DateTime (2023, 3, index),
          instances: List<Interruption>.generate(
            Random().nextInt(2), 
            (index) => Interruption.empty (),
          ),
          interruptions: List<Interruption>.generate(
            Random().nextInt(2), 
            (index) => Interruption.empty (),
          ),
          maintenances: List<Maintenance>.generate(
            Random().nextInt(2), 
            (index) => Maintenance.empty (),
          )
        )
      )
    );
    dummyServiceStatus = overview.data.last;
  });
  dummyTimer = Timer.periodic(
    const Duration (seconds: 1), 
    (timer) {
      overview = Overview (
        service: widget.service,
        instances: [],
        data: List<OverviewData>.generate(
          10, 
          (index) => OverviewData (
            date: DateTime (2023, 3, index),
            instances: List<Interruption>.generate(
              Random().nextInt(2), 
              (index) => Interruption.empty (),
            ),
            interruptions: List<Interruption>.generate(
              Random().nextInt(2), 
              (index) => Interruption.empty (),
            ),
            maintenances: List<Maintenance>.generate(
              Random().nextInt(2), 
              (index) => Maintenance.empty (),
            )
          )
        )
      );
      dummyServiceStatus = overview.data.last;
      setState(() { });
    });
  }

  void _fetchInfo() async {
    setState(() {
      _loading = true;
    });
    try {
      if (widget.dummy) {
        _initDummyData();
      } else {
        overview = await Provider.of<Overviews> (
          context, listen: false
        ).getOverviewState(
          widget.service.id
        );

        List<OverviewData> overviewData = overview.data;
          switch (widget.filter) {
            case OverviewFilter.none:
              break;
            case OverviewFilter.interruptions:
              overviewData = overviewData.where (
                (data) => data.interruptions.isNotEmpty
              ).toList();
              break;
            case OverviewFilter.maintenances:
              overviewData = overviewData.where (
                (data) => data.maintenances.isNotEmpty
              ).toList();
              break;
            case OverviewFilter.instances:
              overviewData = overviewData.where (
                (data) => data.instances.isNotEmpty
              ).toList();
              break;
          }

          overview.data = overviewData;

        if (_scrollController.positions.isNotEmpty) {
          _initController();
        }
      }
    } on HttpException catch(error) {
      showErrorDialog(context, exception: error);
    } finally {
      if (mounted) {
        setState(() {
          _loading = false;
        });
        dynamic tooltip = _dummyTooltipKey.currentState;
        tooltip?.ensureTooltipVisible ();
      }
    }
  }

  Widget _statusIndicator (OverviewData data) {
    OverviewData statusData = widget.dummy
      ? dummyServiceStatus
      : data;

    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration (
        color: statusData.color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: statusData.color.withOpacity(0.3),
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
    return Tooltip(
      message: data.date.dateString,
      child: InkWell(
        onTap: () {
          if (!widget.dummy) {
            Navigator.of(context).push (
              MaterialPageRoute(
                builder: (ctx) => ServiceOverviewScreen (
                  data: data,
                  service: widget.service,
                  instances: overview.instances,
                )
              )
            );
          }
        },
        child: Container(
          margin: EdgeInsets.only(right: unitIndicatorRightMargin),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
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
              const SizedBox(height: 4),
              Text (
                "${
                  data.date.day.toString().padLeft(2, "0")
                }-${
                  data.date.month.toString().padLeft(2, "0")
                }",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: UIColors.hint
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _daysIndicator () {
    return SizedBox(
      width: constrainedBigWidth(
        context, 
        (
          overview.data.length * (unitIndicatorWidth + 13) + (
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
            ? S.of(context).daysAgo(overview.data.length)
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
            physics: overview.data.length > 11
            ? const BouncingScrollPhysics ()
            : const NeverScrollableScrollPhysics(),
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
                    } else if (overview.data.isEmpty){
                      return Text (
                        S.of(context).noInformation,
                        style: Theme.of(context).textTheme.bodyLarge
                      );
                    } else {
                      return SizedBox(
                        height: 55,
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
                _loading || overview.data.isEmpty
                ? Container ()
                : _daysIndicator()
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
import 'dart:async';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http_request_utils/models/http_exception.dart';
import 'package:silvertime/include.dart';
import 'package:silvertime/models/history/status_update.dart';
import 'package:silvertime/style/container.dart';
import 'package:silvertime/widgets/in_app_messages/error_dialog.dart';
import 'package:silvertime/widgets/quill/quill_reader.dart';

class StatusUpdateDialog<T> extends StatefulWidget {
  final T? currentValue;
  final List<T> values;
  final bool Function (T)? displayStatus;
  final Future<List<StatusUpdate<T>>> Function () getHistory;
  final Widget Function (T) getWidget;
  final bool text;
  const StatusUpdateDialog({
    Key? key, this.currentValue, 
    required this.values,
    required this.getWidget,
    required this.getHistory,
    this.text = false,
    this.displayStatus,
  }) : super(key: key);

  @override
  State<StatusUpdateDialog<T>> createState() => _StatusUpdateDialogState<T>();
}

class _StatusUpdateDialogState<T> extends State<StatusUpdateDialog<T>> {
  bool _loading = false;
  List<StatusUpdate<T>> history = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState () {
    super.initState();
    Future.microtask(() => _fetchInfo ());
  }

  void _fetchInfo() async {
    setState(() {
      _loading = true;
    });
    try {
      history = await widget.getHistory ();
    } on HttpException catch(error, bt) {
      Completer().completeError (error, bt);
      showErrorDialog(context, exception: error);
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  Widget _statusUpdateData (StatusUpdate<T> data) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text (
            data.date.dateString,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 8),
          Row (
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.getWidget (data.previousStatus),
              Icon (
                Icons.keyboard_double_arrow_right, 
                size: 24, 
                color: Theme.of(context).primaryColor
              ),
              widget.getWidget (data.currentStatus),
            ],
          ),
          widget.text && data.text != null
          ? Container (
            margin: const EdgeInsets.symmetric(
              vertical: 16
            ),
            width: double.infinity,
            decoration: containerDecoration.copyWith(
              color: Theme.of(context).scaffoldBackgroundColor
            ),
            padding: const EdgeInsets.all(16),
              child: QuillReaderWidget (
              value: data.text,
            ),
          )
          : Container (),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container (
        padding: const EdgeInsets.symmetric(horizontal: 24),
        constraints: BoxConstraints (
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        child: _loading
        ? Center (
          child: SpinKitDoubleBounce(
            color: Theme.of(context).primaryColor,
            size: 24,
          ),
        )
        : Column(
          children: [
            const SizedBox(height: 32),
            Text (
              S.of(context).history,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                itemCount: history.length,
                itemBuilder: (ctx, i) {
                  return _statusUpdateData(history[i]);
                },
                separatorBuilder: (ctx, i) => const Divider (),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
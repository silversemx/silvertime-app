import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:silvertime/include.dart';
import 'package:silvertime/widgets/utils/confirm_row.dart';

class DateRangeCustomPickerDialog extends StatefulWidget {
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTimeRange selectedRange;
  const DateRangeCustomPickerDialog({
    super.key,
    required this.firstDate,
    required this.lastDate,
    required this.selectedRange,
  });

  @override
  State<DateRangeCustomPickerDialog> createState() => _DateRangeCustomPickerDialogState();
}

class _DateRangeCustomPickerDialogState extends State<DateRangeCustomPickerDialog> {
  late DateTimeRange range = DateTimeRange(
    start: widget.selectedRange.start, 
    end: widget.selectedRange.end
  );

  Widget _definedRangeValueButton (int days) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      child: ElevatedButton (
        onPressed: () {
          setState(() {
            range = DateTimeRange (
              start: DateTime.now ().subtract(Duration (days: days)),
              end: DateTime.now ()
            );
          });
        },
        child: Padding (
          padding: const EdgeInsets.all(0),
          child: Text (
            "$days ${S.of(context).days}",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: UIColors.white
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column (
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox.square(
            dimension: 300,
            child: RangePicker (
              firstDate: widget.firstDate,
              lastDate: widget.lastDate,
              onChanged: (DatePeriod period) {
                setState(() {
                  range =  DateTimeRange(
                    start: period.start, 
                    end: period.end
                  );
                });
                
              },
              datePickerStyles: DatePickerRangeStyles (
                selectedPeriodStartDecoration: BoxDecoration (
                  color: Theme.of(context).primaryColor,
                  borderRadius: const BorderRadius.only (
                    topLeft: Radius.circular(24),
                    bottomLeft: Radius.circular(24)
                  )
                ),
                selectedPeriodLastDecoration: BoxDecoration (
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: const BorderRadius.only (
                    topRight: Radius.circular(24),
                    bottomRight: Radius.circular(24)
                  )
                ),

              ),
              selectedPeriod: DatePeriod (
                range.start, range.end
              ),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 50,
            child: ListView (
              scrollDirection: Axis.horizontal,
              children: [
                const SizedBox(width: 16,),
                _definedRangeValueButton (30),
                _definedRangeValueButton (60),
                _definedRangeValueButton (90),
              ],
            ),
          ),
          const SizedBox(height: 16),
          ConfirmRow (
            onPressedCancel: Navigator.of(context).pop,
            onPressedOkay: () {
              Navigator.of (context).pop (range);
            },
          )
        ],
      ),
    );
  }
}
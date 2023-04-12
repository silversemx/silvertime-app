import 'package:silvertime/include.dart';

enum ReportType {
  none,
  internal,
  external,
  other
}

extension ReportTypeExt on ReportType {
  String name (BuildContext context) {
    switch (this) {
      case ReportType.none:
        return S.of (context).reportType_none;
      case ReportType.internal:
        return S.of (context).reportType_internal;
      case ReportType.external:
        return S.of (context).reportType_external;
      case ReportType.other:
        return S.of (context).reportType_other;
    }
  }
  
}

enum ReportStatus {
  none,
  created,
  viewed,
  removed
}

extension ReportStatusExt on ReportStatus {
  String name (BuildContext context) {
    switch (this) {
      case ReportStatus.none:
        return S.of(context).status_none;
      case ReportStatus.created:
        return S.of(context).status_created;
      case ReportStatus.viewed:
        return S.of(context).status_viewed;
      case ReportStatus.removed:
        return S.of(context).status_removed;
    }
  }

  String get emoji {
    switch (this) {
      case ReportStatus.none:
        return "";
      case ReportStatus.created:
        return "✔️";
      case ReportStatus.viewed:
        return "✅✅";
      case ReportStatus.removed:
        return "🔥";
    }
  }

  Color get color {
    switch (this) {
      case ReportStatus.none:
        return Colors.grey;
      case ReportStatus.created:
        return Colors.blue;
      case ReportStatus.viewed:
        return Colors.green;
      case ReportStatus.removed:
        return Colors.red;
    }
  }

  Widget widget (BuildContext context) {
    return Container (
      constraints: const BoxConstraints (
        minWidth: 110,
        minHeight: 70
      ),
      decoration: BoxDecoration (
        borderRadius: BorderRadius.circular(20),
        color: color,
        boxShadow: [
          BoxShadow (
            offset: Offset.zero,
            blurRadius: 4,
            spreadRadius: 3,
            color: color.withOpacity(0.2)
          )
        ]
      ),
      padding: const EdgeInsets.all(8),
      child: RichText (
        text: TextSpan (
          text: "${name (context)}\n",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: getColorContrast(color)
          ),
          children: [
            TextSpan (
              text: emoji,
              style: Theme.of(context).textTheme.headlineSmall
            )
          ]
        ),
        maxLines: 2,
        textAlign: TextAlign.center,
      )
    );
  }
}

enum ReportPriority {
  none,
  zero,
  one,
  two,
  three
}

extension ReportPriorityExt on ReportPriority {
  String name (BuildContext context) {
    switch (this) {
      case ReportPriority.none:
        return S.of(context).reportPriority_none;
      case ReportPriority.zero:
        return S.of(context).reportPriority_zero;
      case ReportPriority.one:
        return S.of(context).reportPriority_one;
      case ReportPriority.two:
        return S.of(context).reportPriority_two;
      case ReportPriority.three:
        return S.of(context).reportPriority_three;
    }
  }

  Color get color {
    switch (this) {
      case ReportPriority.none:
        return Colors.grey;
      case ReportPriority.zero:
        return Colors.red;
      case ReportPriority.one:
        return Colors.orange;
      case ReportPriority.two:
        return Colors.yellow;
      case ReportPriority.three:
        return Colors.blue;
    }
  }
}
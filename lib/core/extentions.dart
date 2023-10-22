import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../presentation/utils/constants.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../presentation/utils/colors.dart';
// import 'package:timeago/timeago.dart' as timeago;

extension ListExtensions<T> on List<T> {
  T? element(int index) {
    if (index >= 0 && this.length > index) return this[index];
    return null;
  }
}

extension DoubleTransform on double {
  String moneyFomart() {
    var amount = this.roundToDouble();
    // if (amount == null) {
    //   return "0.00";
    // }
    try {
      final formatCurrency = NumberFormat("#,##0", "en_US");
      return formatCurrency.format(amount);
    } catch (e) {
      return amount.toString();
    }
  }

  String dataFomart() {
    final bytes = this.roundToDouble();

    double kb = bytes / 1024;
    double mb = kb / 1024;
    double gb = mb / 1024;

// || gb <= -1

    if (gb >= 1 || gb <= -1) {
      return '${gb.toStringAsFixed(1)} GB';
    } else if (mb >= 1 || gb <= -1) {
      return '${mb.toStringAsFixed(0)} MB';
    } else {
      final decimal_bytes = bytes / 1000;
      return '${decimal_bytes.toStringAsFixed(0)} B';
    }
  }

  /* String currencyFormat(BuildContext context) {
    Locale locale = Localizations.localeOf(context);

    var format =
        NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');

    var amount = this.roundToDouble();
    // if (amount == null) {
    //   return "0.00";
    // }
    try {
      final formatCurrency = NumberFormat("#,###.00", "en_US");
      return format.currencySymbol + formatCurrency.format(amount);
    } catch (e) {
      return amount.toString();
    }
  } */
}

extension ImageIcon2 on ImageIcon {
  static ImageIcon asset(
    String assetName, {
    final Key? key,
    final double? size,
    final Color? color,
    final String? semanticLabel,
  }) {
    return ImageIcon(
      AssetImage(assetName),
      key: key,
      size: size,
      color: color,
      semanticLabel: semanticLabel,
    );
  }
}

// extension buttonPro on ButtonStyleButton {
//   Widget get shrink => Center(child: this);
// }

// extension Sdd on AssetImage {
//   Widget get icon {
//     return ImageIcon(
//       this,
//     );
//   }
// }

extension ColumnPro on Column {
  Widget get scrolls => SingleChildScrollView(child: this);
}

extension buttonPro on ButtonStyleButton {
  Widget get center => Center(child: this);
}

extension dateTime on DateTime {
  DateTime setTimeOfDay(TimeOfDay timeOfDay) => DateTime(
        this.year,
        this.month,
        this.day,
        timeOfDay.hour,
        timeOfDay.minute,
        this.second,
        this.millisecond,
        this.microsecond,
      );
  String get yMMMMEEEEdfomart => DateFormat.yMMMMEEEEd().format(this);

  String get jmFomart => DateFormat.jm().format(this); //"6:00 AM"

  String get yMMMdFomart => DateFormat.yMMMd().format(this);
}

extension timeOfDay on TimeOfDay {
  TimeOfDay toUtc() {
    final now = DateTime.now();
    final dt = now.setTimeOfDay(this).toUtc();
    return TimeOfDay.fromDateTime(dt);
  }
}

extension Extras on GetxController {
  Future<T?> showAppBottomSheet<T>(Widget child) => Get.bottomSheet(
        child,
        backgroundColor: Colors.white,
        shape: kRoundedRectangularBorder(),
      );

  void showError(err, {bool clear = false}) {
    if (clear) Get.close(1);
    Get.showSnackbar(
      GetSnackBar(
        message: err,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future showMessage(msg, {bool clear = false}) {
    //print(Get.isDialogOpen);

    if (clear) Get.close(1);

    Get.showSnackbar(
      GetSnackBar(
        message: msg,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.green,
      ),
    );

    return Future.delayed(Duration(seconds: 1));
  }

  void get showLoadingState {
    Get.dialog(
      Container(
        child: Center(
          child: SpinKitCircle(
            color: AppColors.primary,
          ),
        ),
      ),
      barrierColor: Colors.white70,
      barrierDismissible: false,
      // TODO: Remove
    );
  }
}

String formatTimeOfDay(TimeOfDay tod) {
  final now = new DateTime.now();
  var dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);

  final format = DateFormat.jm(); //"6:00 AM"
  return format.format(dt);
}

// String getTimeAgo(String time) {
//   return timeago.format(DateTime.parse(time), locale: 'en_short');
// }

extension DateStringExtension on String {
  static String displayTimeAgoFromTimestamp(String timestamp) {
    final year = int.parse(timestamp.substring(0, 4));
    final month = int.parse(timestamp.substring(5, 7));
    final day = int.parse(timestamp.substring(8, 10));
    final hour = int.parse(timestamp.substring(11, 13));
    final minute = int.parse(timestamp.substring(14, 16));

    final DateTime itemDate = DateTime(year, month, day, hour, minute);
    final int diffInHours = DateTime.now().difference(itemDate).inHours;

    String timeAgo = '';
    String timeUnit = '';
    int timeValue = 0;

    if (diffInHours < 1) {
      final diffInMinutes = DateTime.now().difference(itemDate).inMinutes;
      timeValue = diffInMinutes;
      timeUnit = 'minute';
    } else if (diffInHours < 24) {
      timeValue = diffInHours;
      timeUnit = 'hour';
    } else if (diffInHours >= 24 && diffInHours < 24 * 7) {
      timeValue = (diffInHours / 24).floor();
      timeUnit = 'day';
    } else if (diffInHours >= 24 * 7 && diffInHours < 24 * 30) {
      timeValue = (diffInHours / (24 * 7)).floor();
      timeUnit = 'week';
    } else if (diffInHours >= 24 * 30 && diffInHours < 24 * 12 * 30) {
      timeValue = (diffInHours / (24 * 30)).floor();
      timeUnit = 'month';
    } else {
      timeValue = (diffInHours / (24 * 365)).floor();
      timeUnit = 'year';
    }

    timeAgo = timeValue.toString() + ' ' + timeUnit;
    timeAgo += timeValue > 1 ? 's' : '';

    return timeAgo + ' ago';
  }
}

String convertStringToDateTime(String date) {
  return DateFormat.yMMMd()
      .format(DateTime.parse(date).add(Duration(hours: 1)));
}

String convertStringTime(String date, {int hours = 1}) {
  return DateFormat.jm()
      .format(DateTime.parse(date).add(Duration(hours: hours)));
}

extension DateUtils on DateTime {
  bool get isToday {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return tomorrow.day == day &&
        tomorrow.month == month &&
        tomorrow.year == year;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day &&
        yesterday.month == month &&
        yesterday.year == year;
  }

  String get readable => DateFormat.yMMMd().format(this);
}

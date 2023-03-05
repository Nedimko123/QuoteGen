import 'package:flutter/material.dart';
import 'package:random_quote/features/settings/presentation/widgets/sheets/choose_notification_time.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void showQuoteTimePicker(BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28.sp))),
      context: context,
      builder: (context) => DraggableScrollableSheet(
          expand: false,
          builder: ((context, scrollController) => QuoteNotificationSheet(
                scrollController: scrollController,
              ))));
}

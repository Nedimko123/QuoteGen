import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_quote/features/common/loader/loader.dart';
import 'package:random_quote/features/common/presentation/layout_design/expanded_row.dart';
import 'package:random_quote/features/settings/domain/functions/remove_quote_notifications.dart';
import 'package:random_quote/features/settings/domain/functions/show_quote_activation_sheet.dart';
import 'package:random_quote/features/settings/domain/providers.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class QuoteNotifications extends ConsumerWidget {
  const QuoteNotifications({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final isQuoteNotificationActive =
        ref.watch(isQuoteNotificationActiveProvider);
    return isQuoteNotificationActive.maybeWhen(
        data: (isQuoteNotificationActive) {
          if (isQuoteNotificationActive == null) {
            return InkWell(
              onTap: () => showQuoteTimePicker(context),
              child: Text(
                'Activate quote notifications',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Theme.of(context).hintColor,
                ),
              ),
            );
          }
          final String formattedHours =
              isQuoteNotificationActive.hours.toString().padLeft(2, '0');
          final String formattedMinutes =
              isQuoteNotificationActive.minutes.toString().padLeft(2, '0');
          return ExpandedRow(
            flexChildrenRatio: const [3, 1],
            children: [
              Text(
                'Quotes activated at: $formattedHours:$formattedMinutes',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.green,
                ),
              ),
              InkWell(
                onTap: () async => await removeQuoteNotifications()
                    .whenComplete(() =>
                        ref.invalidate(isQuoteNotificationActiveProvider)),
                child: Text(
                  'CANCEL',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          );
        },
        orElse: () => const Loader());
  }
}

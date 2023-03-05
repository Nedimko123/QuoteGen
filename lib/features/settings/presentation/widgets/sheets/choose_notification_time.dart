// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_quote/features/common/presentation/layout_design/expanded_row.dart';
import 'package:random_quote/features/common/presentation/layout_design/sliver_scaffold.dart';
import 'package:random_quote/features/settings/domain/functions/set_quote_notification_time.dart';
import 'package:random_quote/features/settings/domain/models/quote_notification_time.dart';
import 'package:random_quote/features/settings/domain/providers.dart';
import 'package:random_quote/features/settings/presentation/widgets/time_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class QuoteNotificationSheet extends ConsumerWidget {
  final ScrollController scrollController;
  const QuoteNotificationSheet({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context, ref) {
    int hours = DateTime.now().hour;
    int minutes = DateTime.now().minute;
    return CustomScrollView(
        physics: bouncyAlwaysScrollablePsyhics,
        controller: scrollController,
        slivers: [
          SliverAppBar(
            centerTitle: true,
            title: Text(
              'Notifications',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24.sp),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: 100.w,
              color: Theme.of(context).backgroundColor,
              child: Column(children: [
                Text(
                  'Please select the time to recieve random quote notifications at:',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.sp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 40.h,
                  width: 90.w,
                  padding: EdgeInsets.symmetric(vertical: 15.sp),
                  decoration: BoxDecoration(
                      color: Theme.of(context).focusColor,
                      borderRadius: BorderRadius.all(Radius.circular(15.sp))),
                  child: TimePickerWithoutSeconds(
                    initialHours: hours,
                    initialMinutes: minutes,
                    onSelectedItemChangedHours: (p0) {
                      hours = p0;
                    },
                    onSelectedItemChangedMinutes: (p0) {
                      minutes = p0;
                    },
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                ExpandedRow(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          padding: EdgeInsets.all(20.sp),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.sp)),
                            color: Theme.of(context).focusColor,
                          ),
                          child: Center(
                            child: Text(
                              'CANCEL',
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async => await setQuoteNotificationTime(
                                QuoteTimeModel(hours: hours, minutes: minutes))
                            .whenComplete(() => ref
                                .invalidate(isQuoteNotificationActiveProvider))
                            .whenComplete(() => Navigator.of(context).pop()),
                        child: Container(
                          padding: EdgeInsets.all(20.sp),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.sp)),
                            color: Colors.green,
                          ),
                          child: Center(
                            child: Text(
                              'SAVE',
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ]),
                SizedBox(
                  height: 2.h,
                ),
              ]),
            ),
          ),
        ]);
  }
}

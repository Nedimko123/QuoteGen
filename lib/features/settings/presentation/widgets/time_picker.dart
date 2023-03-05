import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_quote/features/common/presentation/layout_design/expanded_row.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TimePickerWithoutSeconds extends ConsumerWidget {
  const TimePickerWithoutSeconds({
    Key? key,
    this.onSelectedItemChangedHours,
    this.onSelectedItemChangedMinutes,
    this.initialHours,
    this.initialMinutes,
    this.controllerH,
    this.controllerM,
  }) : super(key: key);

  final void Function(int)? onSelectedItemChangedHours;
  final void Function(int)? onSelectedItemChangedMinutes;
  final int? initialHours;
  final int? initialMinutes;
  final FixedExtentScrollController? controllerH;
  final FixedExtentScrollController? controllerM;
  @override
  Widget build(BuildContext context, ref) {
    return Column(
      children: [
        ExpandedRow(children: [
          Text(
            'H',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.sp),
          ),
          Text(
            'M',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.sp),
          ),
        ]),
        Expanded(
          child: ExpandedRow(flexChildrenRatio: const [
            8,
            1,
            8,
          ], children: [
            CupertinoPicker.builder(
                itemExtent: 5.h,
                childCount: 24,
                selectionOverlay: null,
                useMagnifier: true,
                magnification: 1.1,
                scrollController: controllerH ??
                    FixedExtentScrollController(initialItem: initialHours ?? 0),
                onSelectedItemChanged: onSelectedItemChangedHours,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.sp),
                    child: Text(
                      index > 9 ? '$index' : '0$index',
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  );
                }),
            Text(
              ':',
              style: TextStyle(fontSize: 18.sp),
            ),
            CupertinoPicker.builder(
                scrollController: controllerM ??
                    FixedExtentScrollController(
                        initialItem: initialMinutes ?? 0),
                itemExtent: 5.h,
                childCount: 60,
                selectionOverlay: null,
                useMagnifier: true,
                magnification: 1.1,
                onSelectedItemChanged: onSelectedItemChangedMinutes,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.sp),
                    child: Text(
                      index > 9 ? '$index' : '0$index',
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  );
                }),
          ]),
        )
      ],
    );
  }
}

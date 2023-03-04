import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:random_quote/features/common/presentation/layout_design/expanded_row.dart';
import 'package:random_quote/features/common/sheets/wrap_sheet.dart';
import 'package:random_quote/features/settings/domain/functions/delete_db.dart';

class DeleteHistorySheet extends ConsumerWidget {
  const DeleteHistorySheet({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return WrapBottomSheet(children: [
      Text(
        'Delete saved quotes',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24.sp),
      ),
      Text(
        'Are you sure you want to delete all of your saved quotes?',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16.sp),
      ),
      SizedBox(
        height: 5.h,
      ),
      ExpandedRow(padding: EdgeInsets.symmetric(horizontal: 10.sp), children: [
        InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            padding: EdgeInsets.all(20.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.sp)),
              color: Theme.of(context).focusColor,
            ),
            child: Center(
              child: Text(
                'Cancel',
                style: TextStyle(fontSize: 16.sp),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () async => await deleteDatabase(ref)
              .whenComplete(() => Navigator.of(context).pop()),
          child: Container(
            padding: EdgeInsets.all(20.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10.sp)),
              color: Colors.red,
            ),
            child: Center(
              child: Text(
                'Delete',
                style: TextStyle(fontSize: 16.sp, color: Colors.white),
              ),
            ),
          ),
        ),
      ]),
      if (Platform.isIOS)
        SizedBox(
          height: 1.h,
        ),
    ]);
    ;
  }
}

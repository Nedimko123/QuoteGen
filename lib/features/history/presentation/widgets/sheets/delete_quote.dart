// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_quote/features/common/presentation/layout_design/expanded_row.dart';
import 'package:random_quote/features/common/sheets/wrap_sheet.dart';
import 'package:random_quote/features/history/domain/functions/delete_from_db.dart';
import 'package:random_quote/quotes_repisotory/models/quote_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DeleteTransactionSheet extends ConsumerWidget {
  final QuoteModel quoteModel;
  const DeleteTransactionSheet({
    super.key,
    required this.quoteModel,
  });

  @override
  Widget build(BuildContext context, ref) {
    return WrapBottomSheet(children: [
      Text(
        'Delete Quote',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 24.sp),
      ),
      Text(
        'Are you sure you want to delete this Quote?',
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
          onTap: () async => await deleteTransaction(quoteModel, ref)
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

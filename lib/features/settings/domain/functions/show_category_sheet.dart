import 'package:flutter/material.dart';
import 'package:random_quote/features/settings/presentation/widgets/sheets/select_quote_categories.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void showCategorySheet(BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      // backgroundColor: Colors.transparent,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28.sp))),
      context: context,
      builder: (context) => DraggableScrollableSheet(
          expand: false,
          builder: ((context, scrollController) => QuoteCategorySheet(
                scrollController: scrollController,
              ))));
}

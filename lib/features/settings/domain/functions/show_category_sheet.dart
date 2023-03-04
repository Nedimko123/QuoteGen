import 'package:flutter/material.dart';
import 'package:random_quote/features/settings/presentation/widgets/sheets/select_quote_categories.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void showCategorySheet(BuildContext context) {
  showModalBottomSheet(
      isScrollControlled: true,
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.sp))),
      context: context,
      builder: (context) => const QuoteCategorySheet());
}

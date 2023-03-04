import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_quote/features/common/loader/loader.dart';
import 'package:random_quote/features/common/presentation/layout_design/expanded_row.dart';
import 'package:random_quote/features/common/presentation/layout_design/sliver_scaffold.dart';
import 'package:random_quote/features/settings/domain/functions/category_checkbox.dart';
import 'package:random_quote/features/settings/domain/functions/reset_quote_categories.dart';
import 'package:random_quote/features/settings/domain/providers.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class QuoteCategorySheet extends ConsumerWidget {
  const QuoteCategorySheet({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final quoteCategories = ref.watch(quoteCategoriesProvider);
    return quoteCategories.maybeWhen(
        data: (categories) {
          return SliverScaffold(slivers: [
            SliverToBoxAdapter(
              child: Column(children: [
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Quote Categories',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24.sp),
                ),
                Text(
                  'Please select quote categories:',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.sp),
                ),
                SizedBox(
                  height: 2.h,
                ),
              ]),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                    childCount: categories.length, ((context, index) {
              return Container(
                decoration: BoxDecoration(
                  color:
                      index % 2 == 0 ? Theme.of(context).highlightColor : null,
                ),
                padding:
                    EdgeInsets.symmetric(horizontal: 15.sp, vertical: 5.sp),
                child: ExpandedRow(
                  flexChildrenRatio: const [5, 1],
                  children: [
                    Text(
                      categories[index].name.toUpperCase(),
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    Checkbox(
                        value: categories[index].isActive,
                        onChanged: (value) async => await checkMarkCategory(
                            categories, value ?? false, ref, index)),
                  ],
                ),
              );
            }))),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  ExpandedRow(
                      padding: EdgeInsets.symmetric(horizontal: 10.sp),
                      children: [
                        InkWell(
                          onTap: () async => await resetQuoteCategories(ref),
                          child: Container(
                            padding: EdgeInsets.all(20.sp),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.sp)),
                              color: Theme.of(context).focusColor,
                            ),
                            child: Center(
                              child: Text(
                                'RESET',
                                style: TextStyle(fontSize: 16.sp),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: Container(
                            padding: EdgeInsets.all(20.sp),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.sp)),
                              color: Colors.green,
                            ),
                            child: Center(
                              child: Text(
                                'OK',
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ]),
                  if (Platform.isIOS)
                    SizedBox(
                      height: 1.h,
                    ),
                ],
              ),
            )
          ]);
        },
        orElse: () => const Loader());
  }
}

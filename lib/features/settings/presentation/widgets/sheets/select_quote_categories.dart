// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_quote/features/common/loader/loader.dart';
import 'package:random_quote/features/common/presentation/layout_design/expanded_row.dart';
import 'package:random_quote/features/common/presentation/layout_design/sliver_scaffold.dart';
import 'package:random_quote/features/settings/domain/functions/category_checkbox.dart';
import 'package:random_quote/features/settings/domain/functions/deselect_quote_categories.dart';
import 'package:random_quote/features/settings/domain/functions/reset_quote_categories.dart';
import 'package:random_quote/features/settings/domain/providers.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class QuoteCategorySheet extends ConsumerWidget {
  final ScrollController scrollController;
  const QuoteCategorySheet({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context, ref) {
    final quoteCategories = ref.watch(quoteCategoriesProvider);
    return quoteCategories.maybeWhen(
        data: (categories) {
          return CustomScrollView(
              physics: bouncyAlwaysScrollablePsyhics,
              controller: scrollController,
              slivers: [
                SliverAppBar(
                  centerTitle: true,
                  title: Text(
                    'Categories',
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
                        'Please select quote categories:',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16.sp),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 15.sp),
                          child: InkWell(
                            onTap: () async => deselectQuoteCategories(ref),
                            child: Text(
                              'Deselect all',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  color: Colors.indigo, fontSize: 16.sp),
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                        childCount: categories.length, ((context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: index % 2 == 0
                          ? Theme.of(context).highlightColor
                          : Theme.of(context).backgroundColor,
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
                  child: Container(
                    color: Theme.of(context).backgroundColor,
                    width: 100.w,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        ExpandedRow(
                            padding: EdgeInsets.symmetric(horizontal: 10.sp),
                            children: [
                              InkWell(
                                onTap: () async =>
                                    await resetQuoteCategories(ref),
                                child: Container(
                                  padding: EdgeInsets.all(20.sp),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.sp)),
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
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.sp)),
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
                        SizedBox(
                          height: 2.h,
                        ),
                      ],
                    ),
                  ),
                )
              ]);
        },
        orElse: () => const Loader());
  }
}

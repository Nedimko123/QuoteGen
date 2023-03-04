import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_quote/features/common/presentation/layout_design/expanded_row.dart';
import 'package:random_quote/features/common/presentation/layout_design/sliver_scaffold.dart';
import 'package:random_quote/features/homepage/domain/functions/generate_random_quote.dart';
import 'package:random_quote/features/homepage/domain/functions/save_to_db.dart';
import 'package:random_quote/features/homepage/domain/providers.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class QuoteGen extends ConsumerWidget {
  const QuoteGen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final randomQuote = ref.watch(randomQuoteProvider.state);
    return SliverScaffold(slivers: [
      const SliverAppBar(
        centerTitle: true,
        title: Text('QuoteGen'),
      ),
      SliverToBoxAdapter(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(),
            if (randomQuote.state == null)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h),
                child: Text(
                  'Press generate to generate a  random quote',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 16.sp),
                ),
              ),
            if (randomQuote.state != null)
              SizedBox(
                width: 90.w,
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '"${randomQuote.state!.quote}"',
                            style: TextStyle(
                              fontSize: 20.sp,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            '- ${randomQuote.state!.author}',
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          ExpandedRow(
                            children: [
                              Text(
                                randomQuote.state!.genre.value.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              InkWell(
                                onTap: () async => await saveData(ref),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(
                                    Icons.add,
                                    color: Theme.of(context).hintColor,
                                    size: 20.sp,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ]),
                  ),
                ),
              ),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: () => generateRandomQuote(ref),
              child: Container(
                width: 40.w,
                padding: EdgeInsets.all(15.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                    color: Theme.of(context).hintColor),
                child: Center(
                    child: Text(
                  'Generate',
                  style: TextStyle(
                      color: Theme.of(context).backgroundColor,
                      fontSize: 18.sp),
                )),
              ),
            )
          ],
        ),
      )
    ]);
  }
}

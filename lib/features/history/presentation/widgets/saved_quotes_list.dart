// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:random_quote/features/history/presentation/widgets/empty_history.dart';
import 'package:random_quote/features/history/presentation/widgets/sheets/delete_quote.dart';

import 'package:random_quote/quotes_repisotory/quote_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SavedQuotesList extends StatelessWidget {
  final List<QuoteModel> savedQuotes;
  const SavedQuotesList({
    Key? key,
    required this.savedQuotes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return savedQuotes.isEmpty
        ? const EmptyQuoteHistory()
        : SliverList(
            delegate: SliverChildBuilderDelegate(childCount: savedQuotes.length,
                ((context, index) {
            return InkWell(
              onLongPress: () => showModalBottomSheet(
                  isScrollControlled: true,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20.sp))),
                  context: context,
                  builder: (context) => DeleteTransactionSheet(
                        quoteModel: savedQuotes[index],
                      )),
              child: Container(
                padding: EdgeInsets.all(15.sp),
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '"${savedQuotes[index].quote}"',
                            style: TextStyle(
                              fontSize: 20.sp,
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            '- ${savedQuotes[index].author}',
                            style: TextStyle(fontSize: 16.sp),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            savedQuotes[index].genre.value.toUpperCase(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            );
          })));
  }
}

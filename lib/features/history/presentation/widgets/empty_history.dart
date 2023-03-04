import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EmptyQuoteHistory extends StatelessWidget {
  const EmptyQuoteHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(15.sp),
        child: Column(
          children: [
            Image.asset(
              'assets/images/error.png',
              height: 50.sp,
            ),
            Text(
              'No saved quotes yet.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.sp),
            )
          ],
        ),
      ),
    );
  }
}

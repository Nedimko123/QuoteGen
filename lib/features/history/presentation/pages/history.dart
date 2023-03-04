import 'package:random_quote/features/common/error/sliver_error.dart';
import 'package:random_quote/features/common/loader/sliver_loader.dart';
import 'package:random_quote/features/common/presentation/layout_design/sliver_scaffold.dart';
import 'package:random_quote/features/history/domain/providers.dart';
import 'package:random_quote/features/history/presentation/widgets/saved_quotes_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SavedQuotes extends ConsumerWidget {
  const SavedQuotes({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final savedQuotes = ref.watch(transactionHistoryProvider);

    return SliverScaffold(slivers: [
      const SliverAppBar(
        centerTitle: true,
        title: Text('Saved Quotes'),
      ),
      savedQuotes.when(
          data: (savedQuotes) {
            return SavedQuotesList(savedQuotes: savedQuotes.reversed.toList());
          },
          error: (e, _) => SliverError(e: e.toString()),
          loading: () => const SliverLoader()),
    ]);
  }
}

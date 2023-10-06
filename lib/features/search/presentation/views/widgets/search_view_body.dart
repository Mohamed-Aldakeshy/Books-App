import 'package:books_app/core/utils/styles.dart';
import 'package:books_app/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:books_app/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: CustomSearchTextField(),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Search Result',
                  style: Style.textStyle18,
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
        SliverFillRemaining(
          child: SearchResultListView(),
        ),
      ],
    );
  }
}

import 'package:books_app/core/utils/styles.dart';
import 'package:books_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:books_app/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:books_app/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  @override
  void initState() {
    BlocProvider.of<SearchBooksCubit>(context).fetchSearchBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
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
          child: Expanded(child: SearchBooksListView()),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        )
      ],
    );
  }
}

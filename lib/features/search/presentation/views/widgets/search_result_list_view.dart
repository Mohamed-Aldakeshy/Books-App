import 'package:books_app/core/widgets/custom_error_widget.dart';
import 'package:books_app/core/widgets/custom_loading_indicator.dart';
import 'package:books_app/features/home/presentation/views/widgets/newest_books_list_view_item.dart';
import 'package:books_app/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:books_app/features/search/presentation/manager/search_cubit/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBooksListView extends StatelessWidget {
  const SearchBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
        builder: (context, state) {
      if (state is SearchBooksSuccess) {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: state.searchBooksCubitList.length,
          itemBuilder: (context, index) {
            return BookListViewItem(
              bookModel: state.searchBooksCubitList[index],
            );
          },
        );
      } else if (state is SearchBooksFailure) {
        return CustomErrorWidget(errMessage: state.errMessage);
      } else {
        return CustomLoadingIndicator();
      }
    });
  }
}

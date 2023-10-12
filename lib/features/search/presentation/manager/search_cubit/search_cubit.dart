import 'package:bloc/bloc.dart';
import 'package:books_app/features/search/data/repos/search_repo.dart';
import 'package:books_app/features/search/presentation/manager/search_cubit/search_state.dart';
import 'package:flutter/material.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit({required this.searchRepo}) : super(SearchBooksInitial());

  final SearchRepo searchRepo;

  Future<void> fetchSearchBooks({required String searchKey}) async {
    emit(SearchBooksLoading());
    var result = await searchRepo.fetchSearchBooks(searchKey: searchKey);

    result.fold(
        (failure) => {
              emit(SearchBooksFailure(failure.errMessage)),
            },
        (books) => {emit(SearchBooksSuccess(books))});
  }
}

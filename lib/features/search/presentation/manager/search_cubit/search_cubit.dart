import 'package:bloc/bloc.dart';
import 'package:books_app/features/search/data/repos/search_repo.dart';
import 'package:books_app/features/search/presentation/manager/search_cubit/search_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit({required this.searchRepo}) : super(SearchBooksInitial());

  final SearchRepo searchRepo;

  Future<void> fetchSearchBooks() async {
    emit(SearchBooksLoading());
    var result = await searchRepo.fetchSearchBooks();

    result.fold(
        (failure) => {
              emit(SearchBooksFailure(failure.errMessage)),
            },
        (books) => {emit(SearchBooksSuccess(books))});
  }
}

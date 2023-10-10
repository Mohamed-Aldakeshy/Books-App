import 'package:bloc/bloc.dart';
import 'package:books_app/features/home/data/repos/home_repo.dart';
import 'package:books_app/features/home/presentation/manager/similar_books_cubit/similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksIniatial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilartBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);

    result.fold(
        (failure) => {
              emit(SimilarBooksFailure(failure.errMessage)),
            },
        (books) => {emit(SimilartBooksSuccess(books))});
  }
}

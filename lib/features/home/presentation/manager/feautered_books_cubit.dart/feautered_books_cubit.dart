import 'package:bloc/bloc.dart';
import 'package:books_app/features/home/data/repos/home_repo.dart';
import 'package:books_app/features/home/presentation/manager/feautered_books_cubit.dart/feautered_books_state.dart';

class FeauteredBooksCubit extends Cubit<FeauteredBooksState> {
  FeauteredBooksCubit(this.homeRepo) : super(FeauteredBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBooks() async {
    emit(FeauteredBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();

    result.fold(
        (failure) => {
              emit(FeauteredBooksFailure(failure.errMessage)),
            },
        (books) => {emit(FeauteredBooksSuccess(books))});
  }
}

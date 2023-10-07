import 'package:bloc/bloc.dart';
import 'package:books_app/features/home/data/repos/home_repo.dart';
import 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();

    result.fold(
        (failure) => {
              emit(NewestBooksFailure(failure.errMessage)),
            },
        (books) => {emit(NewestBooksSuccess(books))});
  }
}

import 'package:bloc/bloc.dart';
import 'package:books_app/features/home/presentation/manager/feautered_books_cubit.dart/feautered_books_state.dart';

class FeauteredBooksCubit extends Cubit<FeauteredBooksState> {
  FeauteredBooksCubit() : super(FeauteredBooksInitial());
}

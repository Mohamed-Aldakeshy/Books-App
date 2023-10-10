import 'package:books_app/core/utils/styles.dart';
import 'package:books_app/features/home/data/models/book_model/book_model.dart';
import 'package:books_app/features/home/data/models/book_model/volume_info.dart';
import 'package:books_app/features/home/presentation/views/widgets/book_rating.dart';
import 'package:books_app/features/home/presentation/views/widgets/books_action.dart';
import 'package:books_app/features/home/presentation/views/widgets/books_details_list_view.dart';
import 'package:books_app/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:books_app/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});

  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.2),
                  child: CustomBookImage(
                    imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ??
                        'https://t3.ftcdn.net/jpg/01/38/48/40/360_F_138484065_1enzXuW8NlkppNxSv4hVUrYoeF8qgoeY.jpg',
                  ),
                ),
                const SizedBox(
                  height: 43,
                ),
                Text(
                  bookModel.volumeInfo?.title ?? 'the value is null',
                  style: Style.textStyle30.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 6,
                ),
                Opacity(
                  opacity: 0.7,
                  child: Text(
                    bookModel.volumeInfo?.authors?[0] ?? 'the vlaue is null',
                    style: Style.textStyle18.copyWith(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                BookRating(
                  rating: bookModel.volumeInfo?.averageRating ?? 0,
                  count: bookModel.volumeInfo?.ratingsCount ?? 0,
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                const SizedBox(
                  height: 37,
                ),
                BooksAction(),
                const Expanded(
                  child: SizedBox(
                    height: 30,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'You can also like',
                    style:
                        Style.textStyle14.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                BooksDetailsListView(),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

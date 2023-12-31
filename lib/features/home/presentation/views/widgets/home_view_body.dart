import 'package:books_app/core/utils/styles.dart';
import 'package:books_app/features/home/presentation/views/widgets/newest_books_list_view.dart';
import 'package:books_app/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:books_app/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(),
              FeaturedBooksListView(), //here we used cubit
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  'Newest Books',
                  style: Style.textStyle18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        const SliverFillRemaining(
          child: NewestBooksListView(), //here we use cubit
        ),
      ],
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:movie_app/features/home/presentation/bloc/home_event.dart';
import 'package:movie_app/features/home/presentation/bloc/home_state.dart';
import 'package:movie_app/features/home/presentation/widgets/poster_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/search_text_field_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/see_all_button_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/title_widget.dart';
import 'package:movie_app/shared/theme/app_colors.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        actions: [
          SvgPicture.asset("assets/images/svg/notification.svg"),
          const SizedBox(width: 16),
        ],
        centerTitle: false,
        title: const TitleWidget(),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is SearchMoviesLoading) {
            // Центрируем индикатор загрузки
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.yellow,
              ),
            );
          } else if (state is SearchMoviesSuccess) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    SearchTextFieldWidget(
                      controller: searchController,
                      onTap: () => context
                          .read<HomeBloc>()
                          .add(SearchMoviesEvent(title: searchController.text)),
                    ),
                    const SizedBox(height: 32),
                    const SeeAllButtonWidget(),
                    const SizedBox(height: 24),
                    CarouselSlider(
                      items: state.movies.map((movie) {
                        return PosterWidget(
                          imageUrl: movie.poster,
                          title: movie.title,
                          type: movie.type,
                          year: movie.year,
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 600,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.2,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is SearchMoviesError) {
            return Center(
              child: Text(
                state.error,
                style: const TextStyle(color: AppColors.white),
              ),
            );
          }

          // Состояние по умолчанию
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  SearchTextFieldWidget(
                    controller: searchController,
                    onTap: () => context
                        .read<HomeBloc>()
                        .add(SearchMoviesEvent(title: searchController.text)),
                  ),
                  const SizedBox(height: 32),
                  const SeeAllButtonWidget(),
                  const SizedBox(height: 24),
                  CarouselSlider(
                    items: const [
                      PosterWidget(
                        imageUrl:
                            "https://w0.peakpx.com/wallpaper/144/660/HD-wallpaper-official-spider-man-no-way-home-poster.jpg",
                        title: "Spider-man No way to home",
                        year: "2024",
                        type: "Movie",
                      ),
                      PosterWidget(
                        imageUrl:
                            "https://image.tmdb.org/t/p/original/qMxAmzGQO722q0UlssCOPhrXmvX.jpg",
                      ),
                      PosterWidget(
                        imageUrl:
                            "https://w0.peakpx.com/wallpaper/789/852/HD-wallpaper-venom-tom-hardy-marvel-comics-transformation-movie-poster.jpg",
                      ),
                    ],
                    options: CarouselOptions(
                      height: 600,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.2,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

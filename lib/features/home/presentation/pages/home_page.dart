import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:movie_app/features/home/presentation/bloc/home_event.dart';
import 'package:movie_app/features/home/presentation/bloc/home_state.dart';
import 'package:movie_app/features/home/presentation/widgets/poster_widget.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is SearchMoviesLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                      backgroundColor: AppColors.yellow),
                );
              } else if (state is SearchMoviesSuccess) {
                return Column(
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
                );
              } else if (state is SearchMoviesError) {
                return Text(state.error);
              }
              return Column(
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
              );
            },
          ),
        ),
      ),
    );
  }
}

class SeeAllButtonWidget extends StatelessWidget {
  const SeeAllButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Now playing",
          style: TextStyle(
              color: AppColors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "See all",
                style: TextStyle(
                    color: AppColors.yellow,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2.5, left: 4),
                child: SvgPicture.asset("assets/images/svg/arrow-right.svg"),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class SearchTextFieldWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final TextEditingController? controller;
  const SearchTextFieldWidget({super.key, this.controller, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onEditingComplete: onTap,
      controller: controller,
      cursorColor: AppColors.yellow,
      style: const TextStyle(color: AppColors.white),
      decoration: InputDecoration(
        prefixIconConstraints: const BoxConstraints(
          maxWidth: 44,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: SvgPicture.asset(
            "assets/images/svg/search.svg",
          ),
        ),
        filled: true,
        fillColor: AppColors.searchColor,
        hintText: "Search",
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.yellow),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

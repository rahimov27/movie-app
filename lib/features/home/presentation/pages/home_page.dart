import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:movie_app/features/home/presentation/bloc/home_event.dart';
import 'package:movie_app/features/home/presentation/bloc/home_state.dart';
import 'package:movie_app/features/home/presentation/widgets/coming_soon_card_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/poster_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/promo_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/search_text_field_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/see_all_button_widget.dart';
import 'package:movie_app/features/home/presentation/widgets/service_widget.dart';
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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    const SeeAllButtonWidget(
                      leftText: "Now playing",
                      buttonText: "See all",
                    ),
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
                    const SizedBox(height: 32),
                    const SeeAllButtonWidget(
                      leftText: "Coming soon",
                      buttonText: "See all",
                    ),
                    const SizedBox(height: 24),
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ComingSoonCardWidget(
                            movieImage:
                                "https://m.media-amazon.com/images/I/51v5ZpFyaFL._AC_.jpg",
                            movieTitle: "Inception",
                            movieType: "Action, Sci-fi, Thriller",
                            movieDate: "16.07.2010",
                          ),
                          ComingSoonCardWidget(
                            movieImage:
                                "https://pbs.twimg.com/media/Fa0kj5tVUAAzuVl?format=jpg&name=4096x4096",
                            movieTitle: "Avatar 2: The Way Of Water",
                            movieType: "Adventure, Sci-fi",
                            movieDate: "22.03.2003",
                          ),
                          ComingSoonCardWidget(
                            movieImage:
                                "https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_FMjpg_UX1000_.jpg",
                            movieTitle: "The Dark Knight",
                            movieType: "Action, Crime, Drama",
                            movieDate: "18.07.2008",
                          ),
                          ComingSoonCardWidget(
                            movieImage:
                                "https://m.media-amazon.com/images/M/MV5BYzdjMDAxZGItMjI2My00ODA1LTlkNzItOWFjMDU5ZDJlYWY3XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg",
                            movieTitle: "Interstellar",
                            movieType: "Adventure, Drama, Sci-fi",
                            movieDate: "07.11.2014",
                          ),
                          ComingSoonCardWidget(
                            movieImage:
                                "https://m.media-amazon.com/images/I/81EBp0vOZZL.jpg",
                            movieTitle:
                                "The Lord of the Rings: The Fellowship of the Ring",
                            movieType: "Adventure, Drama",
                            movieDate: "19.12.2001",
                          ),
                          ComingSoonCardWidget(
                            movieImage:
                                "https://w0.peakpx.com/wallpaper/144/660/HD-wallpaper-official-spider-man-no-way-home-poster.jpg",
                            movieTitle: "Spider-Man: No Way Home",
                            movieType: "Action, Adventure, Sci-fi",
                            movieDate: "17.12.2021",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    const SeeAllButtonWidget(
                      leftText: "Promo & Discount",
                      buttonText: "See all",
                    ),
                    const SizedBox(height: 24),
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          PromoWidget(),
                          SizedBox(width: 16),
                          PromoWidget(
                            imageUrl:
                                "https://img.freepik.com/premium-photo/clapper-board-movies-tickets-popcorn_114309-2072.jpg",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 100),
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
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  const SeeAllButtonWidget(
                    leftText: "Now playing",
                    buttonText: "See all",
                  ),
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
                        title: "Avengers",
                        type: "Movie",
                        year: "2018",
                        imageUrl:
                            "https://image.tmdb.org/t/p/original/qMxAmzGQO722q0UlssCOPhrXmvX.jpg",
                      ),
                      PosterWidget(
                        title: "Venom",
                        type: "Movie",
                        year: "2021",
                        imageUrl:
                            "https://w0.peakpx.com/wallpaper/789/852/HD-wallpaper-venom-tom-hardy-marvel-comics-transformation-movie-poster.jpg",
                      ),
                    ],
                    options: CarouselOptions(
                      height: 600,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.2,
                    ),
                  ),
                  const SizedBox(height: 32),
                  const SeeAllButtonWidget(
                    leftText: "Coming soon",
                    buttonText: "See all",
                  ),
                  const SizedBox(height: 24),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ComingSoonCardWidget(
                          movieImage:
                              "https://m.media-amazon.com/images/I/51v5ZpFyaFL._AC_.jpg",
                          movieTitle: "Inception",
                          movieType: "Action, Sci-fi, Thriller",
                          movieDate: "16.07.2010",
                        ),
                        ComingSoonCardWidget(
                          movieImage:
                              "https://pbs.twimg.com/media/Fa0kj5tVUAAzuVl?format=jpg&name=4096x4096",
                          movieTitle: "Avatar 2: The Way Of Water",
                          movieType: "Adventure, Sci-fi",
                          movieDate: "22.03.2003",
                        ),
                        ComingSoonCardWidget(
                          movieImage:
                              "https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_FMjpg_UX1000_.jpg",
                          movieTitle: "The Dark Knight",
                          movieType: "Action, Crime, Drama",
                          movieDate: "18.07.2008",
                        ),
                        ComingSoonCardWidget(
                          movieImage:
                              "https://m.media-amazon.com/images/M/MV5BYzdjMDAxZGItMjI2My00ODA1LTlkNzItOWFjMDU5ZDJlYWY3XkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg",
                          movieTitle: "Interstellar",
                          movieType: "Adventure, Drama, Sci-fi",
                          movieDate: "07.11.2014",
                        ),
                        ComingSoonCardWidget(
                          movieImage:
                              "https://m.media-amazon.com/images/I/81EBp0vOZZL.jpg",
                          movieTitle:
                              "The Lord of the Rings: The Fellowship of the Ring",
                          movieType: "Adventure, Drama",
                          movieDate: "19.12.2001",
                        ),
                        ComingSoonCardWidget(
                          movieImage:
                              "https://w0.peakpx.com/wallpaper/144/660/HD-wallpaper-official-spider-man-no-way-home-poster.jpg",
                          movieTitle: "Spider-Man: No Way Home",
                          movieType: "Action, Adventure, Sci-fi",
                          movieDate: "17.12.2021",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  const SeeAllButtonWidget(
                    leftText: "Promo & Discount",
                    buttonText: "See all",
                  ),
                  const SizedBox(height: 24),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        PromoWidget(),
                        SizedBox(width: 16),
                        PromoWidget(
                          imageUrl:
                              "https://img.freepik.com/premium-photo/clapper-board-movies-tickets-popcorn_114309-2072.jpg",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  const SeeAllButtonWidget(
                    leftText: "Service",
                    buttonText: "See all",
                  ),
                  const SizedBox(height: 24),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ServiceWidget(
                          text: "Cinema",
                          imageUrl:
                              "https://healthservicediscounts.com/blog/wp-content/uploads/2021/08/cinema-768x432.png",
                        ),
                        ServiceWidget(
                          text: "Imax",
                          imageUrl:
                              "https://lumenandforge.com/wp-content/uploads/2022/08/how-imax-3d-works-featured-image-1-1.webp",
                        ),
                        ServiceWidget(
                          text: "4dx",
                          imageUrl:
                              "https://static.wikia.nocookie.net/universalanimation/images/4/4c/4DX_logo.png/revision/latest?cb=20200601004540",
                        ),
                        ServiceWidget(
                          text: "Sweetbox",
                          imageUrl:
                              "https://cinein.cafe24.com/wp/wp-content/uploads/2019/02/sweetbox_01.jpg",
                        ),
                        ServiceWidget(
                          text: "Food",
                          imageUrl:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRbXwUgJR62clyg1rnxYjTw7Qz_Vh4ganYZyg&s",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  const SeeAllButtonWidget(
                    leftText: "Movie news",
                    buttonText: "See all",
                  ),
                  const SizedBox(height: 24),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        MovieNewsWidget(
                          imageUrl:
                              "https://beam-images.warnermediacdn.com/BEAM_LWM_DELIVERABLES/dfa50804-e6f6-4fa2-a732-693dbc50527b/37082735-6715-11ef-96ad-02805d6a02df?host=wbd-images.prod-vod.h264.io&partner=beamcom",
                          newsText:
                              "Recent developments in the Batman universe include the announcement of a standalone film centered on the classic villain Clayface. The film is set for release on September 11, 2026.",
                        ),
                        MovieNewsWidget(
                          imageUrl:
                              "https://static1.srcdn.com/wordpress/wp-content/uploads/2023/08/robert-pattinson-in-the-batman-part-ii-image.jpg",
                          newsText:
                              "Matt Reeves has confirmed that 'The Batman Part II' is in pre-production. The release date is set for October 3, 2025.",
                        ),
                        MovieNewsWidget(
                          imageUrl:
                              "https://static1.srcdn.com/wordpress/wp-content/uploads/2024/08/dc-all-in-featured-image.jpg",
                          newsText:
                              "DC Studios announced a new animated series, 'Batman: The Dark Knight Chronicles', exploring the early years of Bruce Wayne.",
                        ),
                        MovieNewsWidget(
                          imageUrl:
                              "https://static1.srcdn.com/wordpress/wp-content/uploads/2024/02/a-split-image-of-the-joker-from-the-dark-knight-and-bane-from-the-dark-knight-rises.jpg",
                          newsText:
                              "The 4K Ultra HD remaster of Christopher Nolan's 'The Dark Knight Trilogy' will be available on December 15, 2024.",
                        ),
                        MovieNewsWidget(
                          imageUrl:
                              "https://www.hollywoodreporter.com/wp-content/uploads/2012/07/warner_bros_intro.jpg",
                          newsText:
                              "Warner Bros. teases a crossover event between Batman and Superman in a new film titled 'World's Finest', slated for 2027.",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class MovieNewsWidget extends StatelessWidget {
  final String? imageUrl;
  final String? newsText;

  const MovieNewsWidget({
    super.key,
    this.imageUrl,
    this.newsText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imageUrl ?? "-",
              height: 155,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 75,
            width: 290,
            child: Text(
              newsText ?? "-",
              overflow: TextOverflow.fade,
              style: const TextStyle(
                  color: AppColors.textColor,
                  fontSize: 16,
                  height: 1.25,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}

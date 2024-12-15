import 'package:auto_route/auto_route.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/features/home/presentation/pages/home_page.dart';
import 'package:movie_app/features/home/presentation/widgets/subtitle_coming_soon_widget.dart';
import 'package:movie_app/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:movie_app/shared/resources/app_consts.dart';
import 'package:movie_app/shared/theme/app_colors.dart';

@RoutePage()
class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  int _initialValue = 0;

  @override
  void initState() {
    super.initState();
    context.read<MovieBloc>().add(GetNowPlayingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomSlidingSegmentedControl(
              fixedWidth: MediaQuery.of(context).size.width * 0.44,
              initialValue: _initialValue,
              innerPadding: const EdgeInsets.all(7),
              thumbDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.yellow,
              ),
              decoration: BoxDecoration(
                color: AppColors.slidingBackColor,
                borderRadius: BorderRadius.circular(12),
              ),
              onValueChanged: (value) {
                setState(() {
                  _initialValue = value;
                  _initialValue == 0
                      ? context.read<MovieBloc>().add(GetNowPlayingEvent())
                      : context.read<MovieBloc>().add(GetComingSoonEvent());
                });
              },
              children: {
                0: Text(
                  "Now Playing",
                  style: TextStyle(
                      fontSize: 18,
                      color: _initialValue == 0
                          ? AppColors.black
                          : AppColors.slidingWhiteColor),
                ),
                1: Text(
                  "Coming Soon",
                  style: TextStyle(
                      fontSize: 18,
                      color: _initialValue == 1
                          ? AppColors.black
                          : AppColors.slidingWhiteColor),
                ),
              },
            ),
            Expanded(
              child: _initialValue == 0
                  ? BlocBuilder<MovieBloc, MovieState>(
                      builder: (context, state) {
                        if (state is GetNowPlayingLoading) {
                          return const AppCircularWidget();
                        } else if (state is GetNowPlayingSuccess) {
                          return GridView.builder(
                            itemCount: state.movieModel.length,
                            physics: const AlwaysScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 24,
                              childAspectRatio: 0.43,
                            ),
                            itemBuilder: (context, index) =>
                                MovieNowPlayingCardWidget(
                              movieImage:
                                  "${AppConsts.tmdbImagePath}${state.movieModel[index].backDropPath}",
                              movieTitle: state.movieModel[index].title,
                              movieDate: state.movieModel[index].releaseDate,
                              movieType:
                                  state.movieModel[index].originalLanguage,
                              movieVote: state.movieModel[index].voteCount,
                            ),
                          );
                        }
                        return GridView.builder(
                          itemCount: 6,
                          physics: const AlwaysScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 24,
                            childAspectRatio: 0.43,
                          ),
                          itemBuilder: (context, index) =>
                              const MovieNowPlayingCardWidget(
                            movieImage:
                                "https://m.media-amazon.com/images/I/81Fd1jD8DAL._AC_UF894,1000_QL80_.jpg",
                            movieTitle: "Spider man",
                            movieDate: "22.01.2019",
                            movieVote: "345",
                          ),
                        );
                      },
                    )
                  : BlocBuilder<MovieBloc, MovieState>(
                      builder: (context, state) {
                        if (state is GetComingSoonLoading) {
                          return const AppCircularWidget();
                        } else if (state is GetComingSoonSuccess) {
                          return GridView.builder(
                            itemCount: state.movieModel.length,
                            physics: const AlwaysScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 24,
                              childAspectRatio: 0.43,
                            ),
                            itemBuilder: (context, index) =>
                                MovieNowPlayingCardWidget(
                              movieImage:
                                  "${AppConsts.tmdbImagePath}${state.movieModel[index].backDropPath}",
                              movieTitle: state.movieModel[index].title,
                              movieDate: state.movieModel[index].releaseDate,
                              movieType:
                                  state.movieModel[index].originalLanguage,
                              movieVote: state.movieModel[index].voteCount,
                            ),
                          );
                        }
                        return GridView.builder(
                          itemCount: 6,
                          physics: const AlwaysScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 24,
                            childAspectRatio: 0.43,
                          ),
                          itemBuilder: (context, index) =>
                              const MovieNowPlayingCardWidget(
                            movieImage:
                                "https://m.media-amazon.com/images/I/81Fd1jD8DAL._AC_UF894,1000_QL80_.jpg",
                            movieTitle: "Spider man",
                            movieDate: "22.01.2019",
                            movieVote: "345",
                          ),
                        );
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }
}

class MovieNowPlayingCardWidget extends StatelessWidget {
  final String? movieTitle;
  final String? movieType;
  final String? movieDate;
  final String? movieImage;
  final String? movieVote;

  const MovieNowPlayingCardWidget(
      {super.key,
      this.movieDate,
      this.movieTitle,
      this.movieType,
      this.movieVote,
      this.movieImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 33),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                height: 267,
                fit: BoxFit.cover,
                width: double.infinity,
                movieImage ??
                    "https://www.bik.kg/wp-content/uploads/2024/05/placeholder-2.png",
              ),
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movieTitle ?? "-",
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    height: 1.2,
                    fontSize: 16,
                    color: AppColors.yellow,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                SubtitleComingSoonWidget(
                  text: "$movieVote",
                  imageUrl: "assets/images/svg/star.svg",
                ),
                const SizedBox(height: 4),
                SubtitleComingSoonWidget(
                  text: "$movieType",
                  imageUrl: "assets/images/svg/video.svg",
                ),
                const SizedBox(height: 4),
                SubtitleComingSoonWidget(
                  text: movieDate,
                  imageUrl: "assets/images/svg/calendar.svg",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

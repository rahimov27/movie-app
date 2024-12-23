import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/features/home/presentation/pages/home_page.dart';
import 'package:movie_app/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:movie_app/features/movie/presentation/widgets/movie_detail_actor_card_widget.dart';
import 'package:movie_app/features/movie/presentation/widgets/movie_detail_info_row_widget.dart';
import 'package:movie_app/features/movie/presentation/widgets/movie_detail_title_widget.dart';
import 'package:movie_app/features/movie/presentation/widgets/star_widget.dart';
import 'package:movie_app/shared/resources/app_consts.dart';
import 'package:movie_app/shared/theme/app_colors.dart';

@RoutePage()
class MovieDetailPage extends StatefulWidget {
  final String? movieTitle;
  final String? movieImage;
  final String? movieDate;
  final String? voteAverage;
  final String? voteCount;
  final String? originalLanguage;
  final bool? adult;
  final String? overview;

  final String movieId;

  const MovieDetailPage(
      {super.key,
      required this.movieId,
      this.movieTitle,
      this.movieImage,
      this.movieDate,
      this.voteCount,
      this.adult,
      this.overview,
      this.voteAverage,
      this.originalLanguage});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  bool fullText = true;

  @override
  void initState() {
    super.initState();
    context.read<MovieBloc>().add(GetActorsEvent(movieId: widget.movieId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(widget.movieImage ??
              "https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png"),
          Positioned(
            top: 50,
            child: IconButton(
              onPressed: () {
                context.maybePop();
              },
              color: AppColors.textColor,
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.searchColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.movieTitle ?? "-",
                      style: const TextStyle(
                          fontSize: 24,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.movieDate ?? "-",
                      style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.carouselCardSubTitle,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 40),
                    Row(
                      children: [
                        const Text(
                          "Review ",
                          style: TextStyle(
                              fontSize: 16,
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w400),
                        ),
                        SvgPicture.asset("assets/images/svg/star.svg"),
                        const SizedBox(width: 4),
                        Text(
                          "${widget.voteAverage?.substring(0, 3)}",
                          style: const TextStyle(
                              fontSize: 16,
                              color: AppColors.textColor,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          " (${widget.voteCount})",
                          style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.carouselCardSubTitle,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const Row(
                          children: [
                            StarWidget(),
                            StarWidget(),
                            StarWidget(),
                            StarWidget(),
                            StarWidget(),
                          ],
                        ),
                        SizedBox(
                          child: ElevatedButton(
                            style: ButtonStyle(
                              padding: WidgetStateProperty.all<EdgeInsets>(
                                const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                              ),
                              shape: WidgetStatePropertyAll<OutlinedBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              side: const WidgetStatePropertyAll(
                                BorderSide(
                                    color: AppColors.carouselCardSubTitle),
                              ),
                              shadowColor: const WidgetStatePropertyAll(
                                  Colors.transparent),
                              backgroundColor: const WidgetStatePropertyAll(
                                  AppColors.searchColor),
                            ),
                            onPressed: () {},
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                    "assets/images/svg/play-button.svg"),
                                const SizedBox(width: 7),
                                const Text(
                                  "Watch trailer",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.carouselCardSubTitle),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // height here
                  const SizedBox(height: 350),
                  const MovieDetailInfoRowWidget(
                    firstText: "Movie genre:",
                    secondText: "Action, adventure, sci-fi",
                  ),
                  const SizedBox(height: 16),
                  MovieDetailInfoRowWidget(
                    firstText: "Censorship:",
                    secondText: widget.adult == false ? "Kids" : "Adult",
                  ),
                  const SizedBox(height: 16),
                  MovieDetailInfoRowWidget(
                    firstText: "Language:",
                    secondText:
                        widget.originalLanguage == "en" ? "English" : "Russian",
                  ),
                  const SizedBox(height: 32),
                  const MovieDetailTitleWidget(),
                  const SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        fullText
                            ? "${widget.overview!.substring(0, 150)}..."
                            : "${widget.overview}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            fullText = !fullText;
                          });
                        },
                        child: fullText
                            ? const Text("See more")
                            : const Text("See less"),
                      ),
                      const MovieDetailTitleWidget(
                        text: "Director",
                      ),
                      const SizedBox(height: 24),
                      BlocBuilder<MovieBloc, MovieState>(
                        builder: (context, state) {
                          if (state is GetActorsLoading) {
                            return const AppCircularWidget();
                          } else if (state is GetActorsSuccess) {
                            print(state.actors[0].character);
                            return SizedBox(
                              height: 100,
                              child: ListView.builder(
                                  shrinkWrap: false,
                                  itemCount: state.actors.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return MovieDetailActorCardWidget(
                                      directorImage:
                                          "${AppConsts.tmdbImagePath}${state.actors[index].profilePath}",
                                      directorName:
                                          state.actors[index].character,
                                    );
                                  }),
                            );
                          } else if (state is GetActorsError) {
                            return Text(state.error);
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

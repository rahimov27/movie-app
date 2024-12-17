import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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

  const MovieDetailPage(
      {super.key,
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(widget.movieImage ??
              "https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png"),
          Positioned(
            top: 50,
            child: IconButton(
              onPressed: () {},
              color: AppColors.textColor,
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 170),
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
                const Text(
                  "Storyline",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
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
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MovieDetailInfoRowWidget extends StatelessWidget {
  final String? firstText;
  final String? secondText;

  const MovieDetailInfoRowWidget({super.key, this.firstText, this.secondText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            firstText ?? "-",
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.greyDetail,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(width: 15),
        Text(
          secondText ?? "-",
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class StarWidget extends StatelessWidget {
  const StarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/images/svg/star-unfilled.svg",
          width: 32,
          height: 32,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 12,
        )
      ],
    );
  }
}

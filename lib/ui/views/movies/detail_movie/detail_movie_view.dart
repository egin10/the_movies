import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../constants/custom_color.dart';
import '../../../../constants/endpoint.dart';
import '../../../../models/movies/detail_movie_model.dart';
import '../../../../utils/convert_datetime.dart';
import '../../../../utils/get_original_language.dart';
import '../../../../utils/ui_helpers.dart';
import '../../../widgets/custom_loader.dart';
import 'detail_movie_viewmodel.dart';
import 'widgets/gendre.dart';
import 'widgets/rating_and_adult.dart';

class DetailMovieView extends StatelessWidget {
  final String id;
  final String title;
  const DetailMovieView({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DetailMovieViewModel viewModel = context.watch<DetailMovieViewModel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: GoogleFonts.lato(),
        ),
      ),
      backgroundColor: CustomColor.darkBlueColor,
      body: SafeArea(
        child: FutureBuilder(
            future: viewModel.getDetailMovie(id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return _buildContent(context, viewModel);
              } else {
                return const CustomLoader();
              }
            }),
      ),
    );
  }

  SizedBox _buildContent(BuildContext context, DetailMovieViewModel viewModel) {
    final data = viewModel.detailMovie;
    return SizedBox(
      height: screenHeight(context),
      width: screenWidth(context),
      child: Column(
        children: [
          _buildBackdropImage(context, data),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Original Title
                    Text(
                      '${data.originalTitle}',
                      style: GoogleFonts.lato(
                        color: CustomColor.whiteColor,
                        fontSize: 18,
                      ),
                    ),
                    // Tagline
                    Text(
                      '${data.tagline}',
                      style: GoogleFonts.lato(
                        color: Colors.amber,
                        fontSize: 14,
                      ),
                    ),
                    // Spoken Languages
                    const SizedBox(height: 8),
                    _buildItemList(
                      title: 'Spoken Languages',
                      value: data.spokenLanguages != null
                          ? data.spokenLanguages!
                              .map((spoken) =>
                                  '${spoken.englishName} | ${spoken.name}')
                              .toString()
                          : '',
                    ),
                    const SizedBox(height: 6),
                    _buildItemList(
                      title: 'Original Language',
                      value: data.spokenLanguages != null
                          ? getOriginalLanguage(data.spokenLanguages ?? [],
                              data.originalLanguage ?? '')
                          : '',
                    ),
                    const SizedBox(height: 6),
                    _buildItemList(
                      title: 'Popularity',
                      value: '${data.popularity}',
                    ),
                    const SizedBox(height: 6),
                    _buildItemList(
                      title: 'Runtime',
                      value: '${(data.runtime! / 60).toStringAsFixed(2)} hour',
                    ),
                    const SizedBox(height: 6),
                    _buildItemList(
                      title: 'Total Count',
                      value: '${data.voteCount}',
                    ),
                    const SizedBox(height: 6),
                    _buildItemList(
                      title: 'Budget',
                      value: '\$${data.budget}',
                    ),
                    const SizedBox(height: 8),
                    _buildGendres(data),
                    const SizedBox(height: 8),
                    // Overview (Desc)
                    Text(
                      textAlign: TextAlign.justify,
                      '${data.overview}',
                      style: GoogleFonts.lato(
                        color: CustomColor.whiteColor,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Release
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        textAlign: TextAlign.justify,
                        '${data.status} on ${convertDatetime('${data.releaseDate}')}',
                        style: GoogleFonts.lato(
                          color: CustomColor.whiteColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          _buildButtonWatch(data),
        ],
      ),
    );
  }

  Container _buildButtonWatch(DetailMovieModel data) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            primary: data.video! ? CustomColor.redColor : Colors.red[300],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            )),
        child: Center(
          child: Text(
            'Watch',
            style: GoogleFonts.lato(
              color: data.video!
                  ? CustomColor.whiteColor
                  : CustomColor.darkBlueColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Row _buildGendres(DetailMovieModel data) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: data.genres != null
              ? data.genres!
                  .map((gendre) => GendreCard(
                        name: '${gendre.name}',
                      ))
                  .toList()
              : [],
        ),
      ],
    );
  }

  Row _buildItemList({required String title, required String value}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.lato(
            color: CustomColor.whiteColor,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            ':  $value',
            style: GoogleFonts.lato(
              color: CustomColor.whiteColor,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  Stack _buildBackdropImage(BuildContext context, DetailMovieModel data) {
    return Stack(
      children: [
        Container(
          height: screenHeight(context) / 4,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                  '${Endpoint.imageW500Uri}/${data.backdropPath}'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RatingAndAdult(
                  rating: data.voteAverage ?? 0,
                  isAdult: data.adult ?? false,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

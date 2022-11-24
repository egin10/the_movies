import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../constants/custom_color.dart';
import '../../../../constants/endpoint.dart';
import '../../../../models/tv/detail_tv_show_model.dart';
import '../../../../utils/convert_datetime.dart';
import '../../../../utils/get_original_language.dart';
import '../../../../utils/ui_helpers.dart';
import '../../../widgets/custom_loader.dart';
import 'detail_tv_show_viewmodel.dart';
import 'widgets/company_card.dart';
import 'widgets/gendre_card.dart';
import 'widgets/rating_and_adult.dart';
import 'widgets/tv_show_card.dart';

class DetailTvShowView extends StatelessWidget {
  final String id;
  final String title;
  const DetailTvShowView({Key? key, required this.id, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    DetailTvShowViewModel viewModel = context.watch<DetailTvShowViewModel>();
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
            future: viewModel.getDetailTvShow(id),
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

  SizedBox _buildContent(
      BuildContext context, DetailTvShowViewModel viewModel) {
    final data = viewModel.detailTvShow;
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
                      '${data.originalName}',
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
                      title: 'Season',
                      value:
                          'Season ${data.numberOfSeasons} (${data.numberOfEpisodes} episode)',
                    ),
                    const SizedBox(height: 6),
                    _buildItemList(
                      title: 'Production Country',
                      value: data.productionCountries!.isNotEmpty
                          ? '${data.productionCountries?[0].name}'
                          : '',
                    ),
                    const SizedBox(height: 6),
                    _buildItemList(
                      title: 'Status',
                      value: '${data.status}',
                    ),
                    const SizedBox(height: 6),
                    _buildItemList(
                      title: 'Type',
                      value: '${data.type}',
                    ),
                    const SizedBox(height: 6),
                    _buildItemList(
                      title: 'Popularity',
                      value: '${data.popularity}',
                    ),
                    const SizedBox(height: 6),
                    _buildItemList(
                      title: 'Total Count',
                      value: '${data.voteCount}',
                    ),
                    const SizedBox(height: 8),
                    _buildGendres(context, data),
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
                    const SizedBox(height: 8),
                    // First Air Date
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        textAlign: TextAlign.justify,
                        'First air date on ${convertDatetime('${data.firstAirDate}')}',
                        style: GoogleFonts.lato(
                          color: CustomColor.whiteColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Companies
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Companies',
                        style: GoogleFonts.lato(
                          color: CustomColor.whiteColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    _buildCompanyLogo(context, data),
                    const SizedBox(height: 8),
                    // Watch On
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Watch on',
                        style: GoogleFonts.lato(
                          color: CustomColor.whiteColor,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    _buildTvShows(context, data),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
          _buildButtonHomepage(data, viewModel),
        ],
      ),
    );
  }

  SizedBox _buildCompanyLogo(BuildContext context, DetailTvShowModel data) {
    return SizedBox(
      width: screenWidth(context),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: data.productionCompanies != null
              ? data.productionCompanies!
                  .map(
                    (data) => CompanyCard(
                      name: '${data.name}',
                      country: '${data.originCountry}',
                      logoPath: data.logoPath,
                    ),
                  )
                  .toList()
              : [],
        ),
      ),
    );
  }

  Container _buildButtonHomepage(
      DetailTvShowModel data, DetailTvShowViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton(
        onPressed: () async {
          viewModel.openHomepage(data.homepage ?? '');
        },
        style: ElevatedButton.styleFrom(
            primary: CustomColor.redColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            )),
        child: Center(
          child: Text(
            'Homepage',
            style: GoogleFonts.lato(
              color: CustomColor.whiteColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _buildGendres(BuildContext context, DetailTvShowModel data) {
    return SizedBox(
      width: screenWidth(context),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: data.genres != null
              ? data.genres!
                  .map((gendre) => GendreCard(
                        name: '${gendre.name}',
                      ))
                  .toList()
              : [],
        ),
      ),
    );
  }

  SizedBox _buildTvShows(BuildContext context, DetailTvShowModel data) {
    return SizedBox(
      width: screenWidth(context),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: data.networks != null
              ? data.networks!
                  .map((network) => TvShowCard(
                        name: '${network.name}',
                        logoPath: network.logoPath,
                      ))
                  .toList()
              : [],
        ),
      ),
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

  Stack _buildBackdropImage(BuildContext context, DetailTvShowModel data) {
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

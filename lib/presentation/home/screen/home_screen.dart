import 'package:flutter/material.dart';
import 'package:flutter_application_clean_arch/common/config/size_config.dart';
import 'package:flutter_application_clean_arch/core/core.dart';
import 'package:flutter_application_clean_arch/presentation/home/screen/video_widget.dart';
import 'package:flutter_application_clean_arch/presentation/presentation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'detail_film.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<GetFilmBloc>().add(FetchFilm());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    RichText(
                        text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'MoviesFree',
                          style: GoogleFonts.roboto(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: '!',
                          style: GoogleFonts.roboto(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xffFFC700),
                          ),
                        ),
                      ],
                    )),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              BlocConsumer<GetFilmBloc, BaseState<List<Film>>>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is LoadedState) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                        child: Row(
                          children: List.generate(
                            5,
                            (index) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailFilmScreen(
                                      film: state.data![index],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: SizeConfig.safeBlockVertical * 30,
                                      width: SizeConfig.safeBlockHorizontal * 80,
                                      decoration: BoxDecoration(
                                        color: const Color(0xff424242),
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          // image: NetworkImage('https://cineverse.id/wp-content/uploads/2024/01/agak-laen-cover.jpg'),
                                          image: NetworkImage(state.data![index].cover!),

                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Center(
                                        child: GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius: BorderRadius.circular(10),
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          const SizedBox(height: 10),
                                                          Text(
                                                            "Trailer ${state.data![index].title}",
                                                            style: GoogleFonts.roboto(
                                                              fontSize: 20,
                                                              fontWeight: FontWeight.bold,
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                          const SizedBox(height: 10),
                                                          Container(
                                                            width: SizeConfig.safeBlockHorizontal * 80,
                                                            height: SizeConfig.safeBlockVertical * 30,
                                                            decoration: BoxDecoration(
                                                              color: Colors.white,
                                                              borderRadius: BorderRadius.circular(10),
                                                            ),
                                                            padding: const EdgeInsets.all(10),
                                                            child: ClipRRect(
                                                              borderRadius: BorderRadius.circular(10),
                                                              child: VideoWidget(
                                                                url: state.data![index].videoTrailer,
                                                                play: true,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Icon(
                                            Icons.play_circle_fill_outlined,
                                            color: Colors.white,
                                            size: 50,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Row(
                                      children: [
                                        Text(
                                          state.data![index].title!,
                                          style: GoogleFonts.roboto(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                            color: const Color(0xffFFC700),
                                            borderRadius: BorderRadius.circular(5),
                                          ),
                                          child: Text(
                                            'IMAX',
                                            style: GoogleFonts.roboto(
                                              fontSize: 14,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '2022 | 2h 55m | Action, Crime, Drama',
                                      style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Robert Pattinson, Zoe Kravitz, Paul Dano',
                                      style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                  return SizedBox();
                },
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    RichText(
                        text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Latest',
                          style: GoogleFonts.roboto(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: '.',
                          style: GoogleFonts.roboto(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xffFFC700),
                          ),
                        ),
                      ],
                    )),
                    const Spacer(),
                    Text(
                      'View All',
                      style: GoogleFonts.roboto(
                        fontSize: 16,
                        color: const Color(0xffFFC700),
                      ),
                    ),
                  ],
                ),
              ),
              BlocConsumer<GetFilmBloc, BaseState<List<Film>>>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if (state is LoadedState) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                      child: Column(
                          children: List.generate(
                        state.data!.length,
                        (index) => Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: SizeConfig.safeBlockVertical * 30,
                                width: SizeConfig.safeBlockHorizontal * 30,
                                decoration: BoxDecoration(
                                  color: const Color(0xff424242),
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(state.data![index].cover!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.play_circle_fill_outlined,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.data![index].title!,
                                      style: GoogleFonts.roboto(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: const Color(0xffFFC700),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: Text(
                                        'IMAX',
                                        style: GoogleFonts.roboto(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      '2022 | 2h 55m | Action, Crime, Drama',
                                      style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'Robert Pattinson',
                                      style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      state.data![index].overview!,
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                    );
                  }
                  return SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

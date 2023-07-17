import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/services/movie_porvider.dart';
import 'package:provider/provider.dart';

class DetailsMovie extends StatelessWidget {
  const DetailsMovie({super.key, required this.data});
  final Results data;

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
      builder: (_, provider, __) {
        if (data.posterPath == '') {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              Stack(
                children: [
                  Icon(
                    Icons.star_rounded,
                    color: Colors.amber,
                    size: MediaQuery.of(context).size.width * .15,
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * .025,
                    left: MediaQuery.of(context).size.width * .047,
                    child: Text(
                      data.voteAverage!.toStringAsFixed(1).toString(),
                      textScaleFactor: 1.3,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          body: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .7,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(50),
                  ),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${data.posterPath}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .025,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .035,
                ),
                child: Column(
                  children: [
                    const Text(
                      'Overview',
                      textScaleFactor: 1.5,
                      style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .005,
                    ),
                    Text(
                      data.overview!,
                      textScaleFactor: 1.3,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .025,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontFamily: 'Caveat',
                            ),
                            children: [
                              TextSpan(
                                text: 'Adut: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .05,
                                ),
                              ),
                              TextSpan(
                                text: ' false',
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * .04,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontFamily: 'Caveat',
                            ),
                            children: [
                              TextSpan(
                                text: 'Language: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .05,
                                ),
                              ),
                              TextSpan(
                                text: data.originalLanguage!.toUpperCase(),
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * .04,
                                ),
                              ),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontFamily: 'Caveat',
                            ),
                            children: [
                              TextSpan(
                                text: 'releaseDate: ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber,
                                  fontSize:
                                      MediaQuery.of(context).size.width * .05,
                                ),
                              ),
                              TextSpan(
                                text: data.releaseDate,
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * .04,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

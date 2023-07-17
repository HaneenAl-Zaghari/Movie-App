import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:movie_app/details_movie.dart';
import 'package:movie_app/login.dart';
import 'package:movie_app/services/login_services.dart';
import 'package:movie_app/services/movie_porvider.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Consumer2<MovieProvider, SignInProvider>(
        builder: (_, provider, signIn, __) {
          return SafeArea(
            child: provider.movie?.results?.isNotEmpty ?? false
                ? Padding(
                    padding: EdgeInsets.fromLTRB(
                      MediaQuery.of(context).size.width * .05,
                      MediaQuery.of(context).size.width * .05,
                      MediaQuery.of(context).size.width * .05,
                      0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Hello ${FirebaseAuth.instance.currentUser?.displayName ?? 'User'}',
                              textScaleFactor: 2.5,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                signIn.logOut();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: FirebaseAuth
                                            .instance.currentUser?.photoURL ==
                                        null
                                    ? const AssetImage(
                                        'assets/profile_image.jpg')
                                    : null,
                                child: FirebaseAuth
                                            .instance.currentUser?.photoURL !=
                                        null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.network(
                                          FirebaseAuth
                                              .instance.currentUser!.photoURL!,
                                        ),
                                      )
                                    : null,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .075,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TypeAheadField(
                            hideOnError: true,
                            hideOnEmpty: true,
                            hideOnLoading: true,
                            suggestionsCallback: provider.searchMovies,
                            textFieldConfiguration: TextFieldConfiguration(
                              decoration: InputDecoration(
                                hintText: 'Search',
                                prefixIcon: const Icon(Icons.search_rounded),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            suggestionsBoxDecoration:
                                const SuggestionsBoxDecoration(
                              elevation: 0,
                            ),
                            itemBuilder: (context, itemData) {
                              return itemData.posterPath != null
                                  ? Row(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.2,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .025,
                                            vertical: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                .01,
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Image.network(
                                                'https://image.tmdb.org/t/p/w500${itemData.posterPath}'),
                                          ),
                                        ),
                                        Text(
                                          itemData.title!,
                                        ),
                                      ],
                                    )
                                  : Container();
                            },
                            onSuggestionSelected: (suggestion) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsMovie(data: suggestion),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .1,
                        ),
                        const Text(
                          'Popular Movies',
                          textScaleFactor: 2.2,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .03,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .5,
                          child: ListView.separated(
                            itemCount: provider.movie!.results!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical:
                                      MediaQuery.of(context).size.height * 0.01,
                                  horizontal:
                                      MediaQuery.of(context).size.width * 0.025,
                                ),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailsMovie(
                                          data: provider.movie!.results![index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .43,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Colors.grey,
                                              blurRadius: 3,
                                              spreadRadius: 1,
                                            ),
                                          ],
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          child: Image.network(
                                              'https://image.tmdb.org/t/p/w500${provider.movie!.results![index].posterPath}'),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .01,
                                      ),
                                      Text(
                                        buildMovieName(provider
                                                .movie!.results![index].title ??
                                            ''),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .055,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                width: 10,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        },
      ),
    );
  }

  String buildMovieName(String name) {
    if (name.length > 20) {
      return '${name.substring(0, 20)}...';
    } else {
      return name;
    }
  }
}

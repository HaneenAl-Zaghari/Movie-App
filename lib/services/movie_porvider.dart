import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieProvider extends ChangeNotifier {
  MovieModel? movie;

  MovieProvider() {
    getPopularMovies();
  }

  Future<void> getPopularMovies() async {
    try {
      var response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/popular?api_key=db6bad10d9c0576806b36144772b1f9f'),
      );
      var jsonString = jsonDecode(response.body);
      movie = MovieModel.fromJson(jsonString);
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<List<Results>> searchMovies(String movieName) async {
    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=db6bad10d9c0576806b36144772b1f9f&query=$movieName'));
    final List movies = jsonDecode(response.body)['results'];
    return movies.map((e) => Results.fromJson(e)).toList();
  }
}

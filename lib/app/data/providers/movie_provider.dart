import 'package:get/get.dart';
import '../models/movie_model.dart';

class MovieProvider extends GetConnect {
  String url = 'https://www.omdbapi.com/?s=batman&apikey=4831627d';

  Future<dynamic> getMovie() async {
    final response = await get(url);
    return response.body;
  }
}

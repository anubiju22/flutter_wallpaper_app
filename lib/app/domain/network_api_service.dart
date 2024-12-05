import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkApiService {
  static const String _baseUrl = "https://api.unsplash.com/photos";
  static const String _accessKey =
      "B7nVgN9AaJlHD1qw1onORDIQVtDAWrr9-OG_k31OVOQ"; 

  Future<List<dynamic>> fetchPhotos({int page = 1, int perPage = 10}) async {
    final Uri url = Uri.parse(
        "$_baseUrl?client_id=$_accessKey&page=$page&per_page=$perPage");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load photos");
    }
  }
}

import 'dart:convert';

import 'package:flutter_wallpaper_app/app/data/model/photos_model.dart';
import 'package:http/http.dart' as http;

class NetworkApiService {
  static const String _baseUrl = "https://api.pexels.com/v1/curated";
  static const String apiKey =
      "MCezKgAzpSIuuqZVmHshgiZk1tcKb9pZwYyeeHvzJfgX3ePDmljWQ5Ga";

  Future<List<PhotosModel>> fetchPhotos({int? page ,int? perPage}) async {
    final Uri url = Uri.parse("$_baseUrl?page=$page&per_page=$perPage");
    final response = await http.get(url, headers: {'Authorization': apiKey});

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load photos");
    }
  }
}

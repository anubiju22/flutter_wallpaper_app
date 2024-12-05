import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_app/app/data/model/photos_model.dart';
import 'package:flutter_wallpaper_app/app/domain/network_api_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final apiService = NetworkApiService();
  ScrollController scrollController = ScrollController();
  int page = 1;
  int pageSize = 20;
  final isLoading = false.obs;
  final RxBool hasMoreItems = true.obs;
  final isMoreLoading = false.obs;
  List<Photo> photosList = <Photo>[].obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        if (hasMoreItems.value) {
          scrollMoreData();
        }
      }
    });
    fetchPhotos();
  }

  void scrollMoreData() async {
    page++;
    isMoreLoading(true);
    await getPhotos();
    isMoreLoading(false);
  }

  void fetchPhotos() async {
    page = 1;
    isLoading(true);
    hasMoreItems(true);
    photosList.clear();
    await getPhotos();
    isLoading(false);
  }

  Future<void> getPhotos() async {
    isLoading(true);
    final response =
        await apiService.fetchPhotos(page: page, perPage: pageSize);
    if (response.isNotEmpty) {
      photosList.addAll(response.first.photos!);
    }
  }
}

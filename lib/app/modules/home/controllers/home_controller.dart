import 'package:flutter_wallpaper_app/app/domain/network_api_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final apiService = NetworkApiService();

  final isLoading = false.obs;
  final currentPage = 1.obs;

  @override
  void onInit() {
    super.onInit();
  }

  
}

import 'package:get/get.dart';
import 'package:getx_practice/data/model/photos_model.dart';
import 'package:getx_practice/data/services/img_services.dart';

class ImageController extends GetxService {
  var isLoading = false.obs;

  var imgList = <PhotosModel>[].obs;

  fetchImgDataController() async {
    try {
      isLoading(true);
      var data = await FetchImageDataAPI().fetchImgData();
      var imageData = (data).map((json) => PhotosModel.fromJson(json)).toList();
      imgList.assignAll(imageData);
    } finally {
      isLoading(false);
    }
  }
}

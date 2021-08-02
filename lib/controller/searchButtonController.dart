import 'package:get/get.dart';
import 'package:liveasy_admin/services/showDialog.dart';

class SearchButtonController extends GetxController {

RxBool isSearching = false.obs;
void updateOnSearchButtonPressed(bool newValue) {
  isSearching.value = !isSearching.value;
  
  

}
}


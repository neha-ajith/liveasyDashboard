import 'package:get/get.dart';

class SearchButtonController extends GetxController {

RxBool isSearching = false.obs;
void updateOnSearchButtonPressed(bool newValue) {
  isSearching.value = !isSearching.value;

}
}


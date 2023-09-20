import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class MainContainerController extends GetxController {
  //Declerations
  final Rx<PersistentTabController> _bottomNavigationBarController =
      PersistentTabController().obs;
  final _selectedTabIndex = 0.obs;

  //Getters
  PersistentTabController get bottomNavigationBarController =>
      _bottomNavigationBarController.value;
  int get selectedTebIndex => _selectedTabIndex.value;

  //Logic
  changeSelectedTapIndex(int index) {
    _selectedTabIndex.value = index;
    bottomNavigationBarController.index = index;
  }
}

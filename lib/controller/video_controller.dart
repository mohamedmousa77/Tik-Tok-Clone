

import 'package:get/get.dart';

class VideoController extends GetxController{
  int pageIndex = 0 ;
  int selectPage(int newPageIndex){
    pageIndex = newPageIndex;
    update();
    return pageIndex;
  }
}
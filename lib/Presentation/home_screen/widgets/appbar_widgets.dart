import 'package:asset/Domain/buttons/appbarbuttons.dart';
import 'package:asset/Presentation/bag_screen/bag_screen.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenAppbar{
  static List<Widget>? actions =[
    kAppbarButton(onPressed: (){
      Get.to(BagScreen());
    }, icon: CupertinoIcons.bag)
  ];
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_viewer/main.dart';
import 'package:post_viewer/view/post_categories.dart';

import 'home.dart';

class SideNavigationMenu extends StatefulWidget
{
  SideNavigationMenuState createState()=>SideNavigationMenuState();
}
class SideNavigationMenuState extends State<SideNavigationMenu>
{

  bool showExpanded=false;
  @override
  Widget build(BuildContext context) {
    return  Drawer(
        child: ListView(
      children: [
        ListTile(
          leading: Text('HOME'), tileColor: Colors.white,
          onTap: (){
            Get.to(Home());
          },
        ),
        displayVerticalLine(),
        ListTile(
          onTap: (){
            setState(() {
              showExpanded=!showExpanded;
            });
          },
          leading: Text('CATEGORIES'),
          trailing: Icon(showExpanded?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down),
          tileColor: Colors.white,
        ),
        if(!showExpanded)
          displayVerticalLine(),
        if(showExpanded)
          Container(child:showExpandedList(), height: 400,),
      ],

    ));
  }
  showExpandedList()
  {
    return ListView(
      children: [
        makeCategoryTile(Icons.travel_explore_rounded, 'Explorer'),
        makeCategoryTile(Icons.nature_rounded, 'Nature'),
        makeCategoryTile(Icons.water_outlined, 'Ocean'),
        makeCategoryTile(Icons.photo_camera, 'Photography'),
        makeCategoryTile(Icons.explore_rounded, 'Safari'),
        makeCategoryTile(Icons.wb_sunny_outlined, 'Summer'),
        makeCategoryTile(Icons.card_travel, 'Travelling'),
        makeCategoryTile(Icons.money_outlined, 'Value for money'),
        makeCategoryTile(Icons.snowboarding, 'Winter'),
      ],
    );
  }
  makeCategoryTile(icon, name)
  {
    return ListTile(
      leading: Icon(icon, color: postCategoryController.categoryName==name?Colors.purpleAccent:Colors.purple,),
      title: Text(name, style: TextStyle(color: postCategoryController.categoryName==name?Colors.purpleAccent:Colors.purple),),
      onTap: (){
        print('started');
        postCategoryController.categoryName='$name'.obs;
        print('name setting done');
        postCategoryController.generate();
        print('list generated');
        Get.to(PostCategories());
      },
    );
  }
  displayVerticalLine()
  {
    return Container(
      height: 2,
      color: Color.fromARGB(255, 0xdd, 0xdd, 0xdd),
    );
  }
  displayHorizontalLine()
  {
    return Container(
      width: 20,
      color: Color.fromARGB(255, 0xdd, 0xdd, 0xdd),
    );
  }
}
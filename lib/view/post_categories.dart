import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_viewer/controllers/controllers.dart';
import 'package:post_viewer/models/categories.dart';
import 'package:post_viewer/models/posts.dart';
import 'package:post_viewer/view/post_details.dart';
import 'package:post_viewer/view/side_navigation.dart';
import 'package:post_viewer/main.dart';

class PostCategories extends StatefulWidget
{
  PostCategoriesState createState()=> PostCategoriesState();
}
class PostCategoriesState extends State<PostCategories> {

  BuildContext? ctx;
  onPressed() {
  }

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Spruce'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      drawer: SideNavigationMenu(),
      body: buildBody(),
    );
  }
  buildBody() {
    return GetX<PostController>(
        builder: (_) {
          return ListView.builder(
            itemCount: postCategoryController.categoryList.length,
            itemBuilder: (context, index){
              // return Text('hello');
              return cardDetails(postCategoryController.categoryList[index]);
            },
          );
        });
  }

  buildImage(url) {
    return Stack(
      alignment: Alignment.bottomLeft,
      fit: StackFit.loose,
      children: [
        Image.network('$url'),

        // RaisedButton(
        //   onPressed: onPressed,
        //   color: Colors.white,
        //   child: Text('Africa', style: TextStyle(color: Colors.black),),
        // ),
      ],
    );
  }

  cardDetails(Post post) {
    print(post.imageUrl);
    return Container(
      color: Colors.white70,
      child: Column(
        children: [
          buildImage(post.imageUrl),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, bottom: 6),
            child: Container(
                width: MediaQuery
                    .of(ctx!)
                    .size
                    .width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                        bottomLeft: Radius.circular(15)
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Column(
                    children: [
                      picNameCat(post.categories, post.title['rendered'], post),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 350),
                        child: Divider(
                          thickness: 2,
                          color: Color.fromARGB(255, 0x87, 0x2b, 0xd5),
                        ),
                      ),
                      dateWithIcon(post.date),
                      description(post.content['rendered']),
                      userDetail(),
                    ],
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }

  picNameCat(categoryIds, postName, post) {
    List<String> categoryNames = [];
    for (Categories cat in categoryController.categoriesList) {
      for (int i in categoryIds) {
        if (cat.id == i) {
          categoryNames.add(cat.name!);
        }
      }
    }
    return Container(
      alignment: Alignment.centerLeft,
      child: ListTile(
        title: TextButton(
          onPressed: () {
            activePostController.activePost=post;
            Get.to(PostDetails());
          },
          child: Text('$postName', style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,),

        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            "Categories: ${categoryNames.toString().substring(1, categoryNames.toString().length-1)}",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  dateWithIcon(date) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Icon(
              Icons.date_range,
              size: 14,
              color: Colors.black45,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${date.substring(0,10)}",
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  description(content) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        height: 100,
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "${content.substring(4, content.length)}",
            style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                letterSpacing: 1,
                wordSpacing: 1
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  userDetail() {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 10),
      child: Container(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              children: [
                Icon(
                  Icons.account_circle_sharp,
                  size: 40,
                  color: Colors.black45,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "hesta-admin",
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.black
                    ),
                  ),
                ),
                Container(width: 60,),
                Container(
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            width: 2,
                            color: Colors.purple
                        )
                    ),
                    child: IconButton(
                        onPressed: null,
                        icon: Icon(Icons.build_sharp, size: 15,)
                    )
                ),
                Container(width: 4,),
                Container(
                  height: 35,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.purple,
                  ),
                  child: TextButton(
                      onPressed: null,
                      child: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Text("Read More", style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            wordSpacing: 1,
                            letterSpacing: 2
                        ),),
                      )),
                )
              ],
            )
        ),
      ),
    );
  }
}
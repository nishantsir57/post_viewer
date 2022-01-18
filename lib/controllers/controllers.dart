import 'package:flutter/material.dart';
import 'package:post_viewer/main.dart';
import 'package:post_viewer/models/categories.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:post_viewer/constants.dart';
import 'dart:convert';
import 'package:post_viewer/models/posts.dart';

class CategoriesController extends GetxController
{
  RxList categoriesList=[].obs;
  var jsonList=[];
  static Future getCategoriesData() async
  {
    return await http.get(Uri.parse(CATEGORIES_DATA_URL));
  }
  storeCategoriesData()async
  {
    await CategoriesController.getCategoriesData().then((response) => jsonList=json.decode(response.body));
    for(var element in jsonList)
    {
      Categories categorie = Categories.fromJson(element);
      categoriesList.add(categorie);
    }
    print('categories size is ${categoriesList.length}');
  }
}

class PostController extends GetxController
{
  RxList postList=[].obs;
  var jsonList=[];
  RxInt pageNumber=1.obs;
  static Future getPostsData(pNo) async
  {
    return await http.get(Uri.parse('$PAGINATION_URL${pNo}'));
  }
  static Future getImageUrl(id)async
  {
    String newURL=IMAGE_FETCH_URL+id.toString();
    return await http.get(Uri.parse('$newURL'));
  }

  storePostData()async
  {
    await PostController.getPostsData(pageNumber).then((response) => jsonList=json.decode(response.body));
    for(var element in jsonList)
    {
      Post post = Post.fromJson(element);
      String url=post.links['wp:featuredmedia'][0]['href'];
      final urlIndex=url.split('/');
      String imageId=urlIndex.elementAt(urlIndex.length-1);

      await PostController.getImageUrl(imageId).then((response) {

        final jsonMap=json.decode(response.body);
        Post p1=Post.fromJson(jsonMap);
        post.imageUrl=p1.guid['rendered'];
      }
      );
      postList.add(post);
    }
    update();
  }
}
class ActivePostController extends GetxController
{
  Post activePost=Post().obs as Post;
}

class CategoryController extends GetxController
{
  RxList categoryList=[].obs;
  RxString categoryName=''.obs;
  var jsonList=[];

  static Future getPostsData() async
  {
    return await http.get(Uri.parse('$POSTS_DATA_URL'));
  }
  static Future getImageUrl(id)async
  {
    String newURL=IMAGE_FETCH_URL+id.toString();
    return await http.get(Uri.parse('$newURL'));
  }
  generate()async
  {
    await CategoryController.getPostsData().then((response) => jsonList=json.decode(response.body));
    for(var element in jsonList)
    {
      Post post = Post.fromJson(element);
      String url=post.links['wp:featuredmedia'][0]['href'];
      final urlIndex=url.split('/');
      String imageId=urlIndex.elementAt(urlIndex.length-1);

      await PostController.getImageUrl(imageId).then((response) {

        final jsonMap=json.decode(response.body);
        Post p1=Post.fromJson(jsonMap);
        post.imageUrl=p1.guid['rendered'];
      }
      );
      categoryList.add(post);
    }
    update();
    for(Post post in postController.postList)
      {
        if(post.title == categoryName)
          {
            categoryList.add(post);
          }
      }
  }
}
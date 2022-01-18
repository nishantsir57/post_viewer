import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:post_viewer/view/side_navigation.dart';

import '../main.dart';

class PostDetails extends StatelessWidget
{
  BuildContext? ctx;
  @override
  Widget build(BuildContext context) {
    ctx=context;
    return Scaffold(
      appBar: AppBar(
        title: Text('Spruce'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
        drawer: SideNavigationMenu(),
        body: cardDetails(activePostController.activePost),
    );
  }
  cardDetails(post)
  {
    return ListView(
      children: [
        picNameCat(post.categories, post.title['rendered']),
        dateWithIcon(post.date),
        buildImage(),
        description(post.content['rendered']),
      ],
    );
  }

  onPressed(){}
  buildImage() {
    return Stack(
      alignment: Alignment.bottomLeft,
      fit: StackFit.loose,
      children: [
        Image.network(
            "https://spruce.hestawork.com/wp-content/uploads/2019/06/giraf-350x221.jpg"),

        RaisedButton(
          onPressed: onPressed,
          color: Colors.white,
          child: Text('Africa', style: TextStyle(color: Colors.black),),
        ),
      ],
    );
  }
  picNameCat(categoryIds, postName) {
    return
      Container(
      height: 30,
      alignment: Alignment.center,
      width: MediaQuery.of(ctx!).size.width,
      child: Text(
        "$postName",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),)
    );
  }

  dateWithIcon(date) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Container(
        alignment: Alignment.center,
        child: ListTile(
          title: Row(
            children: [
              Container(width: 120,),
              Icon(
                Icons.date_range,
                size: 14,
                color: Colors.black45,
              ),
              Container(
                child: Text(
                  "${date.substring(0,10)}",
                  textAlign: TextAlign.right,
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

      ),
    );
  }

  description(content) {
    return Container(
      height: 400,
      child:Column(
          children: [
        Flexible(
          child:Text(
        "${content.substring(4, content.length)}",
        style: TextStyle(
            fontSize: 15,
            color: Colors.black,
            letterSpacing: 1,
            wordSpacing: 1
        ),
        maxLines: 100,
        overflow: TextOverflow.ellipsis,
      ),)
      ])
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
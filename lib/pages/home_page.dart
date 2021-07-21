import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/colors.dart';
import '../util/constant.dart';
import '../util/new_feed_json.dart';
import '../util/story_json.dart';
import 'chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(size),
    );
  }
  PreferredSizeWidget getAppBar(){
    return PreferredSize(
      preferredSize: Size.fromHeight(55),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset('assets/svg/logo.png', width: 90,),
              IconButton(
                splashRadius: 15,
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_) => ChatPage()));
                  },
                  icon: Icon(FontAwesome5Brands.facebook_messenger),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getBody(size){
    return ListView(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(top: 5, left: 5, right: 5),
          child: Row(
            children: List.generate(stories.length, (index){
              return Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  width: 80,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          stories[index]['isStory'] == true
                          ? Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(colors: bgStoryColors,),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(width: 2, color: bgWhite,),
                                    image: DecorationImage(
                                        image: NetworkImage(stories[index]['imageUrl'].toString()),
                                        fit: BoxFit.cover
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(width: 1, color: bgGrey,),
                                  image: DecorationImage(
                                      image: NetworkImage(stories[index]['imageUrl'].toString()),
                                      fit: BoxFit.cover
                                  ),
                                ),
                              ),
                            ),
                          stories[index]['isStory'] == true
                          ? Positioned(
                              right: 5,
                              bottom: 0,
                              child: Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: primary,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    color: bgWhite,
                                    size: 20,
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                          SizedBox(height: 5,),
                          Text(
                            stories[index]['username'].toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,

                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        Divider(),
        Column(
          children: List.generate(newFeeds.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(colors: bgStoryColors),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(1.3),
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(width: 1, color: bgWhite),
                                    image: DecorationImage(
                                      image: NetworkImage(newFeeds[index]['profile'].toString()),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Text(
                              newFeeds[index]['username'].toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Icon(FontAwesome.ellipsis_v, size: 15,),
                      ],
                    ),
                  ),
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(newFeeds[index]['imageUrl'].toString()),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              splashRadius: 15,
                              onPressed: (){},
                              icon: newFeeds[index]['isLIke'] == true
                                  ? SvgPicture.asset('assets/svg/heart_red.svg', width: 25,height: 25,)
                                  : SvgPicture.asset('assets/svg/heart.svg', width: 25,height: 25,),
                            ),
                            IconButton(
                              splashRadius: 15,
                              onPressed: (){},
                              icon: Icon(FontAwesome.comment_o, size: 25,),
                            ),
                            IconButton(
                              splashRadius: 15,
                              onPressed: (){},
                              icon: SvgPicture.asset('assets/svg/share.svg', width: 20,height: 20,),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: (){},
                          icon: Icon(Feather.bookmark),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${newFeeds[index]['likes'].toString()} likes',
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: newFeeds[index]['username'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              TextSpan(
                                  text: newFeeds[index]['caption'].toString(),
                                  style: TextStyle(
                                    height: 1.5,
                                  )
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text(
                          newFeeds[index]['comments'].toString(),
                          style: TextStyle(
                            color: textGrey,
                          ),
                        ),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            Container(
                              width: (size.width - 30) * 0.7,
                              child: Row(
                                children: [
                                  Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(width: 1, color: bgGrey,),
                                        image: DecorationImage(
                                          image: NetworkImage(profile),
                                          fit: BoxFit.cover,
                                        )
                                    ),
                                  ),
                                  Container(
                                    height: 25,
                                    width: (size.width - 70) * 0.7,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                                      child: TextField(
                                        cursorColor: textBlack.withOpacity(0.5),
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Add a comment',
                                            hintStyle: TextStyle(
                                              fontSize: 14,
                                              color: textBlack.withOpacity(0.5),
                                            )
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: (size.width - 30) * 0.3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('👍'),
                                  SizedBox(width: 8),
                                  Text('😆'),
                                  SizedBox(width: 8),
                                  Icon(Icons.add_circle_outline, size: 20,),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5,),
                        Text(
                          newFeeds[index]['dateTime'].toString(),
                          style: TextStyle(fontSize: 12, color: textGrey,),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ],
    );
  }
}

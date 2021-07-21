import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart' show AntDesign, Feather, FontAwesome;

import '../theme/colors.dart';
import '../util/account_posts_json.dart';
import '../util/constant.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(size),
    );
  }

  PreferredSizeWidget getAppBar() {
    return PreferredSize(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Feather.lock,
                    size: 18,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    userName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(AntDesign.plus),
                    splashRadius: 15,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(FontAwesome.bars),
                    splashRadius: 15,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      preferredSize: Size.fromHeight(55),
    );
  }

  Widget getBody(size) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: (size.width - 20) * 0.3,
                    child: Stack(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1, color: bgGrey),
                            image: DecorationImage(
                              image: NetworkImage(profile),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 25,
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: primary,
                              border: Border.all(width: 1, color: bgWhite),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: bgWhite,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: (size.width - 20) * 0.7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                                '97',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Posts',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '34',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Followers',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '314',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Following',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Text(instagramName),
              Text(instagramBio),
              SizedBox(height: 15,),
              Container(
                height: 35,
                width: (size.width - 20),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: bgGrey),
                  borderRadius: BorderRadius.circular(5),
                  color: bgLightGrey,
                ),
                child: Center(
                  child: Text(
                    'Edit Profile',
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Story Highlights',
                    style: TextStyle(fontWeight: FontWeight.bold,),
                  ),
                  Icon(FontAwesome.angle_down, size: 20,),
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 15,),
        Container(
          height: 0.5,
          width: size.width,
          decoration: BoxDecoration(color: bgGrey.withOpacity(0.8)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3),
          child: Row(
            children: [
              Container(
                width: (size.width * 0.5),
                child: IconButton(
                  splashRadius: 5,
                  icon: Icon(FontAwesome.th, color: selectedIndex == 0 ? textBlack : textBlack.withOpacity(0.5),),
                  onPressed: (){
                    setState(() {
                      selectedIndex = 0;
                    });
                  },
                ),
              ),
              Container(
                width: (size.width * 0.5),
                child: IconButton(
                  splashRadius: 5,
                  icon: Icon(FontAwesome.id_badge, color: selectedIndex == 0 ? textBlack : textBlack.withOpacity(0.5),),
                  onPressed: (){
                    setState(() {
                      selectedIndex = 1;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                Container(
                  height: 1,
                  width: (size.width * 0.5),
                  decoration: BoxDecoration(
                    color: selectedIndex == 0 ? bgDark : Colors.transparent,
                  ),
                ),
                Container(
                  height: 1,
                  width: (size.width * 0.5),
                  decoration: BoxDecoration(
                    color: selectedIndex == 1 ? bgDark : Colors.transparent,
                  ),
                ),
              ],
            ),
            Container(
              height: 0.5,
              width: size.width,
              decoration: BoxDecoration(color: bgGrey.withOpacity(0.8)),
            ),
          ],
        ),
        SizedBox(height: 3,),
        IndexedStack(
          index: selectedIndex,
          children: [
            getPosts(size),
            getPostWithTags(size),
          ],
        )
      ],
    );
  }

  Widget getPosts(size){
    return Wrap(
      direction: Axis.horizontal,
      spacing: 3,
      runSpacing: 3,
      children: List.generate(posts.length, (index) {
        return Container(
          height: 150,
          width: (size.width - 6) / 3,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(posts[index]),
              fit: BoxFit.cover,
            ),
          ),
        );
      }),
    );
  }
  Widget getPostWithTags(size){
    return Wrap(
      direction: Axis.horizontal,
      spacing: 3,
      runSpacing: 3,
      children: List.generate(postsWithTags.length, (index) {
        return Container(
          height: 150,
          width: (size.width - 6) / 3,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(postsWithTags[index]),
              fit: BoxFit.cover,
            ),
          ),
        );
      }),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart' show Feather;
import 'package:instagram_clon/util/chat_detail_json.dart';

import '/util/constant.dart';
import '../util/chat_json.dart';
import '../theme/colors.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({Key? key}) : super(key: key);

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: textBlack,
                  ),
                  splashRadius: 15,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 33,
                  width: 33,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(chats[0]['profile'].toString()),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  chats[0]['userName'].toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  splashRadius: 20,
                  onPressed: () {},
                  icon: Icon(Feather.video),
                ),
                SizedBox(
                  width: 5,
                ),
                IconButton(
                  splashRadius: 20,
                  onPressed: () {},
                  icon: Icon(Feather.info),
                ),
              ],
            ),
          ],
        ),
      ),
      preferredSize: Size.fromHeight(55),
    );
  }

  Widget getBody(size) {
    return ListView(
      children: [
        Container(
          height: size.height * 0.83,
          child: ListView(
            children: List.generate(chatDetails.length, (index) {
              return Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: ChatBubbles(
                  isMe: chatDetails[index]['isMe'],
                  message: chatDetails[index]['message'],
                  profile: chatDetails[index]['profile'],
                  messageNo: chatDetails[index]['messageNo'],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}

class ChatBubbles extends StatelessWidget {
  final bool isMe;
  final String profile, message;
  final int messageNo;

  const ChatBubbles(
      {Key? key,
      required this.isMe,
      required this.profile,
      required this.message,
      required this.messageNo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isMe) {
      return Padding(
        padding: EdgeInsets.only(top: 1.5, bottom: 1.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius:  getBorderRadiusMessage(messageNo),
                  color: bgGrey.withOpacity(0.3)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  message,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(top: 1.5, bottom: 1.5),
        child: Row(
          children: [
            Container(
              height: 33,
              width: 33,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(profile),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: bgGrey.withOpacity(0.3)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  message,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  getBorderRadiusMessage(messageNo) {
    if(isMe){
      if(messageNo == 1){
        return BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(5),
        );
      } else if(messageNo == 2){
          return BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            topRight: Radius.circular(5),
            bottomRight: Radius.circular(5),
          );
      } else if(messageNo == 3){
          return BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            topRight: Radius.circular(5),
            bottomRight: Radius.circular(20),
          );
      } else {
        return BorderRadius.circular(20);
      }
    } else {
      if(messageNo == 1){
        return BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(5),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        );
      } else if(messageNo == 2){
        return BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(5),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        );
      } else if(messageNo == 3){
        return BorderRadius.only(
          topLeft: Radius.circular(5),
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        );
      } else {
        return BorderRadius.circular(20);
      }
    }
  }
}

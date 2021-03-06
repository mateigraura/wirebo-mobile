import 'package:flutter/material.dart';
import 'package:wirebo/models/user.dart';
import 'package:wirebo/style/colors.dart';
import 'package:wirebo/models/message.dart';
import 'package:wirebo/services/message_service.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _messageBubble(Message message, bool isMe) {
    final Container msg = Container(
      margin: isMe
          ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0, right: 8.0)
          : EdgeInsets.only(top: 8.0, bottom: 8.0, left: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        color: isMe ? chatBubbleMe : chatBubbleFriend,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            bottomLeft: isMe ? Radius.circular(15.0) : Radius.zero,
            topRight: Radius.circular(15.0),
            bottomRight: isMe ? Radius.zero : Radius.circular(15.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: SelectableText(
              message.text,
              style: TextStyle(
                color: appWhite,
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Container(
                margin: EdgeInsets.only(top: 8.0),
                child: Text(
                  message.time,
                  style: TextStyle(
                    color: isMe ? chatBubbleTimeMe : chatLighGrey,
                    fontSize: 10.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )),
        ],
      ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: <Widget>[msg],
    );
  }

  _messageInput() {
    return Container(
      height: 50.0,
      color: Theme.of(context).primaryColor,
      child: Row(
        children: <Widget>[
          Material(
            color: Theme.of(context).primaryColor,
            child: IconButton(
              icon: Icon(Icons.photo),
              iconSize: 28.0,
              color: chatLighGrey,
              onPressed: () {},
            ),
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              textInputAction: TextInputAction.newline,
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 5,
              onChanged: (value) {},
              decoration: InputDecoration.collapsed(
                  hintText: 'Message',
                  hintStyle: TextStyle(color: chatBubbleFriend)),
              style: TextStyle(color: appWhite),
            ),
          ),
          Material(
            color: Theme.of(context).primaryColor,
            child: IconButton(
              icon: Icon(Icons.attach_file),
              iconSize: 28.0,
              color: chatLighGrey,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: chatBackground,
      appBar: AppBar(
        title: Text(
          widget.user.name,
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            iconSize: 25.0,
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: ClipRRect(
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(top: 15.0),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int idx) {
                      return _messageBubble(
                          messages[idx], messages[idx].user.id == me.id);
                    },
                  ),
                ),
              ),
            ),
            _messageInput(),
          ],
        ),
      ),
    );
  }
}

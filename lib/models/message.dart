import 'package:wirebo/models/user.dart';

class Message {
  final User user;
  final String time;
  final String text;
  final bool unread;

  Message({
    this.user,
    this.time,
    this.text,
    this.unread,
  });
}

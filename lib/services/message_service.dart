import 'package:wirebo/models/user.dart';
import 'package:wirebo/models/message.dart';

final User me = User(
  id: 0,
  name: 'Me',
  imageUrl: 'assets/images/default-avatar.jpg',
);
final User user_1 = User(
  id: 1,
  name: 'User 1',
  imageUrl: 'assets/images/default-avatar.jpg',
);
final User user_2 = User(
  id: 2,
  name: 'User 2',
  imageUrl: 'assets/images/default-avatar.jpg',
);
final User user_3 = User(
  id: 3,
  name: 'User 3',
  imageUrl: 'assets/images/default-avatar.jpg',
);
final User user_4 = User(
  id: 4,
  name: 'User 4',
  imageUrl: 'assets/images/default-avatar.jpg',
);

List<User> favorites = [user_1, user_2, user_3];

List<Message> chats = [
  Message(
    user: user_1,
    time: '15:30 pm',
    text: 'Hi ? How\'s it going?',
    unread: false,
  ),
  Message(
    user: user_2,
    time: '14:30 pm',
    text: 'Hi ? How\'s it going?',
    unread: true,
  ),
  Message(
    user: user_3,
    time: '2:30 am',
    text: 'Hi ? How\'s it going?',
    unread: false,
  ),
  Message(
    user: user_4,
    time: '12:30 am',
    text: 'Hi ? How\'s it going?',
    unread: true,
  )
];

List<Message> messages = [
  Message(
    user: user_1,
    time: '2:30 pm',
    text: 'Lorem ipsum',
    unread: false,
  ),
  Message(
    user: me,
    time: '2:32 pm',
    text: 'Lorem ipsum!',
    unread: false,
  ),
  Message(
    user: user_1,
    time: '2:45 pm',
    text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    unread: false,
  ),
  Message(
    user: user_1,
    time: '3:15 pm',
    text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    unread: false,
  ),
  Message(
    user: me,
    time: '3:30 pm',
    text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    unread: false,
  ),
  Message(
    user: user_1,
    time: '3:42 pm',
    text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
    unread: false,
  )
];

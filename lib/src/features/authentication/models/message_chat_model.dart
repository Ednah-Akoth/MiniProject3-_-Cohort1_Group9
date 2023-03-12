import 'package:flutter/foundation.dart';

class MessageChat {
  final String avatarUrl;
  final String name;
  final String currenttime;
  final String message;

  MessageChat(
      {required this.avatarUrl,
      required this.name,
      required this.currenttime,
      required this.message});

  static final List<MessageChat> dummyMessage = [
    MessageChat(
        avatarUrl: "https://randomuser.me/api/portraits/women/34.jp",
        name: "Laurent",
        currenttime: "20:18",
        message: "How about meeting tomorrow? Today I am unavailable"),
    MessageChat(
        avatarUrl: "https://randomuser.me/api/portraits/women/49.jpg",
        name: "Tracy",
        currenttime: "19:22",
        message:
            "I love that idea, it's great! Hopefully you will tell me more about it"),
    MessageChat(
        avatarUrl: "https://randomuser.me/api/portraits/men/81.jpg",
        name: "Joe",
        currenttime: "11:05",
        message: "Flutter just release 1.0 officially. Should I go for it?"),
    MessageChat(
        avatarUrl: "https://randomuser.me/api/portraits/men/83.jpg",
        name: "Mark",
        currenttime: "09:46",
        message: "It totally makes sense to get some extra day-off.")
  ];
}

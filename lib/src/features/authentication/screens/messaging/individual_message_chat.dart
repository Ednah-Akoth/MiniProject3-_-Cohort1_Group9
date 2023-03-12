import 'package:flutter/material.dart';
import 'package:job_finder/src/features/authentication/models/message_chat_model.dart';
import 'package:job_finder/src/features/authentication/models/message_chat_model.dart';

import '../../models/message_chat_model.dart';

class messagePage extends StatefulWidget {
  messagePage({Key? key, required this.messageChat}) : super(key: key);
  final MessageChat messageChat;
  @override
  State<messagePage> createState() => _messagePage();
}

class _messagePage extends State<messagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.messageChat.name,
            textAlign: TextAlign.center,
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: MessageChat.dummyMessage.length,
                    itemBuilder: (context, index) {
                      final chat = MessageChat.dummyMessage[index];
                      return ListTile(
                        title: Text(chat.name),
                        subtitle: Text(chat.message),
                      );
                    }))
          ],
        ));
  }
}

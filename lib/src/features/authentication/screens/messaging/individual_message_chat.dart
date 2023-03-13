import 'package:flutter/material.dart';
import 'package:job_finder/main.dart';
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
        body: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              ListView(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width - 950,
                        child: Card(
                          color: Colors.grey.shade300,
                          margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            minLines: 1,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Type a Message',
                                contentPadding: EdgeInsets.all(5)),
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:job_finder/src/constants/colors.dart';
import 'package:job_finder/src/features/authentication/models/chat_model.dart';
import 'package:job_finder/src/features/authentication/screens/navpages/individual_message_chat.dart';

import '../../models/message_chat_model.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Messages',
          style: TextStyle(
              color: tPrimaryColor,
              fontWeight: FontWeight.w600,
              fontFamily: "Nunito",
              fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      // ignore: prefer_const_constructors
      body: Column(
        children: [
          const Divider(
            height: 30.0,
            color: Colors.white24,
          ),
          const SizedBox(
            width: 350.0,
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: Icon(Icons.filter_list_sharp),
                  hintText: 'Search...',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)))),
            ),
          ),
          const Divider(
            height: 30.0,
            color: Colors.white,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: ChatModel.dummyData.length,
                  itemBuilder: ((context, index) {
                    ChatModel _model = ChatModel.dummyData[index];
                    return Dismissible(
                        onDismissed: (direction) {
                          setState(() {
                            ChatModel.dummyData.removeAt(index);
                          });
                        },
                        background: Container(
                          color: tdismissable,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Icon(Icons.delete_outline_outlined,
                                  color: tPrimaryColor, size: 30),
                            ],
                          ),
                        ),
                        key: ValueKey(ChatModel.dummyData[index]),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => messagePage(
                                          messageChat:
                                              MessageChat.dummyMessage[index],
                                        ))));
                          },
                          child: Column(
                            children: <Widget>[
                              const Divider(
                                height: 12.0,
                              ),
                              ListTile(
                                  leading: CircleAvatar(
                                      radius: 24.0,
                                      backgroundImage:
                                          NetworkImage(_model.avatarUrl)),
                                  title: Row(
                                    children: <Widget>[
                                      Text(
                                        _model.name,
                                        style: const TextStyle(
                                            color: tTextColor,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Nunito',
                                            fontSize: 19),
                                      ),
                                      const SizedBox(
                                        width: 200.0,
                                      ),
                                      Text(
                                        _model.datetime,
                                        style: const TextStyle(fontSize: 12.0),
                                      ),
                                    ],
                                  ),
                                  subtitle: Text(
                                    _model.message,
                                    style: const TextStyle(
                                      fontFamily: "nunito",
                                      fontWeight: FontWeight.w600,
                                      color: tTextAccentColor,
                                    ),
                                  ),
                                  trailing: Container(
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                        color: tPrimaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          _model.numberoftexts,
                                          style: const TextStyle(
                                              fontFamily: "nunito",
                                              fontWeight: FontWeight.w600,
                                              color: tWhiteColor),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ));
                  })))
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Color(0xFF702963),
        icon: Icon(Icons.add),
        label: Text("New Chat"),
      ),
    );
  }
}

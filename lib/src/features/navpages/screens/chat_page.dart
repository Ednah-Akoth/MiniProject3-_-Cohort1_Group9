import 'package:flutter/material.dart';
import 'package:job_finder/src/constants/colors.dart';
import 'package:job_finder/src/features/navpages/models/chat_model.dart';

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

      body: Container(
        // not using a loop. instead builder will loop and read the data
        child: ListView.builder(
          itemCount: ChatModel.dummyData.length,
          itemBuilder: ((context, index) {
            ChatModel _model = ChatModel.dummyData[index];
            return Column(
              children: <Widget>[
                const Divider(
                  height: 12.0,
                ),
                ListTile(
                    leading: CircleAvatar(
                      radius: 24.0,
                      backgroundImage: NetworkImage(_model.avatarUrl),
                    ),
                    title: Row(
                      children: <Widget>[
                        Text(
                          _model.name,
                          style: TextStyle(
                              color: tTextColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Nunito",
                              fontSize: 19),
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        Text(
                          _model.datetime,
                          style: const TextStyle(fontSize: 12.0),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      _model.message,
                      style: TextStyle(
                          fontFamily: "nunito",
                          fontWeight: FontWeight.w600,
                          color: tTextAccentColor),
                    ),
                    trailing: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: tPrimaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            _model.numberoftexts,
                            style: TextStyle(
                                fontFamily: "nunito",
                                fontWeight: FontWeight.w600,
                                color: tWhiteColor),
                          ),
                        ],
                      ),
                    ))
              ],
            );
          }),
        ),
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

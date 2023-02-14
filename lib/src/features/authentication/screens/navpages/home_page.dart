import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:job_finder/src/constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, height:869, width)
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text('Gustavo Lipshutz'),
              accountEmail: Text(
                'UI/UX designer',
              ),
              currentAccountPicture: CircleAvatar(),
            ),
            const ListTile(
              title: Text('Account'),
            ),
            const ListTile(
              leading: Icon(Icons.person),
              title: Text('Personal Info'),
            ),
            const Divider(
              height: 1,
            ),
            const ListTile(
              leading: Icon(Icons.cases_outlined),
              title: Text('Experience'),
            ),
            const Divider(
              height: 1,
            ),
            const ListTile(
              title: Text('General'),
            ),
            const ListTile(
              leading: Icon(Icons.notifications_none_outlined),
              title: Text('Notifications'),
            ),
            const Divider(
              height: 1,
            ),
            const ListTile(
              leading: Icon(Icons.language),
              title: Text('Languages'),
            ),
            const Divider(
              height: 1,
            ),
            const ListTile(
              title: Text('About'),
            ),
            const ListTile(
              leading: Icon(Icons.policy_outlined),
              title: Text('Legal and Policies'),
            ),
            const Divider(
              height: 1,
            ),
            const ListTile(
              leading: Icon(Icons.help_outline_outlined),
              title: Text('Help and Feedback'),
            ),
            const Divider(
              height: 1,
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              padding: EdgeInsets.all(20),
              child: const ElevatedButton(
                  style: ButtonStyle(
                      alignment: Alignment.center,
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          Color.fromRGBO(112, 41, 99, 10))),
                  onPressed: null,
                  child: Text(
                    'Logout',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        title: const ListTile(
          leading: CircleAvatar(
            radius: 24.0,
            backgroundImage: NetworkImage(
                'https://randomuser.me/api/portraits/women/49.jpg'),
          ),
          title: Text('Hi, Welcome Back! 👋'),
          subtitle: Text('Find your dream job'),
          trailing: Icon(
            Icons.notifications_none_outlined,
            size: 28,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black, size: 35),
        backgroundColor: Colors.white,
      ),
      body: Container(child: Text("This is the body"),)
    );
  }
}

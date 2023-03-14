import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_finder/src/constants/colors.dart';
import 'package:job_finder/src/features/authentication/screens/welcome/login.dart';
import 'package:job_finder/src/features/navpages/models/mock_data.dart';
import 'package:job_finder/src/features/navpages/screens/jobs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void SignOutFunction() {
    FirebaseAuth.instance.signOut().then((value) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }).onError((error, stackTrace) {
      print("Error ${error.toString()}");
    });
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, height:869, width)
    var imageList = [
      'assets/images/rec1.png'
          'assets/images/rec1.png'
          'assets/images/rec1.png'
    ];
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
                child: ElevatedButton(
                    style: ButtonStyle(
                        alignment: Alignment.center,
                        backgroundColor: MaterialStatePropertyAll<Color>(
                            Color.fromRGBO(112, 41, 99, 10))),
                    onPressed: () {
                      SignOutFunction();
                    },
                    child: const Text(
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
            title: Text('Hi, Welcome Back! 👋',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: tPrimaryColor)),
            subtitle: Text('Find your dream job'),
            trailing: Icon(
              Icons.notifications_none_rounded,
              size: 28,
            ),
          ),
          iconTheme: IconThemeData(color: Colors.black, size: 35),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // SEARCH BOX
              Container(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      hintText: 'Search',
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: tTextAccentColor,
                        size: 30,
                      )),
                ),
              ),
              // RECOMMENDATION
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Recommendation",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: tSlideScroll),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  children: [
                    for (int i = 0; i < 3; i++)
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        padding: EdgeInsets.only(left: 10),
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: MediaQuery.of(context).size.height / 4.5,
                        decoration: BoxDecoration(
                            color: tSlideScroll,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                child: Image.asset('assets/images/rec1.png'),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Senior UI/UX Designer",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Shopee",
                                      style: TextStyle(
                                          color: Colors.white60,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Kigali, Rwanda (Remote)",
                                      style: TextStyle(
                                          color: Colors.white54,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "\$1100 - \$1200 / Month",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        for (int i = 0; i < 2; i++)
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            margin: EdgeInsets.only(right: 8.0),
                                            decoration: BoxDecoration(
                                                color: Colors.white12,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Text(
                                              "Fulltime",
                                              style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              ),
              // RECENT JOBS
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Popular Jobs",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: tSlideScroll),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    for (int i = 0; i < popularJobs.length; i++)
                      Container(
                        margin: EdgeInsets.only(right: 10, bottom: 12.0),
                        padding: EdgeInsets.only(left: 10),
                        width: MediaQuery.of(context).size.width / 0.5,
                        height: MediaQuery.of(context).size.height / 4.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 0.5, color: Colors.black12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 48,
                                height: 48,
                                child: Image.asset(popularJobs[i].imgUrl),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      popularJobs[i].position,
                                      style: TextStyle(
                                          color: tTextColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      popularJobs[i].companyName,
                                      style: TextStyle(
                                          color: tTextAccentColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      popularJobs[i].location,
                                      style: TextStyle(
                                          color: tTextAccentColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "\$ ${popularJobs[i].salary}",
                                      style: TextStyle(
                                          color: tTextAccentColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        for (int i = 0; i < 2; i++)
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            margin: EdgeInsets.only(right: 8.0),
                                            decoration: BoxDecoration(
                                                color: Colors.black12,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Text(
                                              popularJobs[i].type,
                                              style: TextStyle(
                                                  color: tTextAccentColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: Container(
                                  width: 48,
                                  height: 48,
                                  child: Icon(
                                    Icons.bookmark_border_rounded,
                                    size: 40,
                                    color: tPrimaryOnboarding3,
                                    weight: 0.5,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              ),

              // Container(
              //   width: MediaQuery.of(context).size.width,
              //   height: MediaQuery.of(context).size.height / 4,
              //   child: ListView.builder(
              //     itemCount: popularJobs.length,
              //     itemBuilder: ((context, index) {
              //       // ChatModel _model = ChatModel.dummyData[index];
              //       var jobItem = popularJobs[index];
              //       return Column(
              //         children: <Widget>[
              //           Padding(
              //             padding: const EdgeInsets.all(15.0),
              //             child: ListTile(
              //                 shape: RoundedRectangleBorder(
              //                   side: BorderSide(
              //                       color: tTextAccentColor, width: 0.5),
              //                   borderRadius: BorderRadius.circular(5),
              //                 ),
              //                 leading: CircleAvatar(
              //                   radius: 24.0,
              //                   backgroundImage: AssetImage(jobItem.imgUrl),
              //                 ),
              //                 title: Column(
              //                   children: <Widget>[
              //                     Column(
              //                       children: [
              //                         Text(
              //                           jobItem.position,
              //                           style: TextStyle(
              //                               color: tTextColor,
              //                               fontWeight: FontWeight.w600,
              //                               fontFamily: "Nunito",
              //                               fontSize: 19),
              //                         ),
              //                         SizedBox(
              //                           height: 10,
              //                         ),
              //                         Text(
              //                           jobItem.companyName,
              //                           style: TextStyle(
              //                               color: tTextAccentColor,
              //                               fontWeight: FontWeight.w400,
              //                               fontFamily: "Nunito",
              //                               fontSize: 16),
              //                         ),
              //                         SizedBox(
              //                           height: 10,
              //                         ),
              //                         Text(
              //                           '\$ ${jobItem.salary}',
              //                           style: TextStyle(
              //                               color: tTextAccentColor,
              //                               fontWeight: FontWeight.w400,
              //                               fontFamily: "Nunito",
              //                               fontSize: 16),
              //                         ),
              //                       ],
              //                     ),
              //                   ],
              //                 ),
              //                 subtitle: Container(
              //                   padding: EdgeInsets.all(10),
              //                   margin: EdgeInsets.only(top: 8.0, right: 8.0),
              //                   width: MediaQuery.of(context).size.width / 0.5,
              //                   decoration: BoxDecoration(
              //                       color: Colors.black12,
              //                       borderRadius: BorderRadius.circular(20)),
              //                   child: Text(
              //                     jobItem.type,
              //                     style: TextStyle(
              //                         color: tTextAccentColor,
              //                         fontSize: 14,
              //                         fontWeight: FontWeight.w500),
              //                   ),
              //                 ),
              //                 trailing: Container(
              //                   decoration: BoxDecoration(
              //                       borderRadius: BorderRadius.circular(10)),
              //                   child: Column(
              //                     mainAxisAlignment: MainAxisAlignment.center,
              //                     crossAxisAlignment: CrossAxisAlignment.center,
              //                     children: [
              //                       Icon(
              //                         Icons.bookmark_border_rounded,
              //                         size: 40,
              //                         color: tPrimaryColor,
              //                       ),
              //                     ],
              //                   ),
              //                 )),
              //           )
              //         ],
              //       );
              //     }),
              //   ),
              // )
            ],
          ),
        ));
  }
}

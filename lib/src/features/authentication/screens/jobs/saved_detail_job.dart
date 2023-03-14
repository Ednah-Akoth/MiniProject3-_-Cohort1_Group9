import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../../constants/colors.dart';
import 'apply_job_popup.dart';

class SavedJob extends StatefulWidget {
  @override
  State<SavedJob> createState() => _SavedJobState();
}

class _SavedJobState extends State<SavedJob>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saved',
          style: TextStyle(
              color: tPrimaryColor,
              fontWeight: FontWeight.w600,
              fontFamily: "Nunito",
              fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Colors.white12,
        elevation: 0,
        iconTheme: IconThemeData(color: tPrimaryColor),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Container(
            height: 270,
            width: 350,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 3, color: Colors.grey.shade200),
                borderRadius: BorderRadius.all(Radius.circular(15))),
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(
                  width: 200,
                  height: 100,
                  child: Image.network(
                      'https://randomuser.me/api/portraits/men/81.jpg'),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Senior UI/UX Designer',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'shopee Sg',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text('Fulltime',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey)),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                        height: 30,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text('Two days ago',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey)),
                        ))
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(23),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(5.5),
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(80),
                                color: Color.fromRGBO(185, 206, 200, 1)),
                            child: Icon(Icons.wallet_outlined,
                                color: Color.fromRGBO(0, 204, 154, 1)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(23),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(80),
                                color: Colors.black12),
                            child: Icon(Icons.wallet_travel_rounded,
                                color: Color.fromRGBO(94, 62, 136, 0.533)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(23),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80),
                            color: Colors.black12),
                        child: Icon(Icons.person_2_outlined,
                            color: Color.fromRGBO(247, 75, 7, 0.979)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                icon: Icon(Icons.person),
                text: 'Tab 1',
              ),
              Tab(
                icon: Icon(Icons.work),
                text: 'Tab 2',
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Tab(
                  child: Text('Tab 3'),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  color: Colors.white,
                  child: Center(
                    child: Text('Section 1'),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Center(
                    child: Text('Section 2'),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Center(
                    child: Text('Section 3'),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 60,
            color: Colors.white30,
          ),
          SizedBox(
            height: 65,
            width: 350,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(112, 41, 99, 10),
                  padding: EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
                // crud operation required here to add the person's details to firebase
                onPressed: (() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => SpecificJobPop()),
                      ));
                }),
                child: const Text(
                  "Continue",
                  style: TextStyle(fontSize: 22),
                )),
          ),
        ],
      ),
    );
  }
}

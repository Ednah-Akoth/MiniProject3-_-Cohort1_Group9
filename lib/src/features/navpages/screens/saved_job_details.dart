import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../constants/colors.dart';
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
                  child: Image.asset('assets/images/rec1.png'),
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
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(28),
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
                                  color: Color.fromRGBO(192, 245, 226, 1)),
                              child: Icon(Icons.wallet_outlined,
                                  color: Color.fromRGBO(0, 204, 154, 1)),
                            ),
                            const Text(
                              'Salary',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "6k-11k",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(28),
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
                                  color: Colors.black12),
                              child: Icon(Icons.wallet_travel_rounded,
                                  color: Color.fromRGBO(94, 62, 136, 0.533)),
                            ),
                            const Text(
                              'Job Type',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Remote',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(28),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.all(5.5),
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
                            ),
                            const Text(
                              'Position',
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              'Senior',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            // const SizedBox(
                            //   height: 5,
                            // ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(50), // Creates border
                color: Colors.grey),
            tabs: [
              Container(
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: const Tab(
                  text: 'Description',
                ),
              ),
              Container(
                child: const Tab(
                  text: 'Requirement',
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Tab(
                  child: Text('Responsible'),
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
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                          'Description, Zappos’s job descriptions are candidate-centric, focusing on the reasons a candidate might want to work there before getting into the job requirements'),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      'Description, Zappos’s job descriptions are candidate-centric, focusing on the reasons a candidate might want to work there before getting into the job requirements',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Center(
                    child: Text(
                        'Description, Zappos’s job descriptions are candidate-centric, focusing on the reasons a candidate might want to work there before getting into the job requirements'),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 15,
            color: Colors.white30,
          ),
          SizedBox(
            height: 50,
            width: 300,
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
                  "Apply",
                  style: TextStyle(fontSize: 22),
                )),
          ),
          const Divider(
            height: 10,
            color: Colors.white30,
          ),
        ],
      ),
    );
  }
}

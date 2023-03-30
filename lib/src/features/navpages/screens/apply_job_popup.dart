import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:job_finder/src/constants/colors.dart';

import 'package:job_finder/src/features/navpages/screens/specific_job.dart';
import 'package:job_finder/src/features/authentication/screens/welcome/sign_up2.dart';
import 'package:job_finder/src/features/navpages/screens/saved_job_details.dart';

import 'apply_job_popup.dart';

class SpecificJobPop extends StatefulWidget {
  @override
  State<SpecificJobPop> createState() => _SpecificJobPop();
}

class _SpecificJobPop extends State<SpecificJobPop> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  //upload CVs using the file_picker package
  Future<void> _uploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      Uint8List? fileBytes = result.files.first.bytes;
      String fileName = result.files.first.name;
      // Upload file to Firebase
      // await FirebaseStorage.instance
      //     .ref('uploads/$fileName')
      //     .putData(fileBytes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Apply Job",
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
        body: Stack(children: [
          Padding(
            padding: EdgeInsets.all(10.0),
            child: ListView(children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10),
                child: const Text('Full Name', style: TextStyle(fontSize: 18)),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      hintText: 'Brooklyn Simmons'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10),
                child:
                    const Text('Email Address', style: TextStyle(fontSize: 18)),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      hintText: 'Gustavolipshutz@gmail.com'),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10),
                child: const Text('Upload CV', style: TextStyle(fontSize: 18)),
              ),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        side: BorderSide(),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    elevation: MaterialStateProperty.all<double>(0),
                    minimumSize: MaterialStateProperty.all(Size(180, 200)),
                  ),
                  onPressed: _uploadFile,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.cloud_upload,
                        color: Colors.black,
                        size: 50,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('Upload CV',
                          style: TextStyle(fontSize: 18, color: Colors.black)),
                    ],
                  )),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(10),
                child: const Text('Website, Blog or Portfolio',
                    style: TextStyle(fontSize: 18)),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      hintText: 'https://...'),
                ),
              ),
              Divider(
                height: 60,
                color: Colors.white30,
              ),
              SizedBox(
                height: 65,
                width: 10,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(112, 41, 99, 10),
                      padding:
                          EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                    // crud operation required here to add the person's details to firebase
                    onPressed: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => Signup()),
                          ));
                    }),
                    child: const Text(
                      "Continue",
                      style: TextStyle(fontSize: 22),
                    )),
              ),
            ]),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black.withOpacity(0.2)),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              alignment: Alignment.center,
              width: 330,
              height: 350,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 200,
                    height: 100,
                    child: Image.network(
                        'https://randomuser.me/api/portraits/men/81.jpg'),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    width: 200,
                    height: 40,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Success',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    width: 300,
                    height: 40,
                    child: Text(
                      textAlign: TextAlign.center,
                      'Your Application is successfully sent',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 65,
                    width: 150,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(112, 41, 99, 10),
                          padding: EdgeInsets.symmetric(
                              horizontal: 3.0, vertical: 3.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                        ),
                        // crud operation required here to add the person's details to firebase
                        onPressed: (() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => SavedJob()),
                              ));
                        }),
                        child: const Text(
                          textAlign: TextAlign.center,
                          "Continue",
                          style: TextStyle(fontSize: 22),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}

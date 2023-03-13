import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../welcome/sign_up2.dart';

class SpecificJob extends StatefulWidget {
  @override
  State<SpecificJob> createState() => _SpecificJob();
}

class _SpecificJob extends State<SpecificJob> {
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
        body: Padding(
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
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
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
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
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
                  backgroundColor: MaterialStateProperty.all(Colors.white),
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
                child: Text('Upload CV')),
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
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
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
                  onPressed: (() {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => Signup()),
                        ));
                  }),
                  child: Text("Continue with Email")),
            ),
          ]),
        ));
  }
}

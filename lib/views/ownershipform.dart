import 'package:equiblue/widgets/appbar.dart';
import 'package:equiblue/widgets/custom_next_button.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
part "../widgets/textformfield.dart";
part "../widgets/heading.dart";

class Ownershipform extends StatefulWidget {
  const Ownershipform({super.key});

  @override
  State<Ownershipform> createState() => _OwnershipformState();
}

class _OwnershipformState extends State<Ownershipform> {
  void openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        Filepath = result.files.single.path!;
      });
    }
  }

  String? Filepath;
  String? selectedvalue;
  List<String> dropdownvalue = ['Own Land'];
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _locationcontroller = TextEditingController();
  TextEditingController _occupationcontroller = TextEditingController();
  TextEditingController _incomecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Customappbar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                heading(),
                SizedBox(height: 20.0),
                Image.asset("assets/images/uploadimage.png"),
                SizedBox(height: 12.0),
                ElevatedButton(
                  onPressed: () {
                    openFilePicker();
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(150, 43),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      backgroundColor: Colors.white),
                  child: Text(
                    "Upload Photo",
                    style: TextStyle(color: Colors.black, fontSize: 14.0),
                  ),
                ),
                SizedBox(
                  height: 60.0,
                ),
                textformfield(
                  controller: _namecontroller,
                  imagepath: Image.asset("assets/images/ownershipform.png"),
                ),
                SizedBox(height: 10.0),
                textformfield(
                  controller: _locationcontroller,
                  text: "Location",
                  imagepath: Image.asset("assets/images/ownershipform.png"),
                ),
                SizedBox(height: 10.0),
                textformfield(
                  controller: _occupationcontroller,
                  text: "Occupation",
                  imagepath: Image.asset("assets/images/ownershipform.png"),
                ),
                SizedBox(height: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "Ownership",
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                                text: "*", style: TextStyle(color: Colors.red))
                          ]),
                    ),
                    DropdownButtonFormField<String>(
                        value: selectedvalue,
                        hint: Text('Choose an option'),
                        items: dropdownvalue.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedvalue = newValue;
                          });
                        },
                        decoration:
                            InputDecoration(border: OutlineInputBorder())),
                  ],
                ),
                SizedBox(height: 10.0),
                textformfield(
                  controller: _incomecontroller,
                  text: "Income",
                  imagepath: Image.asset("assets/images/ownershipform.png"),
                ),
                SizedBox(height: 40.0),
                Center(child: custom_next_button())
              ],
            ),
          ),
        ));
  }
}
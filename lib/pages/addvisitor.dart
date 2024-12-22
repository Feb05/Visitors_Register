import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Visitor extends StatelessWidget {
  Visitor({super.key});
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController purpose = TextEditingController();
  TextEditingController whomToMeet = TextEditingController();

  Future<void> sendData() async {
    final apiurl =
        Uri.parse("https://log-app-demo-api.onrender.com/addvisitor");
    try {
      final response = await http.post(
        apiurl,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "firstname": firstname.text,
          "lastname": lastname.text,
          "purpose": purpose.text,
          "whomToMeet": whomToMeet.text,
        }),
      );
      if (response.statusCode == 200) {
        print("Successfull");
      } else {
        print("Something went wrong");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              TextField(
                controller: firstname,
                decoration: InputDecoration(
                    labelText: "Firstname", border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: lastname,
                decoration: InputDecoration(
                    labelText: "Lastname", border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: purpose,
                decoration: InputDecoration(
                    labelText: "Purpose", border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: whomToMeet,
                decoration: InputDecoration(
                    labelText: "Whom To Meet", border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade900,
                    ),
                    onPressed: () async {
                      await sendData();
                    },
                    child: Text("SUBMIT",
                        style: TextStyle(color: Colors.white, fontSize: 25))),
              ),
              GestureDetector(
                  onTap: () {
                    print("Hello");
                  },
                  child: Text(""))
            ],
          ),
        ),
      ),
    );
  }
}

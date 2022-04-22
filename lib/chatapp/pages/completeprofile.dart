import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Completeprofile extends StatefulWidget {
  Completeprofile({Key? key}) : super(key: key);

  @override
  State<Completeprofile> createState() => _CompleteprofileState();
}

class _CompleteprofileState extends State<Completeprofile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complete Profile'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const SizedBox(
              height: 15,
            ),
            const CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person,
                size: 70,
              ),
            ),
            const TextField(
              decoration: InputDecoration(labelText: "Full Name"),
            ),
            const SizedBox(
              height: 15,
            ),
            CupertinoButton(
              child: const Text("Submit"),
              onPressed: () {},
              color: Colors.blueAccent,
            ),
          ],
        ),
      )),
    );
  }
}

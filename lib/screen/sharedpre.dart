import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shared extends StatefulWidget {
  Shared({Key? key}) : super(key: key);

  @override
  State<Shared> createState() => _SharedState();
}

class _SharedState extends State<Shared> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Shared page'),
      ),
      body: SafeArea(
          child: Center(
        child: Container(
          child: TextField(
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            controller: controller,
            onChanged: (value) {
              saveText(value);
            },
          ),
        ),
      )),
    );
  }

  TextEditingController controller = TextEditingController();

  void saveText(String text) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("text", text);
  }

  void readText() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? savedvalue = pref.getString("text");
    if (savedvalue != null) {
      controller.text = savedvalue;
    }
  }

  @override
  void initState() {
    super.initState();
    readText();
  }
}

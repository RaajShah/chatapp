import 'package:flutter/material.dart';
import 'package:rohit_semriwal/screen/sharedpre.dart';
import 'package:rohit_semriwal/screen/streambuild.dart';

class Navigation extends StatelessWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Shared(),
                  ),
                );
              },
              child: const Text('Go to Shared page'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: const Text('Go to Streambuilder'),
            ),
          ],
        ),
      ),
    );
  }
}

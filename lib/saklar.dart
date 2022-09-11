import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;

class Saklar extends StatefulWidget {
  const Saklar({Key? key}) : super(key: key);

  @override
  State<Saklar> createState() => _SaklarState();
}

class _SaklarState extends State<Saklar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        nyala();
                      },
                      child: const Text(
                        'ON',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        mati();
                      },
                      child: const Text(
                        'OFF',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

Future nyala() async {
  var url = Uri.https('192.168.4.1', '/on');
  http.Response res = await http.get(url);
  print(res);
}

Future mati() async {
  var url = Uri.https('192.168.4.1', '/off');
  http.Response res = await http.get(url);
  print(res);
}

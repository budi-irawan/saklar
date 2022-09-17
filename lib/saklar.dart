import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Saklar extends StatefulWidget {
  const Saklar({Key? key}) : super(key: key);

  @override
  State<Saklar> createState() => _SaklarState();
}

class _SaklarState extends State<Saklar> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SizedBox(
                child: Column(
                  children: [
                    MaterialButton(
                      color: isActive ? Colors.blue : Colors.red,
                      shape: const CircleBorder(),
                      onPressed: () {
                        setState(() {
                          isActive = !isActive;
                          if (isActive == false) {
                            // padam();
                            print('padam');
                          } else {
                            // nyala();
                            print('nyala');
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(40),
                        child: Text(
                          isActive ? 'ON' : 'OFF',
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
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

Future padam() async {
  var url = Uri.https('192.168.4.1', '/off');
  http.Response res = await http.get(url);
  print(res);
}

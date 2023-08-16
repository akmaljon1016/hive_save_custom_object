import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'oquvchi.dart';

late Box oquvchiBox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(OquvchiAdapter());
  oquvchiBox = await Hive.openBox("oquvchi_box");
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController txtIsmController = TextEditingController();
  TextEditingController txtFamController = TextEditingController();
  TextEditingController txtYoshController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: txtIsmController,
              decoration: InputDecoration(
                  label: Text("Ism"), border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: txtFamController,
              decoration: InputDecoration(
                  label: Text("Familya"), border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: txtYoshController,
              decoration: InputDecoration(
                  label: Text("Yosh"), border: OutlineInputBorder()),
            ),
          ),
          MaterialButton(
            onPressed: () {
              Oquvchi oquvchi = Oquvchi(ism: txtIsmController.text,
                  familiya: txtFamController.text,
                  yosh: txtYoshController.text);
              oquvchiBox.add(oquvchi);
            },
            child: Text("Saqlash"),
            color: Colors.blue,
          ),
          Expanded(
            child: ValueListenableBuilder(
                valueListenable: oquvchiBox.listenable(),
                builder: (context, value, child) {
                  return ListView.builder(
                      itemCount: oquvchiBox.length,
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.blue,
                          margin: EdgeInsets.all(8),
                          width: double.infinity,
                          child: Column(
                            children: [
                              Text(oquvchiBox
                                  .getAt(index)
                                  .ism),
                              Text(oquvchiBox
                                  .getAt(index)
                                  .familiya),
                              Text(oquvchiBox
                                  .getAt(index)
                                  .yosh),
                            ],
                          ),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}

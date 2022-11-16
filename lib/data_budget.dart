import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';
import 'main.dart' as main;

class MyDataFormPage extends StatefulWidget {
  MyDataFormPage({super.key});

  @override
  State<MyDataFormPage> createState() => _MyDataFormPageState();
}

class _MyDataFormPageState extends State<MyDataFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Budget'),
      ),
      // Menambahkan drawer menu
      drawer: DrawerApp(),
      body: Column(
        children: [
          for (int i = 0; i < main.lstData.length; i++)
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Material(
                      elevation: 5.0,
                      shadowColor: const Color.fromARGB(255, 132, 149, 158),
                      child: ListTile(
                              tileColor: Colors.white,
                              title: Text(
                                main.lstData[i].judul,
                                style: const TextStyle(fontSize: 20)
                              ),
                              subtitle: Text(main.lstData[i].nominal.toString()),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(main.lstData[i].jenis.toString(),
                                              textAlign: TextAlign.end),
                                  Text(main.lstData[i].date.toString().substring(0, 10),
                                              textAlign: TextAlign.end),
                                ],
                              )
                            ),
                    ),
            )
        ],
      )
    );
  }
}
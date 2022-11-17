import 'package:counter_7/main.dart';
import 'package:counter_7/data_budget.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/drawer.dart';
import 'main.dart' as main;

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  int _nominal = 0;
  String? jenis;
  List<String> jenisTransaksi = ['Pengeluaran', 'Pemasukan'];
  DateTime? date;
  TextEditingController dateController = TextEditingController();

  addBudget(BuildContext context) {
    var budget = Budget(
      judul: _judul,
      nominal: _nominal,
      jenis: jenis,
      date: date!,
    );
    main.lstData.add(budget);
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) => MyDataFormPage()),
    // );
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 15,
          child: Container(
            child: ListView(
              padding:
                  const EdgeInsets.only(top: 20, bottom: 20),
              shrinkWrap: true,
              children: <Widget>[
                const Center(
                    child: Text('Berhasil menambahkan data!')),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Kembali'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Form'),
        ),
        // Menambahkan drawer menu
        drawer: DrawerApp(),
        body: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Beli Sate",
                      labelText: "Judul",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _judul = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: 15000",
                      labelText: "Nominal",
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String value) {
                      setState(() {
                        _nominal = int.tryParse(value)!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _nominal = int.tryParse(value.toString())!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nominal tidak boleh kosong!';
                      }
                      final n = int.tryParse(value);
                      if (n == null) {
                        return '"$value" bukan nominal yang valid';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: dateController,
                    decoration: const InputDecoration( 
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Pilih Tanggal" //label text of field
                    ),
                    readOnly: true,  // when true user cannot edit text 
                    onTap: () async {
                      //when click we have to show the datepicker
                      await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(), //get today's date
                        firstDate:DateTime(2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101)
                      ).then((newDate) {  //tambahkan setState dan panggil variabel _dateTime.
                          setState(() {
                            date = newDate!;
                            dateController.text = date.toString().substring(0, 10);
                          });
                        });
                      }
                  ),
                ),
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    value: jenis,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: jenisTransaksi.map((String items) {
                      return DropdownMenuItem<String>(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        jenis = newValue!;
                      });
                    },
                    hint: const Text(
                      "Pilih Jenis",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (jenis == "" || jenis == null) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 15,
                          child: Container(
                            child: ListView(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              shrinkWrap: true,
                              children: <Widget>[
                                const Center(
                                    child: Text('Mohon pilih jenis transaksi')),
                                const SizedBox(height: 20),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Kembali'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (date == null) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 15,
                          child: Container(
                            child: ListView(
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              shrinkWrap: true,
                              children: <Widget>[
                                const Center(
                                    child: Text('Mohon pilih tanggal transaksi')),
                                const SizedBox(height: 20),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Kembali'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  else {
                    addBudget(context);
                  }
                }
              },
              child: const Padding(
                padding: EdgeInsets.only(top: 16, bottom: 16),
                child: Text(
                  "Simpan",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ));
  }
}

class Budget {
  late String judul;
  late int nominal;
  late String? jenis;
  late DateTime date;

  Budget(
      {required this.judul,
      required this.nominal,
      required this.jenis,
      required this.date});
}

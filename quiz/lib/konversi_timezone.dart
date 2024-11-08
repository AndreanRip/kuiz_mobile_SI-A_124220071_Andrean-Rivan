import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KonversiTimezone extends StatefulWidget {
  @override
  _KonversiTimezoneState createState() => _KonversiTimezoneState();
}

class _KonversiTimezoneState extends State<KonversiTimezone> {
  final _minuteController = TextEditingController();
  final _hourController = TextEditingController();
  String _result = '';

  final _hourFormatter = FilteringTextInputFormatter.digitsOnly;
  final _minuteFormatter = FilteringTextInputFormatter.digitsOnly;

  void _konversiWaktu() {
    try {
      int minute = int.parse(
          _minuteController.text.isEmpty ? '00' : _minuteController.text);
      int hour = int.parse(_hourController.text);

      if (hour < 1 || hour > 23) {
        setState(() {
          _result = 'Harap masukkan antara 1 hingga 23 untuk jam.';
        });
        return;
      }
      if (minute < 0 || minute > 59) {
        setState(() {
          _result = 'Menit harus antara 0 hingga 59.';
        });
        return;
      }

      DateTime inputTime =
          DateTime(2004, 01, 01, hour, minute); // Tanggal palsu

      setState(() {
        _result = 'Jam yang dimasukkan: ${inputTime.hour}:${inputTime.minute}\n'
            'WIB: ${inputTime.add(Duration(hours: 7)).hour}:${inputTime.add(Duration(hours: 7)).minute}\n'
            'WITA: ${inputTime.add(Duration(hours: 8)).hour}:${inputTime.add(Duration(hours: 8)).minute}\n'
            'WIT: ${inputTime.add(Duration(hours: 9)).hour}:${inputTime.add(Duration(hours: 9)).minute}';
      });
    } catch (e) {
      setState(() {
        _result = 'Harap masukkan nilai yang valid untuk jam dan menit.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text('Konversi Waktu'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _hourController,
              keyboardType: TextInputType.number,
              inputFormatters: [_hourFormatter],
              decoration: InputDecoration(
                  labelText: 'Masukkan Jam (0-23)', hintText: 'Contoh: 06'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _minuteController,
              keyboardType: TextInputType.number,
              inputFormatters: [_minuteFormatter],
              decoration: InputDecoration(
                  labelText: 'Masukkan Menit (0-59)', hintText: 'Contoh: 30'),
            ),
            SizedBox(height: 16),
            Text(
              'Pastikan nilai yang dimasukkan benar, jika tidak output akan kosong.',
              style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0), fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: _konversiWaktu,
              child: Text('Konversi', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            if (_result.isNotEmpty)
              Builder(
                builder: (context) {
                  var resultLines = _result.split('\n');
                  return Table(
                    border: TableBorder.all(color: Colors.white),
                    columnWidths: {
                      0: FlexColumnWidth(2),
                      1: FlexColumnWidth(3),
                    },
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Jam Masuk',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  '${_hourController.text}:${_minuteController.text.isEmpty ? '00' : _minuteController.text}',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('WIB',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  resultLines.length > 1
                                      ? resultLines[1].split(':')[1]
                                      : '',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('WITA',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  resultLines.length > 2
                                      ? resultLines[2].split(':')[1]
                                      : '',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('WIT',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                          TableCell(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  resultLines.length > 3
                                      ? resultLines[3].split(':')[1]
                                      : '',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

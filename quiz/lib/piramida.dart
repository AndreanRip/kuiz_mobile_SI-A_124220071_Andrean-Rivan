import 'package:flutter/material.dart';

class Piramida extends StatefulWidget {
  @override
  _PiramidaState createState() => _PiramidaState();
}

class _PiramidaState extends State<Piramida> {
  final _panjangController = TextEditingController();
  final _lebarController = TextEditingController();
  final _tinggiController = TextEditingController();

  double _volume = 0.0;
  double _keliling = 0.0;

  void _hitungPiramida() {
    double panjang = double.parse(_panjangController.text);
    double lebar = double.parse(_lebarController.text);
    double tinggi = double.parse(_tinggiController.text);

    setState(() {
      _volume = (panjang * lebar * tinggi) / 3;
      _keliling = 2 * (panjang + lebar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text('Piramida'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _panjangController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Panjang Alas (m)'),
            ),
            TextField(
              controller: _lebarController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Lebar Alas (m)'),
            ),
            TextField(
              controller: _tinggiController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Tinggi Piramida (m)'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: _hitungPiramida,
              child: Text('Hitung', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            // Tabel untuk menampilkan hasil
            Table(
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
                        child: Text('Volume',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('$_volume m³',
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
                        child: Text('Keliling',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('$_keliling m',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

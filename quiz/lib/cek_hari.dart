import 'package:flutter/material.dart';

class CekHari extends StatefulWidget {
  @override
  _CekHariState createState() => _CekHariState();
}

class _CekHariState extends State<CekHari> {
  final _nomorController = TextEditingController();
  String _hari = '';

  void _cekHari() {
    int nomor = int.parse(_nomorController.text);

    setState(() {
      switch (nomor) {
        case 1:
          _hari = 'Senin';
          break;
        case 2:
          _hari = 'Selasa';
          break;
        case 3:
          _hari = 'Rabu';
          break;
        case 4:
          _hari = 'Kamis';
          break;
        case 5:
          _hari = 'Jumat';
          break;
        case 6:
          _hari = 'Sabtu';
          break;
        case 7:
          _hari = 'Minggu';
          break;
        default:
          _hari = 'Bro, masukkin hari hanya dari 1 sampai 7 bro.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: Text('Cek Hari'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nomorController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Masukkan Nomor Hari'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: _cekHari,
              child: Text('Cek Hari', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            if (_hari.isNotEmpty)
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                ),
                child: Text(
                  'Hari: $_hari',
                  style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 18),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

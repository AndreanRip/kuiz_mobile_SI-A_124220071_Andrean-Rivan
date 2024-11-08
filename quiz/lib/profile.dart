import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/image/elea.png'),
            ),
            SizedBox(height: 20),
            Text('Nama: Andrean Rivan Purwanto',
                style: TextStyle(color: Colors.white)),
            Text('NIM: 124220071', style: TextStyle(color: Colors.white)),
            Text('Tempat, Tanggal Lahir: Samarinda, 09 January 2004',
                style: TextStyle(color: Colors.white)),
            Text('Hobi: Membaca, Gambar, dan Game',
                style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

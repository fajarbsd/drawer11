import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final String nama;
  final String gambar;

  const Detail({Key? key, required this.nama, required this.gambar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail $nama"),
        backgroundColor: Colors.red[700],
      ),
      body: Container(
        child: Center(
            child: Image(
          image: NetworkImage(gambar),
        )),
      ),
    );
  }
}

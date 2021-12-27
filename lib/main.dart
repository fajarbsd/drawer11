import 'package:flutter/material.dart';
import './detail.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
    title: "Belajar Drawer",
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String gambar1 =
      "https://images.tokopedia.net/img/cache/700/product-1/2018/11/19/353246403/353246403_df309a45-cfc7-43da-b4e7-9c6299ce9b58_800_800.jpg";
  String gambar2 =
      "https://s4.bukalapak.com/img/4798892882/large/Bunga_Mawar_Merah.jpg";
  late String backup;

  String nama1 = "Fajar Fakhran";
  String nama2 = "Ilham Nugraha";
  late String backupnama;

  String email1 = "fajar.bsd@gmail.com";
  String email2 = "ilhamdn@gmail.com";
  late String backupemail;

  void gantiuser() {
    setState(() {
      backup = gambar1;
      gambar1 = gambar2;
      gambar2 = backup;

      backupnama = nama1;
      nama1 = nama2;
      nama2 = backupnama;

      backupemail = email1;
      email1 = email2;
      email2 = backupemail;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sidebar Drawer"),
        backgroundColor: Colors.red,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(nama1),
              accountEmail: Text(email1),
              currentAccountPicture: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Detail(
                            nama: nama1,
                            gambar: gambar1,
                          )));
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(gambar1),
                ),
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://images.ctfassets.net/hrltx12pl8hq/5KiKmVEsCQPMNrbOE6w0Ot/341c573752bf35cb969e21fcd279d3f9/hero-img_copy.jpg?fit=fill&w=800&h=300"),
                    fit: BoxFit.cover),
              ),
              otherAccountsPictures: <Widget>[
                GestureDetector(
                  onTap: () => gantiuser(),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(gambar2),
                  ),
                )
              ],
            ),
            const ListTile(
              title: Text("Setting"),
              trailing: Icon(Icons.settings),
            ),
            const ListTile(
              title: Text("Close"),
              trailing: Icon(Icons.close),
            )
          ],
        ),
      ),
    );
  }

  decoration(BoxDecoration boxDecoration) {}
}

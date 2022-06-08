import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class listViewKullanimi extends StatelessWidget {
  listViewKullanimi({Key? key}) : super(key: key);

  List<Ogrenci> tumOgrenciler = List.generate(
    500,
    (index) => Ogrenci(
        index + 1, 'Ögrenci adı ${index + 1}', 'Ögrenci soyadı ${index + 1}'),
  );

  get secilen => null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Öğrenci Listesi'),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          var oankiOgrenci = tumOgrenciler[index];
          return Card(
            color: index % 2 == 0
                ? Colors.orange.shade100
                : Colors.purple.shade100,
            child: ListTile(
              onTap: () {},
              onLongPress: () {
                _alertDialogIslemleri(context, oankiOgrenci);
              },
              title: Text(oankiOgrenci.isim),
              subtitle: Text(oankiOgrenci.soyisim),
              leading: CircleAvatar(
                child: Text(oankiOgrenci.id.toString()),
              ),
            ),
          );
        },
        itemCount: tumOgrenciler.length,
        separatorBuilder: (context, index) {
          var yeniindex = index + 1;
          if (yeniindex % 4 == 0) {
            return Divider(
              thickness: 2,
              color: Colors.teal,
            );
          }
          return SizedBox();
        },
      ),
    );
  }

  ListView klasikListView() {
    return ListView(
      children: tumOgrenciler
          .map(
            (Ogrenci ogr) => ListTile(
              title: Text(ogr.isim),
              subtitle: Text(ogr.soyisim),
              leading: CircleAvatar(
                child: Text(ogr.id.toString()),
              ),
            ),
          )
          .toList(),
    );
  }

  void _alertDialogIslemleri(BuildContext myContext, Ogrenci secilen) {
    showDialog(
        context: myContext,
        builder: (context) {
          return AlertDialog(
            title: Text(secilen.toString()),
            content: SingleChildScrollView(
                child: ListBody(
              children: [
                Text('Kübra yıldız' * 50),
                Text('Kübra yıldız1' * 50),
                Text('Kübra yıldız2' * 50),
              ],
            )),
            actions: [
              ButtonBar(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text('KAPAT'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('TAMAM'),
                  ),
                ],
              )
            ],
          );
        });
  }
}

class Ogrenci {
  final int id;
  final String isim;
  final String soyisim;

  Ogrenci(this.id, this.isim, this.soyisim);
  @override
  String toString() {
    return 'Isim: $isim Soyisim:$soyisim id.$id';
  }
}

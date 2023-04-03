import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class veritabani extends StatefulWidget {
  const veritabani({Key? key}) : super(key: key);

  @override
  State<veritabani> createState() => _veritabaniState();
}

class _veritabaniState extends State<veritabani> {
  final _database = FirebaseFirestore.instance;
  final _databaseFoto = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    final CollectionReference kayitEkranRef =
        _database.collection('KayitEkran');

    return Scaffold(
      appBar: AppBar(title: Text('VERİTABANI')),
      body: Center(
        child: Column(
          children: [
            Divider(),
            Text(
              'KAYITLAR',
              style: TextStyle(fontSize: 20),
            ),
            Divider(),
            StreamBuilder<QuerySnapshot>(
              stream: kayitEkranRef.snapshots(),
              builder: (context, asyncSnapshot) {
                if (asyncSnapshot.hasError) {
                  return Center(
                      child: Text('Bir Hata Oluştu, Tekrar Deneyiniz'));
                } else {
                  if (!asyncSnapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    List<DocumentSnapshot> kayitList = asyncSnapshot.data!.docs;
                    return Flexible(
                      child: ListView.builder(
                          itemCount: kayitList.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ExpansionTile(
                                title: Text(kayitList[index]['adsoyad']),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () async {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        backgroundColor: Colors.redAccent,
                                        title: Text(
                                            "Veri Kalıcı Olarak Silinecektir !!! Emin misiniz ?"),
                                        actions: [
                                          TextButton(
                                              onPressed: () async {
                                                Navigator.pop(context);
                                                await kayitList[index]
                                                    .reference
                                                    .delete();
                                              },
                                              child: Text(
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                  "EVET")),
                                          TextButton(
                                              onPressed: () async {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                  "HAYIR")),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                children: [
                                  Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          "Adı Soyadı: ${kayitList[index]['adsoyad']}")),
                                  Divider(),
                                  Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          "Yaşı: ${kayitList[index]['yasi']}")),
                                  Divider(),
                                  Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          "Cinsiyeti: ${kayitList[index]['cinsiyet']}")),
                                  Divider(),
                                  Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          "Eğitim Durumu: ${kayitList[index]['egitimdurumu']}")),
                                  Divider(),
                                  Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          "Zirai Faaliyet Süresi: ${kayitList[index]['ziraifaaliyetsuresi']}")),
                                  Divider(),
                                  Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          "İl ve İlçe: ${kayitList[index]['ilveilce']}")),
                                  Divider(),
                                  Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          "Köy, Kasaba, Nahiye: ${kayitList[index]['koykasabanahiye']}")),
                                  Divider(),
                                  Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          "Posta Bilgileri: ${kayitList[index]['postabilgileri']}")),
                                  Divider(),
                                  Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          "Telefon: ${kayitList[index]['telefon']}")),
                                  Divider(),
                                  Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          "Cep Telefonu: ${kayitList[index]['ceptelefonu']}")),
                                  Divider(),
                                  Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          "E-posta: ${kayitList[index]['eposta']}")),
                                  Divider(),
                                  Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          "Danışanın Zirai Faaliyet Alanı: ${kayitList[index]['danisaninziraifaaliyetalani']}")),
                                  Divider(),
                                  Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          "Danışanın üretim faaliyetlerine ilişkin kısa bilgi notu: ${kayitList[index]['dufikbilginotu']}")),
                                  Divider(),
                                  Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          "Hayvan varlığı, Hayvan türü ve sayısı: ${kayitList[index]['hayvanturuvesayisi']}")),
                                  Divider(),
                                  Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          "Bahçe varlığı, Ağaç türleri ve sayısı: ${kayitList[index]['agacturuvesayisi']}")),
                                  Divider(),
                                  Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          "Tarla varlığı, Ürün türü ve üretim miktarı: ${kayitList[index]['tarlaurunturuveuretimmiktari']}")),
                                  Divider(),
                                  Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.topLeft,
                                      child: Image.network(
                                          kayitList[index]['dosya'])),
                                  Divider(),
                                  Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          "Danışanın sorusu ve karşılaştığı problem: ${kayitList[index]['danisaninproblemi']}")),
                                  Divider(),
                                  Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          "Problem ve soruna ilişkin açıklama: ${kayitList[index]['psiaciklama']}")),
                                ],
                              ),
                            );
                          }),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

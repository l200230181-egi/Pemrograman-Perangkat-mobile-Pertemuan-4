import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Aplikasi utama
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: VolumePage(),
    );
  }
}

////////////////////////////////////////////////////////
/// HALAMAN 1 : KALKULATOR VOLUME
////////////////////////////////////////////////////////

class VolumePage extends StatefulWidget {
  @override
  _VolumePageState createState() => _VolumePageState();
}

class _VolumePageState extends State<VolumePage> {

  TextEditingController sisi = TextEditingController();
  TextEditingController jari = TextEditingController();
  TextEditingController tinggi = TextEditingController();

  String hasil = "";

  void hitungKubus() {
    double s = double.parse(sisi.text);
    double volume = s * s * s;

    setState(() {
      hasil = "Volume Kubus = $volume";
    });
  }

  void hitungTabung() {
    double r = double.parse(jari.text);
    double t = double.parse(tinggi.text);

    double volume = 3.14 * r * r * t;

    setState(() {
      hasil = "Volume Tabung = $volume";
    });
  }

  void hitungBola() {
    double r = double.parse(jari.text);

    double volume = 4/3 * 3.14 * r * r * r;

    setState(() {
      hasil = "Volume Bola = $volume";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Kalkulator Volume Bangun Ruang"),
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              controller: sisi,
              decoration: InputDecoration(
                labelText: "Masukkan Sisi Kubus",
              ),
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: 10),

            TextField(
              controller: jari,
              decoration: InputDecoration(
                labelText: "Masukkan Jari-jari",
              ),
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: 10),

            TextField(
              controller: tinggi,
              decoration: InputDecoration(
                labelText: "Masukkan Tinggi Tabung",
              ),
              keyboardType: TextInputType.number,
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: hitungKubus,
              child: Text("Hitung Kubus"),
            ),

            ElevatedButton(
              onPressed: hitungTabung,
              child: Text("Hitung Tabung"),
            ),

            ElevatedButton(
              onPressed: hitungBola,
              child: Text("Hitung Bola"),
            ),

            SizedBox(height: 20),

            Text(
              hasil,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 30),

            // tombol pindah ke halaman produk
            ElevatedButton(
              child: Text("Lihat Daftar Produk"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductPage()),
                );
              },
            )

          ],
        ),
      ),
    );
  }
}

////////////////////////////////////////////////////////
/// HALAMAN 2 : PRODUCT LIST
////////////////////////////////////////////////////////

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(title: Text("Product Listing")),

        body: ListView(
          padding: EdgeInsets.all(10),
          children: [

            ProductBox(
              name: "iPhone",
              description: "iPhone is the stylist phone ever",
              price: 1000,
              image: "iphone.png",
            ),

            ProductBox(
              name: "Mouse & Keyboard",
              description: "Pixel is the most featureful phone ever",
              price: 800,
              image: "mousekeyboard.png",
            ),

            ProductBox(
              name: "Laptop",
              description: "Laptop is most productive development tool",
              price: 2000,
              image: "laptop.png",
            ),

            ProductBox(
              name: "Tablet",
              description: "Tablet is the most useful device ever",
              price: 1500,
              image: "tablet.png",
            ),

          ],
        ));
  }
}

////////////////////////////////////////////////////////
/// WIDGET PRODUK
////////////////////////////////////////////////////////

class ProductBox extends StatelessWidget {

  final String name;
  final String description;
  final int price;
  final String image;

  const ProductBox({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
        padding: EdgeInsets.all(5),
        height: 120,

        child: Card(
            child: Row(
                children: [

                  Image.asset("assets/appimages/$image"),

                  Expanded(

                    child: InkWell(

                      onTap: () {

                        // POP UP DETAIL PRODUK
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(name),
                              content: Text(
                                  "$description\n\nPrice: \$$price"),
                              actions: [
                                TextButton(
                                  child: Text("Close"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            );
                          },
                        );

                      },

                      child: Padding(
                        padding: EdgeInsets.all(10),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [

                            Text(name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),

                            Text(description),

                            Text("Price: \$$price"),

                          ],
                        ),
                      ),
                    ),
                  )
                ]
            )
        )
    );
  }
}

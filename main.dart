class ProductBox extends StatelessWidget {
  const ProductBox({
    super.key,
    required this.name,
    required this.description,
    required this.price,
    required this.image
  });

  final String name;
  final String description;
  final int price;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(2),
        height: 120,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset("assets/appimages/$image"),

                  Expanded(
                    child: InkWell(
                      onTap: () {

                        // POP-UP NOTIFIKASI
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(name), // judul pop-up
                              content: Text(description), // deskripsi produk
                              actions: [
                                TextButton(
                                  child: const Text("Close"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );

                      },

                      child: Container(
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold)),
                              Text(description),
                              Text("Price: $price"),
                            ],
                          )
                      ),
                    ),
                  )
                ]
            )
        )
    );
  }
}
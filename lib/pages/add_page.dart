import 'package:flutter/material.dart';
import 'package:starbhakmart/pages/create_page.dart';
import 'package:starbhakmart/theme.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

final List<Map<String, dynamic>> products = [
  {
    'image': 'assets/images/Burger.jpeg',
    'name': 'Burger King Medium',
    'price': 'Rp.50.000,00',
  },
  {
    'image': 'assets/images/teh-botol.jpeg',
    'name': 'Teh Botol',
    'price': 'Rp.4.000,00',
  },
  {
    'image': 'assets/images/Burger.jpeg',
    'name': 'Burger King Small',
    'price': 'Rp.35.000,00',
  },
];

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 6,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new,
                color: Colors.black, size: 18),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 6,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.person_outline,
                  color: Colors.black, size: 18),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                left: 16,
                top: 8,
                bottom: 8), // Menggunakan EdgeInsets.only untuk margin kiri
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreatePage()), 
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: birubg,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                textStyle: TextStyle(
                  color: whitebg,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Add Data'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                Expanded(
                    child: Center(
                        child: Text('Foto', textAlign: TextAlign.center))),
                Expanded(
                    flex: 2,
                    child: Center(
                        child:
                            Text('Nama Produk', textAlign: TextAlign.center))),
                Expanded(
                    child: Center(
                        child: Text('Harga', textAlign: TextAlign.center))),
                Expanded(
                    child: Center(
                        child: Text('Aksi', textAlign: TextAlign.center))),
              ],
            ),
          ),
          const Divider(),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: products.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) {
              final item = products[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Product image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        item['image'],
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // Product name
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(products[index]['name']),
                      ),
                    ),
                    // Product price
                    Expanded(
                      child: Center(
                        child: Text(products[index]['price']),
                      ),
                    ),
                    // Delete button
                    Expanded(
                      child: IconButton(
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.pink,
                        ),
                        onPressed: () {
                          // Add delete functionality here
                           setState(() {
                                products.removeAt(index);
                              });
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

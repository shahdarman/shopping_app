import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:storeapp/screens/cart/cart_screen.dart';
import 'package:storeapp/widgets/product_card.dart';

import '../../Models/product_model.dart';
import '../../services/get_all_product_service.dart';
import '../../widgets/custom_navigation_bar.dart'; // تأكد من استيراد ملف النافجيشن بار

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = 'HomePAge';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  changeLang() {
    if (context.locale == Locale('en', 'US'))
    {
      context.setLocale(Locale('ar', 'EG'));

    }else{
      context.setLocale(Locale('en', 'US'));
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pagesContent = <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 65),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductsService().getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                itemCount: products.length,
                clipBehavior: Clip.none,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 100,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              );
            } else if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong!'));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
      const CartScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Row(
          children: [
            const Text(
              'Our Product',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 75),
            ElevatedButton(
              onPressed: () {
                changeLang();
              },
              child: Text(
                "Translate",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),

      body: pagesContent[_selectedIndex],
      bottomNavigationBar: CustomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }


}

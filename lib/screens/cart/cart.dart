import 'package:flutter/material.dart';
import '../cekout/checkout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MedHub',
      theme: ThemeData(
        fontFamily: 'Overpass',
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF0F3759),
        ),
      ),
      home: ProductListPage(),
    );
  }
}

class Product {
  final String name;
  final double price;
  final String imageUrl;
  final String description;

  Product({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
  });
}

// Sample products
final List<Product> products = [
  Product(
    name: 'Sugar Free Gold',
    price: 25000,
    imageUrl: 'assets/products/obat.png',
    description: 'bottle of 500 pellets',
  ),
  Product(
    name: 'Cough Syrup',
    price: 25000,
    imageUrl: 'assets/products/obat1.png',
    description: 'bottle of 500 pellets',
  ),
];

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final Map<Product, int> _cartQuantities = {};
  void _updateQuantity(Product product, int delta) {
    setState(() {
      _cartQuantities[product] = (_cartQuantities[product] ?? 0) + delta;
      if (_cartQuantities[product]! <= 0) {
        _cartQuantities.remove(product);
      }
    });
  }

  void _removeProduct(Product product) {
    setState(() {
      _cartQuantities.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = _cartQuantities.entries.fold(0.0, (sum, entry) {
      return sum + (entry.key.price * entry.value);
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your cart',
          style: TextStyle(
            color: Color(0xFF0F3759),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 246, 246, 246),
        iconTheme: IconThemeData(color: Color(0xFF0F3759)),
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${_cartQuantities.length} Items in your cart',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F3759),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    '+ Add Address',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF0F3759),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length + 1,
              itemBuilder: (context, index) {
                if (index == products.length) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.0),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            IconButton(
                              icon: Image.asset(
                                'assets/icons/discount.png',
                                width: 24,
                                height: 24,
                              ),
                              onPressed: () {
                                // Handle discount action
                              },
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                '1 Coupon applied',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            IconButton(
                              icon: Image.asset(
                                'assets/icons/silang.png',
                                width: 24,
                                height: 24,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  final product = products[index];
                  final quantity = _cartQuantities[product] ?? 0;
                  return Container(
                    margin: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(product.imageUrl, width: 100),
                          SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        product.name,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: Image.asset(
                                        'assets/icons/silang.png',
                                        width: 24,
                                        height: 24,
                                      ),
                                      onPressed: () {
                                        _removeProduct(product);
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                Text(
                                  product.description,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(
                                      'Rp.${product.price.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF0F3759),
                                      ),
                                    ),
                                    Spacer(),
                                    Container(
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(144, 255, 250, 201),
                                        borderRadius:
                                            BorderRadius.circular(56.0),
                                      ),
                                      child: Row(
                                        children: [
                                          IconButton(
                                            icon: Image.asset(
                                              'assets/icons/minus.png',
                                              width: 24,
                                              height: 24,
                                            ),
                                            onPressed: () {
                                              _updateQuantity(product, -1);
                                            },
                                          ),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: Text(
                                              quantity.toString(),
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xFF0F3759),
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                            icon: Image.asset(
                                              'assets/icons/tambah.png',
                                              width: 30,
                                              height: 30,
                                            ),
                                            onPressed: () {
                                              _updateQuantity(product, 1);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Summary',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F3759),
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      _buildSummaryRow(
                          'Order Total', 'Rp.${totalPrice.toStringAsFixed(2)}'),
                      _buildSummaryRow('Items Discount', '- Rp.28.800'),
                      _buildSummaryRow('Coupon Discount', '- Rp.15.800'),
                      _buildSummaryRow('Shipping', 'Free'),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                _buildSummaryRow('Total', 'Rp.${totalPrice.toStringAsFixed(2)}',
                    isTotal: true),
                SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => CheckoutPage()),
                      );
                    },
                    child: Text(
                      'Place Order @ Rp.${totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0F3759),
                      onPrimary: Colors.white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Color(0xFF0F3759) : Colors.black,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Color(0xFF0F3759) : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

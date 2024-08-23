import 'package:flutter/material.dart';
import '../cart/cart.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Detail',
      theme: ThemeData(
        fontFamily: 'Overpass',
        primarySwatch: Colors.blue,
      ),
      home: ProductDetailScreen(),
    );
  }
}

class ProductDetailScreen extends StatefulWidget {
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _currentPage = 0;
  String _selectedPackage = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF0F3759)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Color.fromARGB(248, 247, 247, 247),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: Image.asset('assets/icons/notif.png'),
            onPressed: () {},
          ),
          IconButton(
            icon: Image.asset('assets/icons/box.png'),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sugar Free Gold Low Calories',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F3759),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Etiam mollis metus non purus',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            CarouselSlider(
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
              items: [
                'assets/banner/glider.png',
                'assets/banner/glider.png',
                'assets/banner/glider.png',
              ].map((imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++)
                  Container(
                    width: 8,
                    height: 8,
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          _currentPage == i ? Color(0xFF0F3759) : Colors.grey,
                    ),
                  ),
              ],
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product Title Here',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0F3759),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Etiam mollis',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    VerticalDivider(
                      width: 1,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 16),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        '+ Product',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF0F3759),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.grey,
                ),
                SizedBox(height: 20),
                Text(
                  'Package Size',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F3759),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: _buildPackageButton(
                            'Small Package', '\$Rp1000.00', '500 pellets'),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: _buildPackageButton(
                            'Medium Package', '\$Rp15000.00', '110 pellets'),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: _buildPackageButton(
                            'Large Package', '\$Rp20000.00', '300 pellets'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Additional Information',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F3759),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Text(
                  'Rating and Reviews',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F3759),
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '4.4',
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF0F3759),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Image.asset(
                                    'assets/icons/star.png',
                                    color: Colors.amber,
                                    width: 28,
                                    height: 28,
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Text(
                                '923 Ratings and 257 Reviews',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                        Container(
                          width: 1,
                          height: 80,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildRatingBreakdown(1, 67),
                              _buildRatingBreakdown(2, 20),
                              _buildRatingBreakdown(3, 7),
                              _buildRatingBreakdown(4, 0),
                              _buildRatingBreakdown(5, 2),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Loream Hofman',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0F3759),
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            '05 August 2024',
                            style: TextStyle(
                              fontSize: 16,
                              color: Color(0xFF0F3759),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '4.4',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0F3759),
                          ),
                        ),
                        SizedBox(width: 8),
                        Image.asset(
                          'assets/icons/star.png',
                          color: Colors.amber,
                          width: 14,
                          height: 14,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi.Nunc risus massa, gravida id egestas ',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductListPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF0F3759),
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(56),
                        ),
                      ),
                      child: Text('GO TO CART'),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPackageButton(String title, String price, String stock) {
    bool isSelected = _selectedPackage == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedPackage = title;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Color(0xFF00A59B) : Colors.grey,
            width: 2,
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? Color(0xFF00A59B) : Colors.black,
              ),
            ),
            SizedBox(height: 4),
            Text(
              price,
              style: TextStyle(
                fontSize: 14,
                color: isSelected ? Color(0xFF00A59B) : Colors.black,
              ),
            ),
            SizedBox(height: 4),
            Text(
              stock,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? Color(0xFF00A59B) : Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingBreakdown(int stars, int percentage) {
    return Row(
      children: [
        SizedBox(width: 4),
        Text(
          '$stars',
          style: TextStyle(fontSize: 16),
        ),
        Icon(
          Icons.star,
          color: Colors.amber,
          size: 20,
        ),
        SizedBox(width: 8),
        Expanded(
          child: Stack(
            children: [
              Container(
                height: 8,
                color: Colors.grey[300],
              ),
              Container(
                height: 8,
                width: (MediaQuery.of(context).size.width - 32) *
                    (percentage / 100),
                color: Color(0xFF0F3759),
              ),
            ],
          ),
        ),
        SizedBox(width: 8),
        Text(
          '$percentage%',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

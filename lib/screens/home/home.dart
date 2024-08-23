import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../product-detail/productdetail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _appBarHeight = 200.0;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _calculateAppBarHeight();
  }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _calculateAppBarHeight() async {
    final image = AssetImage('assets/images/bg71.png');
    final imageStream = image.resolve(ImageConfiguration.empty);
    imageStream.addListener(
      ImageStreamListener((ImageInfo imageInfo, bool synchronousCall) {
        final size = imageInfo.image;
        setState(() {
          _appBarHeight = size.height.toDouble();
        });
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_appBarHeight),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg71.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0)
                    .copyWith(top: 50.0, bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: IconButton(
                            icon: Image.asset('assets/images/profile.png'),
                            onPressed: () {},
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            IconButton(
                              icon: Image.asset('assets/icons/notif1.png'),
                              onPressed: () {},
                            ),
                            SizedBox(width: 2),
                            IconButton(
                              icon: Image.asset('assets/icons/box1.png'),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Hi, Lorem',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Welcome to MedHub',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(56.0),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search Medicine & Healthcare products',
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Top Categories',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 150,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildCategoryBox('assets/icons/t1.png', 'Dental',
                      [Color(0xFFFF9598), Color(0xFFFF70A7)]),
                  _buildCategoryBox('assets/icons/t2.png', 'Wellness',
                      [Color(0xFF19E5A5), Color(0xFF15BD92)]),
                  _buildCategoryBox('assets/icons/t3.png', 'Homeo',
                      [Color(0xFFFFC06F), Color(0xFFFF793A)]),
                  _buildCategoryBox('assets/icons/t4.png', 'Eye care',
                      [Color(0xFF4DB7FF), Color(0xFF3E7DFF)]),
                  _buildCategoryBox('assets/icons/t5.png', 'Skin & Hair',
                      [Color(0xFF828282), Color(0xFF090F47)]),
                ],
              ),
            ),
            SizedBox(height: 8),
            CarouselSlider(
              options: CarouselOptions(
                height: 130,
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
                'assets/banner/banner.png',
                'assets/banner/banner.png',
                'assets/banner/banner.png',
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
                      color: _currentPage == i
                          ? Color.fromARGB(255, 0, 233, 202)
                          : Colors.grey,
                    ),
                  ),
              ],
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Deals of the Day',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'More',
                      style: TextStyle(
                        color: Color(0xFF00A59B),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Container(
              height: 300,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    width: 200,
                    margin: EdgeInsets.only(right: 16.0),
                    child: _buildProductCard(
                      imagePath: 'assets/products/pl${index + 1}.png',
                      name: 'Accu-check Active Test Strip ${index + 1}',
                      price: '\Rp${(index + 500) * 10}',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailScreen()),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Featured Brands',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 100,
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildCategoryCircle('assets/icons/s1.png', 'Himalaya'),
                  _buildCategoryCircle('assets/icons/s2.png', 'Accu-Chek'),
                  _buildCategoryCircle('assets/icons/s3.png', 'Vlcc'),
                  _buildCategoryCircle('assets/icons/s4.png', 'Protinex'),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/home.png', width: 24, height: 24),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/ceng.png', width: 24, height: 24),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/bx2.png', width: 24, height: 24),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/bx1.png', width: 24, height: 24),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/usr.png', width: 24, height: 24),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryBox(
      String imagePath, String categoryName, List<Color> gradientColors) {
    return Container(
      width: 60,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: gradientColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                child: Center(
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            categoryName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard({
    required String imagePath,
    required String name,
    required String price,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF0F3759),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(
                        'assets/icons/lg42.png',
                        width: 40,
                        height: 20,
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

  Widget _buildCategoryCircle(String imagePath, String title) {
    return Container(
      width: 100,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.teal,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Sesuaikan warna teks sesuai kebutuhan
            ),
          ),
        ],
      ),
    );
  }
}

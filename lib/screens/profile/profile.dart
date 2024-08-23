import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      theme: ThemeData(
        fontFamily: 'Overpass',
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(255, 246, 246, 246),
          foregroundColor: Color(0xFF0F3759),
          elevation: 0,
        ),
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Text(
              'My Profile',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F3759),
              ),
            ),
            SizedBox(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/profile.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, Lorem Ipsum',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Welcome to MedHub',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Color(0xFF0F3759),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: Colors.transparent,
                    side: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/private.png',
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Private Account',
                            style: TextStyle(
                              color: Color(0xFF0F3759),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '>',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF0F3759),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  height: 1,
                  color: Color.fromARGB(85, 15, 54, 89),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Color(0xFF0F3759),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: Colors.transparent,
                    side: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/consult.png',
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'My Consults',
                            style: TextStyle(
                              color: Color(0xFF0F3759),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '>',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF0F3759),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  height: 1,
                  color: Color.fromARGB(85, 15, 54, 89),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Color(0xFF0F3759),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: Colors.transparent,
                    side: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/orders.png',
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'My Orders',
                            style: TextStyle(
                              color: Color(0xFF0F3759),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '>',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF0F3759),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  height: 1,
                  color: Color.fromARGB(85, 15, 54, 89),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Color(0xFF0F3759),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: Colors.transparent,
                    side: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/billings.png',
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Billing',
                            style: TextStyle(
                              color: Color(0xFF0F3759),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '>',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF0F3759),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  height: 1,
                  color: Color.fromARGB(85, 15, 54, 89),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Color(0xFF0F3759),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: Colors.transparent,
                    side: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/faqq.png',
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Faq',
                            style: TextStyle(
                              color: Color(0xFF0F3759),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '>',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF0F3759),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  height: 1,
                  color: Color.fromARGB(85, 15, 54, 89),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Color(0xFF0F3759),
                    padding: EdgeInsets.symmetric(vertical: 15),
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: Colors.transparent,
                    side: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/setting.png',
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Settings',
                            style: TextStyle(
                              color: Color(0xFF0F3759),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        '>',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF0F3759),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  height: 1,
                  color: Color.fromARGB(85, 15, 54, 89),
                ),
              ],
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
}

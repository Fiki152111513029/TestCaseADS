import 'package:flutter/material.dart';
import '../succes/success.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pharmacy App',
      theme: ThemeData(
        fontFamily: 'Overpass',
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xFF0F3759),
        ),
      ),
      home: CheckoutPage(),
    );
  }
}

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  int? _selectedAddressIndex;
  int? _selectedPaymentIndex;

  @override
  void initState() {
    super.initState();
    _selectedAddressIndex = null;
    _selectedPaymentIndex = null;
  }

  void _onAddressSelected(int index) {
    setState(() {
      _selectedAddressIndex = index;
    });
  }

  void _onPaymentSelected(int index) {
    setState(() {
      _selectedPaymentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedColor = Color.fromARGB(255, 0, 209, 184);
    final unselectedBorderColor = Color.fromARGB(113, 15, 54, 89);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: TextStyle(
            color: Color(0xFF0F3759),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 246, 246, 246),
        iconTheme: IconThemeData(color: Color(0xFF0F3759)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '2 Items in your cart',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F3759),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF0F3759),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Rp180,000',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F3759),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Delivery Address',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F3759),
              ),
            ),
            SizedBox(height: 2),
            buildAddressCard(
              context,
              index: 0,
              title: 'Home',
              phoneNumber: '(031) 555-024',
              address: 'Jl. Rajawali No. 02, Surabaya',
              selectedColor: selectedColor,
              unselectedBorderColor: unselectedBorderColor,
            ),
            SizedBox(height: 2),
            buildAddressCard(
              context,
              index: 1,
              title: 'Office',
              phoneNumber: '(031) 555-024',
              address: 'Jl. Rajawali No. 02, Sidoarjo',
              selectedColor: selectedColor,
              unselectedBorderColor: unselectedBorderColor,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  '+ Add Address',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF0F3759),
                  ),
                ),
              ),
            ),
            SizedBox(height: 2),
            Text(
              'Payment Method',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F3759),
              ),
            ),
            SizedBox(height: 8),
            buildPaymentMethodCard(
              context,
              index: 0,
              bankDetails: [
                {'icon': 'assets/icons/ovo.png', 'name': 'OVO'},
                {'icon': 'assets/icons/dana1.png', 'name': 'Dana'},
                {'icon': 'assets/icons/shopepay.png', 'name': 'ShopePay'},
                {'icon': 'assets/icons/gopay.png', 'name': 'GoPay'},
              ],
              selectedColor: selectedColor,
              unselectedBorderColor: unselectedBorderColor,
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SuccesPage()),
                    );
                  },
                  child: Text('PayNow Rp 185.000'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF0F3759),
                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAddressCard(
    BuildContext context, {
    required int index,
    required String title,
    required String phoneNumber,
    required String address,
    required Color selectedColor,
    required Color unselectedBorderColor,
  }) {
    final isSelected = _selectedAddressIndex == index;

    return GestureDetector(
      onTap: () => _onAddressSelected(index),
      child: Card(
        elevation: 0,
        margin: EdgeInsets.symmetric(vertical: 8.0),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isSelected ? unselectedBorderColor : unselectedBorderColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isSelected ? selectedColor : Colors.transparent,
                  border: Border.all(
                    color: isSelected ? selectedColor : unselectedBorderColor,
                    width: 1.0,
                  ),
                ),
                child: Center(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: isSelected ? 12 : 0,
                    height: isSelected ? 12 : 0,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.white : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      phoneNumber,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      address,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/icons/pencil.png',
                    width: 24,
                    height: 24,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPaymentMethodCard(
    BuildContext context, {
    required int index,
    required List<Map<String, String>> bankDetails,
    required Color selectedColor,
    required Color unselectedBorderColor,
  }) {
    final isSelected = _selectedPaymentIndex == index;

    return GestureDetector(
      onTap: () => _onPaymentSelected(index),
      child: Card(
        elevation: 0,
        margin: EdgeInsets.symmetric(vertical: 8.0),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: unselectedBorderColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...bankDetails.asMap().entries.map((entry) {
                final index = entry.key;
                final bank = entry.value;
                final isCurrentSelected = _selectedPaymentIndex == index;
                return GestureDetector(
                  onTap: () => _onPaymentSelected(index),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    color: Colors.transparent,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          bank['icon']!,
                          width: 24,
                          height: 24,
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            bank['name']!,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isCurrentSelected
                                ? selectedColor
                                : Colors.transparent,
                            border: Border.all(
                              color: isCurrentSelected
                                  ? selectedColor
                                  : unselectedBorderColor,
                              width: 1.0,
                            ),
                          ),
                          child: Center(
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              width: isCurrentSelected ? 12 : 0,
                              height: isCurrentSelected ? 12 : 0,
                              decoration: BoxDecoration(
                                color: isCurrentSelected
                                    ? Colors.white
                                    : Colors.transparent,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile4/pages/food/food_list_page.dart';
import 'package:mobile4/pages/login/login_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _subPageIndex = 1;
  var _selectedBottomNavIndex = 0;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _subPageIndex == 1
            ? Text('FOOD', style: GoogleFonts.mali())
            : _subPageIndex == 2
            ? Text('PROFILE', style: GoogleFonts.mali())
            : Text('KATAKARN', style: GoogleFonts.mali()),
        backgroundColor: Colors.blue.shade100,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue,
                      Colors.blue.shade100,
                    ],
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: Container(
                        width: 80.0,
                        height: 80.0,
                        child: Image.asset('assets/images/hide the pain.png'),
                      )),
                  Text(
                    'katakarn',
                    style:
                    GoogleFonts.mali(fontSize: 20.0, color: Colors.yellow),
                  ),
                  Text(
                    'katakarn@hotmail.com',
                    style: GoogleFonts.mali(fontSize: 10.0, color: Colors.black54),
                  ),
                ],
              ),
            ),
            ListTile(
              title: _buildDrawerItem(
                  Icon(
                    Icons.fastfood,
                    color: _subPageIndex == 1 ?Colors.purple : Colors.black,
                  ),
                  'Food'),
              onTap: () => _showSubPage(1),
              selected: _subPageIndex == 1,
            ),
            ListTile(
              title: _buildDrawerItem(
                  Icon(Icons.person,
                    color: _subPageIndex == 2 ?Colors.purple : Colors.black,
                  ),
                  'Profile'),
              onTap: () => _showSubPage(2),
              selected: _subPageIndex == 2,

            ),


          ],
        ),
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/Khun.png'), fit: BoxFit.cover),
        ),
        child: _buildSubPage(),



      ),
    );
  }

  _showSubPage(int index) {
    setState(() {
      _subPageIndex = index;
    });
    Navigator.of(context).pop();
  }

  Widget _buildSubPage() {
    switch (_subPageIndex) {
      case 1:
        return FoodListPage();
      case 2:
        return ProfilePage();
      default:
        return SizedBox.shrink();

    }
  }

  Row _buildDrawerItem(Widget icon, String title) {
    return Row(
      children: [
        icon,
        SizedBox(width: 8.0),
        Text(title),
      ],
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(1000000000000000000.0),
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      child: Image.asset('assets/images/hide the pain.png'),
                    )),
                Text(
                  'katakarn',
                  style: GoogleFonts.mali(fontSize: 40.0, color: Colors.blue),
                ),
                Text(
                  'katakarn@hotmail.com',
                  style: GoogleFonts.mali(fontSize: 20.0, color: Colors.blue),
                ),
              ],
            ),
          ),

        )
    );
  }
}

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  int _selectedBottomNavIndex = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
            child: _selectedBottomNavIndex == 0
                ? Text(
              'FOOD MENU',
              style: GoogleFonts.mali(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.purple,
                    offset: Offset(5.0, 5.0),
                  ),
                ],
              ),
            )
                : Text("Your Order")),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Your Order',
          ),
        ],
        currentIndex: _selectedBottomNavIndex,
        selectedItemColor: Colors.purple,
        onTap: (index) {
          setState(() {
            _selectedBottomNavIndex = index;
          });
        },
      ),
    );
  }
}
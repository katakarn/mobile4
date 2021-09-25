import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Koonzy',style: GoogleFonts.mali(),),
          backgroundColor: Colors.blue,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/Khun.png'), fit: BoxFit.cover),
          ),
          child: SafeArea(
            child: Column(children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'THIS IS A HOME PAGE',
                        style: GoogleFonts.mali(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.blue,
                              offset: Offset(5.0, 5.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}

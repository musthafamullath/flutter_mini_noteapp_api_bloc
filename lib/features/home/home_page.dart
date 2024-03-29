import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
              appBar: AppBar(
          backgroundColor: Colors.grey[800],
          title: Text(
            "All Notes",
            style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 25),
          ),
        ),
    ));
  }
}
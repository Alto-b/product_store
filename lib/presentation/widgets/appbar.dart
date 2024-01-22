import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: Colors.blueAccent.withOpacity(0.9),
      title: const Text("Product Store",style: TextStyle(color: Colors.white70),),
      toolbarOpacity: 0.3,
      toolbarHeight: screenHeight-650,
      titleTextStyle: GoogleFonts.orbitron(fontSize: 25,fontWeight: FontWeight.w700,letterSpacing: 3),
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.white
      ),
    );
  }
}
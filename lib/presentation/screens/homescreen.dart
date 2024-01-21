import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize( preferredSize: Size(150, 140),child: HomePageAppBar(screenHeight: screenHeight)),

      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Container(
              // color: Colors.blue,
              height: screenHeight-180,
              width: screenWidth-10,
              child: GridView.builder(
                itemCount: 8,

                itemBuilder: (context, index) {
                  return Card(  
                    color: Colors.black87,
                    elevation: 5,
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          image: DecorationImage(image: NetworkImage('https://c.static-nike.com/a/images/f_auto/dpr_3.0,cs_srgb/h_500,c_limit/g1ljiszo4qhthfpluzbt/123-joyride-cdp-apla-xa-xp.jpg',),
                          fit: BoxFit.cover)
                          
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Title(color: Colors.white, child:  Text("title",style: titleStyle(),)),
                            Title(color: Colors.white, child:  Text("description",style: titleStyle(),)),
                          ],
                        ),
                      ),
                  );
                }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 3,mainAxisSpacing: 3),
                ),
            )
          ],
        ),
      ),
    );
  }

  TextStyle titleStyle() => GoogleFonts.aBeeZee(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w700,backgroundColor: Colors.white60);
}

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({
    super.key,
    required this.screenHeight,
  });

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueAccent.withOpacity(0.9),
      title: const Text("Product Store"),
      toolbarOpacity: 0.3,
      toolbarHeight: screenHeight-650,
      titleTextStyle: GoogleFonts.orbitron(fontSize: 25,fontWeight: FontWeight.w700,letterSpacing: 10),
      centerTitle: true,
      
    );
  }
}
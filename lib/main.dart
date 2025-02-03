import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.pacificoTextTheme()),
        home: LoadingPage());
  }
}
class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp){
      precacheImage(AssetImage("assets/sexy.jpg"), context).then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("LOADING...",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Colors.black))),
    );
  }
}
class MyHomePage extends StatelessWidget
{
    @override
    Widget build(BuildContext context)
    {
        double screenHeight = MediaQuery.of(context).size.height;
        double screenWidth = MediaQuery.of(context).size.width;

        return Scaffold(
          bottomNavigationBar: Container(
            color: Colors.white,
            child: Text(
            "made this app for our valentines!",
            textAlign: TextAlign.center,
            ),
          ),
            body: Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    "assets/sexy.jpg",
                  height: screenHeight * 0.50,
                  width: screenWidth,
                  fit:BoxFit.cover,
                  ),
                  Positioned(
                    top: screenHeight * 0.43,
                    child: Container(
                      height: 50,
                      width: screenWidth,
                      decoration: BoxDecoration( boxShadow: [
                          BoxShadow(
                            color: Colors.white.withAlpha(150),
                            blurRadius: 60,
                            spreadRadius: 30,
                        ),
                      ]),  
                    ),
                  ),
                  Container(
                    margin:  EdgeInsets.only(top:screenHeight * 0.45),
                    height: double.infinity,
                    width: screenWidth,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45),
                        topRight: Radius.circular(45),
                      )),
                      child: Column(
                        children: [
                          SizedBox(height: 40),
                          Text(
                            "Will you", 
                          style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(color: Colors.black)
                          ),
                          Text(
                            "be my", 
                          style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.black)
                          ),
                          Text(
                            "Valentine?", 
                          style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(color: Colors.black)
                          ),      
                          SizedBox(height:  5),
                          Text(
                            "- Love Tophie ♡",
                            style: GoogleFonts.poppins(fontSize: 18),
                          ),
                          SizedBox(height: 30),
                          GestureDetector(
                            onTap: () async {
                              String message = "Hi Tophie♡ You always have been my valentine!";
                              String email = "cthilairon@gmail.com"; // Use the email you want to send to
                              String subject = "Valentine's Message"; // Optional: Subject for the email
                              String body = Uri.encodeComponent(message); // The message body

                              String url = "mailto:$email?subject=$subject&body=$body";  // Create the mailto URL

                              Uri uri = Uri.parse(url); // Create a Uri object from the URL string
                              if (await launcher.canLaunchUrl(uri)) {
                                await launcher.launchUrl(uri);  // Use launchUrl instead of launch
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            
                            child: Container(
                                width: screenWidth * 0.6,
                                padding:  EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                      Colors.red[400]!,
                                      Colors.red[700]!, 
                                  ],),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25),
                                  )),
                                child:Text(
                                  "Yes!",
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.center,
                              )
                            )
                          )                                                                        
                        ],
                      ),
                    ),
                  Positioned(
                    top:screenHeight * 0.40,
                    child:Icon(Icons.favorite, color: Colors.red, size:90)),
                ],
            ),
        );
    }
}
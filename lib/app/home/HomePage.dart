import 'package:coin_convert/app/Convert/ConvertPage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void navigationPage() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => ConvertPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            SizedBox(
              child: Text(
                "CoinConvert",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 50,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
                width: 280,
                child: Image.asset(
                  "assets/images/coin.png",
                  fit: BoxFit.contain,
                )),
            SizedBox(
              height: 70,
            ),
            SizedBox(
              width: 250,
              height: 70,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side:
                            BorderSide(color: Colors.purple.shade900, width: 5),
                      ),
                    )),
                child: Text(
                  "Start",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[900]),
                ),
                onPressed: () {
                  navigationPage();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

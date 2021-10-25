import 'package:coin_convert/app/Convert/CoinDestinyPage.dart';
import 'package:coin_convert/app/Convert/CoinOriginPage.dart';
import 'package:coin_convert/app/api/sync_async.dart';
import 'package:coin_convert/app/shared/class/CoinClass.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ConvertPage extends StatefulWidget {
  const ConvertPage({Key? key}) : super(key: key);

  @override
  _ConvertPageState createState() => _ConvertPageState();
}

class _ConvertPageState extends State<ConvertPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String result = "000";

  void navigationCoinOriginPage() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => CoinOriginPage()));
  }

  void navigationCoinDestinyPage() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => CoinDestinyPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        backgroundColor: Colors.purple[800],
        title: Text(
          "Página de Conversão",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 110,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 7,
                      primary: Colors.white,
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      side: BorderSide(color: Colors.purple.shade900, width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.monetization_on,
                          color: Colors.purple[800],
                        ),
                        Text(
                          coinOrigin.sigla,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            color: Colors.purple[800],
                          ),
                        )
                      ],
                    ),
                    onPressed: () async {
                      await getListCoin();
                      navigationCoinOriginPage();
                    },
                  ),
                ),
                Icon(
                  Icons.change_circle,
                  size: 35,
                  color: Colors.purple[800],
                ),
                SizedBox(
                  width: 110,
                  height: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 7,
                      primary: Colors.white,
                      shape: const BeveledRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      side: BorderSide(color: Colors.purple.shade900, width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.monetization_on,
                          color: Colors.purple[800],
                        ),
                        Text(
                          coinDestiny.sigla,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            color: Colors.purple[800],
                          ),
                        )
                      ],
                    ),
                    onPressed: () async {
                      await getListCoin();
                      navigationCoinDestinyPage();
                    },
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 40,
            ),

            SizedBox(
                width: 200,
                height: 60,
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: controllerNum,
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.center,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Insira um valo valido";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            BorderSide(color: Colors.purple.shade900, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide:
                            BorderSide(color: Colors.purple.shade900, width: 2),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                              color: Colors.purple.shade900, width: 2)),
                      labelText: 'Digite o valor:',
                      labelStyle: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 17,
                      ),
                      hintText: 'Ex: 500',
                      hintStyle: TextStyle(
                          fontFamily: 'Poppins',
                          color: Colors.purple[100],
                          fontSize: 25),
                      //border: OutlineInputBorder
                    ),
                  ),
                )),

            SizedBox(
              height: 16,
            ),

            Container(
              width: 200,
              height: 60,
              padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.purple.shade800,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  result,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: Colors.purple[900],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 160,
              height: 70,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.purple.shade800),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side:
                            BorderSide(color: Colors.purple.shade900, width: 2),
                      ),
                    )),
                child: Text(
                  "Converter",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await getAllRates();
                    setState(() {
                      result = convertCoin(controllerNum.text, coinOrigin.sigla,
                          coinDestiny.sigla);
                    });
                  }
                  //navigationPage();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

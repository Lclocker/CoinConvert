import 'package:coin_convert/app/Convert/ConvertPage.dart';
import 'package:coin_convert/app/api/sync_async.dart';
import 'package:coin_convert/app/shared/class/CoinClass.dart';
import 'package:flutter/material.dart';

class CoinOriginPage extends StatefulWidget {
  const CoinOriginPage({Key? key}) : super(key: key);

  @override
  _CoinOriginPageState createState() => _CoinOriginPageState();
}

class _CoinOriginPageState extends State<CoinOriginPage> {
  void navigationConvertPage() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => ConvertPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.purple[800],
        title: Text(
          "Moeda de Origem",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: listCoin.length,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 5, left: 10, right: 10),
            child: Card(
              color: Colors.purple[100],
              child: ListTile(
                contentPadding: EdgeInsets.only(left: 20, right: 20),
                leading: Icon(
                  Icons.local_atm,
                  color: Colors.purple[800],
                  size: 40,
                ),
                title: Text(
                  "${listCoin[index].sigla}: ${listCoin[index].nome}",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                dense: true,
                onTap: () async {
                  await (coinOrigin = listCoin[index]);
                  navigationConvertPage();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

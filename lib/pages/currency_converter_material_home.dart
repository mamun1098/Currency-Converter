import 'dart:convert';

import 'package:currency_converter/pages/about_us.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CurrencyConverterMaterialHome2 extends StatefulWidget {
  const CurrencyConverterMaterialHome2({super.key});

  @override
  State<CurrencyConverterMaterialHome2> createState() =>
      _CurrencyConverterMaterialHomeState();
}

class _CurrencyConverterMaterialHomeState
    extends State<CurrencyConverterMaterialHome2> {
  double result = 0;
  double? exchangeRate;
  TextEditingController textEditingController = TextEditingController();

  Future<double?> fetExchangeRage() async {
    final url = Uri.parse(
      'https://v6.exchangerate-api.com/v6/7f7851c0a166504c7168f962/latest/USD',
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final rate = data['conversion_rates']['BDT'];
     
     setState(() {
        exchangeRate = rate;
     });
      return rate;
    } else {
      print("Failed Fetche: ${response.statusCode}");
      return null;
    }
  }

  @override
  void initState() {
    super.initState();
    fetExchangeRage();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(18, 18, 18, 0.32),
        width: 1,
        style: BorderStyle.solid,
        strokeAlign: BorderSide.strokeAlignOutside,
      ),
      borderRadius: BorderRadius.all(Radius.circular(4)),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Currency Converter"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 3,
        shadowColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.red,
              child: Text(
                result.toStringAsFixed(2), // optional: better formatting
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                controller: textEditingController,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.44),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  hintText: "Please enter the amount in USD",
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.44),
                    fontSize: 14,
                  ),
                  prefixIconColor: Color.fromRGBO(0, 0, 0, 0.44),
                  prefixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(Icons.monetization_on),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: border,
                  enabledBorder: border,
                ),
                keyboardType: TextInputType.numberWithOptions(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  backgroundColor: Colors.black,
                  minimumSize: Size(double.infinity, 50),
                  elevation: 8,
                  shadowColor: Colors.black,
                ),
                onPressed: ()  async{
                  final rate = await fetExchangeRage();
                  final inputValue = textEditingController.text;
                  // if (rate != null ){
                  //   setState(() {
                  //     result = double.parse(inputValue) * rate;
                  //   },);
                  // }
                  // },
                  
                  if (inputValue.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Please enter a value before converting.",
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  } else if(rate != null){
                    setState(() {
                      // exchangeRate = rate;
                      result = double.parse(inputValue) * rate;
                    });
                  }
                },
                child: Text("Convert", style: TextStyle(color: Colors.white)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: ElevatedButton(
                child: Text("About Us"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AboutUs()),
                  );
                },
              ),
            ),
            Padding(padding: EdgeInsets.all(10),
            child: Text(exchangeRate == null ? "\$ : Loading..." : "\$ : ${exchangeRate!.toStringAsFixed(2)}", style: TextStyle(fontSize: 20, color: Colors.blue),),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:currency_converter/pages/about_us.dart';
import 'package:flutter/material.dart';

class CurrencyConverterMaterialHome2 extends StatefulWidget {
  const CurrencyConverterMaterialHome2({super.key});

  @override
  State<CurrencyConverterMaterialHome2> createState() =>
      _CurrencyConverterMaterialHomeState();
}

class _CurrencyConverterMaterialHomeState
    extends State<CurrencyConverterMaterialHome2> {
  double result = 0;
  TextEditingController textEditingController = TextEditingController();

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
                onPressed: () {
                  final inputValue = textEditingController.text;
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
                  }
                  setState(() {
                    result = double.parse(inputValue) * 121.5;
                  });
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
          ],
        ),
      ),
    );
  }
}

// class CurrencyConverterMaterialHome extends StatelessWidget {
//   const CurrencyConverterMaterialHome({super.key});

//   //1. Create a variable that stores the converted currency value.
//   //2. Create a function that multiplies the value given by the textfield value
//   //3. store the value in the variable that we created
//   //4. display the varaible.

//   @override
//   Widget build(BuildContext context) {
//     double result = 0;
//     TextEditingController textEditingController = TextEditingController();

//     final border = OutlineInputBorder(
//       borderSide: BorderSide(
//         color: Color.fromRGBO(18, 18, 18, 0.32),
//         width: 1,
//         style: BorderStyle.solid,
//         strokeAlign: BorderSide.strokeAlignOutside,
//       ),
//       borderRadius: BorderRadius.all(Radius.circular(4)),
//     );
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text("Currency Converter"),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         elevation: 3,
//         shadowColor: Colors.black,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               padding: const EdgeInsets.all(10),
//               color: Colors.red,
//               child: Text(
//                result.toString(),
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 45,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(20),
//               child: TextField(
//                 controller: textEditingController,
//                 style: TextStyle(
//                   color: Color.fromRGBO(0, 0, 0, 0.44),
//                   fontSize: 14,
//                   fontWeight: FontWeight.w400,
//                 ),
//                 decoration: InputDecoration(
//                   // label: Text("Please enter the amount in USD", style: TextStyle(color: Colors.white),)
//                   // helperText: "Please enter the amount in USD",
//                   hintText: "Please enter the amount in USD",
//                   hintStyle: TextStyle(
//                     color: Color.fromRGBO(0, 0, 0, 0.44),
//                     fontSize: 14,
//                   ),
//                   // prefix: Icon(Icons.monetization_on),
//                   prefixIconColor: Color.fromRGBO(0, 0, 0, 0.44),
//                   prefixIcon: Align(
//                     widthFactor: 1.0,
//                     heightFactor: 1.0,
//                     child: Icon(Icons.monetization_on),
//                   ),
//                   filled: true,
//                   fillColor: Colors.white,

//                   focusedBorder: border,
//                   enabledBorder: border,
//                 ),
//                 keyboardType: TextInputType.numberWithOptions(),
//               ),
//             ),
//             //button
//             //Raised
//             //Appears like a text
//             Padding(
//               padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//               child: TextButton(
//                 style: TextButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: const BorderRadius.all(Radius.circular(8)),
//                   ),
//                   backgroundColor: Colors.black,
//                   minimumSize: Size(double.infinity, 50),
//                   elevation: 8,
//                   shadowColor: Colors.black,
//                 ),
//                 onPressed: () {
//                   // if (kDebugMode) {
//                   //   print("Button Clicked");
//                   // }
//                   result = double.parse(textEditingController.text)*121.5;
//                   print(double.parse(textEditingController.text)*81);
//                 },
//                 child: Text("Convert", style: TextStyle(color: Colors.white)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

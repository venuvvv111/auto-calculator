import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ApplicantsX(),
  );
}

class ApplicantsX extends StatefulWidget {
  const ApplicantsX({Key? key}) : super(key: key);

  @override
  State<ApplicantsX> createState() => _ApplicantsXState();
}

class _ApplicantsXState extends State<ApplicantsX> {
  final TextEditingController controller = TextEditingController();
  final TextEditingController control = TextEditingController();
  final t1 = TextEditingController();
  final t2 = TextEditingController();

  // final TextEditingController controller = TextEditingController();

  //@override

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("data export"),
        ),
        body: Column(
          children: [
            TextField(
              controller: t1,
              decoration: InputDecoration(hintText: "data1"),
            ),
            TextField(
              controller: t2,
              decoration: InputDecoration(hintText: "data2"),
            ),
            ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> data = {
                    "field1": t1.text,
                    "field2": t2.text
                  };
                  var firestore;
                  firestore.instance.collection("test").add(data);
                },
                child: Text('add'))
          ],
        ),
      ),
    );
  }
}







// class MyApp extends StatefulWidget {
//   MyApp({Key? key}) : super(key: key);

//   @override
//   _CalculateState createState() => _CalculateState();
// }

// class _CalculateState extends State<MyApp> {
//   var num1 = 0, num2 = 0, result = 0;
//   final TextEditingController t1 = new TextEditingController();
//   final TextEditingController t2 = new TextEditingController();
//   void doAddition() {
//     setState(() {
//       num1 = int.parse(t1.text);
//       num2 = int.parse(t2.text);
//       result = (num1 * 8) + num2;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Calculate'),
//         ),
//         body: SafeArea(
//           child: Column(
//             children: [
//               TextField(
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(hintText: 'enter first value'),
//                 controller: t1,
//               ),
//               TextField(
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(hintText: 'enter second value'),
//                 controller: t2,
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                     doAddition();
//                   },
//                   child: Text('Calculate')),
//               Container(
//                 height: 30,
//                 width: double.infinity,
//                 child: Text('$result'),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

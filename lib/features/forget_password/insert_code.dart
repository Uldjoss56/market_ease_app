// import 'dart:async';
// import 'dart:math';

// import 'package:flutter/material.dart';


// class InsertCode extends StatefulWidget {
//   const InsertCode({super.key});
//   @override
//   State<InsertCode> createState() => _InsertCodeState();
// }

// class _InsertCodeState extends State<InsertCode> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _firstLetter = TextEditingController();
//   final TextEditingController _secondLetter = TextEditingController();
//   final TextEditingController _thirdLetter = TextEditingController();
//   final TextEditingController _fourthLetter = TextEditingController();
//   final TextEditingController _fifthLetter = TextEditingController();

//   String enterPassword = '';
//   late int codeGenerate = Random().nextInt(89999) + 10000;
//   late int codeEnter;

//   late Timer timer;
//   int start = 10;

//   @override
//   void initState() {
//     super.initState();
//     startTimer();
//   }

//   @override
//   void dispose() {
//     timer.cancel();
//     super.dispose();
//   }

//   void startTimer() {
//     timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (start < 1) {
//           // TextButton(
//           //   onPressed: () {
//           //     start = 60;
//           //     codeGenerate = Random().nextInt(89999) + 10000;
//           //   },
//           //   child: const Text("Renvoyer le code"),
//           // );
//           timer.cancel();
//         } else {
//           start--;
//         }
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: _formKey,
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               //mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 const CircleAvatar(
//                   radius: 50.0,
//                   backgroundImage: AssetImage(
//                     "",
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 Container(
//                   child: const Text(
//                     'Mot de passe oublié',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
//                   ),
//                 ),
//                 //const SizedBox(height: 20),
//                 Container(
//                   child: const Text(
//                     'Entrez le code !',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         margin: const EdgeInsets.symmetric(horizontal: 3),
//                         child: TextFormField(
//                           textAlign: TextAlign.center,
//                           maxLength: 1,
//                           keyboardType: TextInputType.number,
//                           decoration: const InputDecoration(
//                             counterText: "",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(20),
//                               ),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Champ vide';
//                             }
//                             return null;
//                           },
//                           controller: _firstLetter,
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Container(
//                         margin: const EdgeInsets.symmetric(horizontal: 3),
//                         child: TextFormField(
//                           maxLength: 1,
//                           textAlign: TextAlign.center,
//                           keyboardType: TextInputType.number,
//                           decoration: const InputDecoration(
//                             counterText: "",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(20),
//                               ),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Champ vide';
//                             }
//                             return null;
//                           },
//                           controller: _secondLetter,
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Container(
//                         margin: const EdgeInsets.symmetric(horizontal: 3),
//                         child: TextFormField(
//                           maxLength: 1,
//                           textAlign: TextAlign.center,
//                           keyboardType: TextInputType.number,
//                           decoration: const InputDecoration(
//                             counterText: "",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(20),
//                               ),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Champ vide';
//                             }
//                             return null;
//                           },
//                           controller: _thirdLetter,
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Container(
//                         margin: const EdgeInsets.symmetric(horizontal: 3),
//                         child: TextFormField(
//                           maxLength: 1,
//                           textAlign: TextAlign.center,
//                           keyboardType: TextInputType.number,
//                           decoration: const InputDecoration(
//                             counterText: "",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(20),
//                               ),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Champ vide';
//                             }
//                             return null;
//                           },
//                           controller: _fourthLetter,
//                         ),
//                       ),
//                     ),
//                     Expanded(
//                       child: Container(
//                         margin: const EdgeInsets.symmetric(horizontal: 3),
//                         child: TextFormField(
//                           maxLength: 1,
//                           textAlign: TextAlign.center,
//                           keyboardType: TextInputType.number,
//                           decoration: const InputDecoration(
//                             counterText: "",
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(20),
//                               ),
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Champ vide';
//                             }
//                             return null;
//                           },
//                           controller: _fifthLetter,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),

//                 Text(
//                   "$start",
//                   style: TextStyle(),
//                 ),

//                 const SizedBox(height: 70),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 150.0, vertical: 20),
//                     backgroundColor: Colors.amber,
//                     shape: const ContinuousRectangleBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(50.0))),
//                   ),
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       _formKey.currentState!.save();
//                       enterPassword += _firstLetter.text;
//                       enterPassword += _secondLetter.text;
//                       enterPassword += _thirdLetter.text;
//                       enterPassword += _fourthLetter.text;
//                       enterPassword += _fifthLetter.text;

//                       codeEnter = int.parse(enterPassword);

//                       if (codeEnter == codeGenerate && start > 0) {
//                         timer.cancel();
//                         // Navigator.of(context).pop(
//                         //   enterPassword,
//                         // );
//                       } else if (codeEnter != codeGenerate && start > 0) {
//                         // setState(() {
//                         //   start = 60;
//                         // });
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text('Code invalide'),
//                           ),
//                         );
//                       } else {
//                         TextButton(
//                           onPressed: () {
//                             setState(() {
//                               start = 10;
//                               codeGenerate = Random().nextInt(89999) + 10000;
//                             });
//                           },
//                           child: const Text("Renvoyer le code"),
//                         );
//                       }
//                     }
//                   },
//                   child: const Text(
//                     'Validez',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 17.0,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
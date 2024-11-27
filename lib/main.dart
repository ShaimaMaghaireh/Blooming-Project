import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_with_firebase/Splash.dart';
import 'package:flutter_with_firebase/cloudData.dart';
import 'package:flutter_with_firebase/notificationHandler.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import'authservice.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_notifications_handler/firebase_notifications_handler.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import'addProduct.dart';
import'cloudData.dart';
import 'package:image_picker/image_picker.dart';


Future<String?> loginWithEmail(String mail,String pwd) async
{
  print('Logging with email:$mail and password:$pwd');
  try
  {
  await FirebaseAuth.instance.signInWithEmailAndPassword(email:mail, password: pwd);
  print('Logged in successfuly');
  return null;
  }
    on FirebaseAuthException catch (e)
  {
    if(e.code == 'user not found')
    {
      print('no user found for this email');
    }
    else if (e.code == 'Wrong password')
    {
      print('wrong password provided for this user');
    }
 print(e.code);
 return e.message;
  }
}

// Future<String?> googleSignIn() async
// {
//   try{
//     await FirebaseAuth.instance.signInWithPopup(GoogleAuthProvider());
//     return null;
//   }
//   on FirebaseAuthException catch (ex)
//   {
//     return"  ${ex.code} : ${ex.message}}";
//   }
//   on UnimplementedError catch (ex)
//   {
//     return ex.message;
//   }
// }

Future<UserCredential> googleSignIn() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}


 Future<void> main () async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

await firebase_messaging_to_project().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
 @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(home: addProductScreen(),);
  }
}

// class Authpage extends StatefulWidget
// {
//   @override
//   _AuthpageState createState() =>  _AuthpageState();
// }



// class _AuthpageState extends State<Authpage>
// {
//   TextEditingController _emailController= TextEditingController();
//   TextEditingController _passwordController= TextEditingController();

//   void _login()
//   {
//     loginWithEmail(_emailController.text, _passwordController.text);
//   }

//   void _signInWithGoogle() async
// {
//  UserCredential result = await googleSignIn();
//  if(result == null)
//  {
//   Navigator.pushReplacementNamed(context,'/home/');
//  }
//  else 
//  {
//   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('result')));
//  }
// }
//   @override
//   Widget build(BuildContext context) 
//   {
//     return Scaffold(
//      appBar: AppBar(title:Text('Authentication Example'),),
//      body:Padding(padding: const EdgeInsets.all(16.0),
//      child:Column(
//       crossAxisAlignment:CrossAxisAlignment.center,
//       children: [
//         Text('Welcome to Firebase Authentication!',style:TextStyle(fontSize:24),),

//         TextField(
//           controller: _emailController,
//           decoration: InputDecoration(labelText:'Email'),
//         ),

//          TextField(
//           controller: _passwordController,
//           decoration: InputDecoration(labelText:'Email'),
//         ),

//         ElevatedButton(onPressed: _login, child: Text('Log in')),

//         ElevatedButton(onPressed: _signInWithGoogle, child: Text('Sign in with google'),
//         style:ElevatedButton.styleFrom(backgroundColor:Colors.red),),
//       ],
//      ),),
//     );
//   }
// }

// class Plant {
//   final String id;
//   final String name;
//   final String category;
//   final String size;
//   final String difficulty;
//   final String description;
//   final double price;
//   final int humidity;
//   final double height;
//   final String temperature;
//   final String imageUrl;

//   Plant({
//     required this.id,
//     required this.name,
//     required this.category,
//     required this.size,
//     required this.difficulty,
//     required this.description,
//     required this.price,
//     required this.humidity,
//     required this.height,
//     required this.temperature,
//     required this.imageUrl,
//   });

//   factory Plant.fromFirestore(DocumentSnapshot doc) {
//     Map data = doc.data() as Map;
//     return Plant(
//       id: doc.id,
//       name: data['name'] ?? '',
//       category: data['category'] ?? '',
//       size: data['size'] ?? '',
//       difficulty: data['difficulty'] ?? '',
//       description: data['description'] ?? '',
//       price: data['price'] ?? 0.0,
//       humidity: data['humidity'] ?? 0,
//       height: data['height'] ?? 0.0,
//       temperature: data['temperature'] ?? '',
//       imageUrl: data['imageUrl'] ?? '',
//     );
//   }
// }

// class PlantCard extends StatelessWidget {
//   final Plant plant;

//   PlantCard({required this.plant});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//       child: ListTile(
//         leading: Image.network(plant.imageUrl),
//         title: Text(plant.name),
//         subtitle: Text(plant.category),
//         trailing: Text('\$${plant.price.toStringAsFixed(2)}'),
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => PlantDetailsScreen(plant: plant),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class PlantDetailsScreen extends StatelessWidget {
//   final Plant plant;

//   PlantDetailsScreen({required this.plant});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(plant.name),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(child: Image.network(plant.imageUrl,width:200,height: 200,)),
//             SizedBox(height: 20),
//             Text(
//               plant.name,
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             Text('\$${plant.price.toStringAsFixed(2)}', style: TextStyle(fontSize: 20)),
//             SizedBox(height: 10),
//             Text("Category: ${plant.category}"),
//             Text("Size: ${plant.size}"),
//             Text("Difficulty: ${plant.difficulty}"),
//             Text("Humidity: ${plant.humidity}%"),
//             Text("Height: ${plant.height} inches"),
//             Text("Temperature: ${plant.temperature}"),
//             SizedBox(height: 20),
//             Text(
//               plant.description,
//               style: TextStyle(fontSize: 16),
//             ),
//             Spacer(),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement checkout functionality
//               },
//               child: Text("Checkout"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// class HomeScreen extends StatefulWidget
// {
//   @override 
//   _HomeScreenState createState() => _HomeScreenState();
// }



// class  _HomeScreenState extends State<HomeScreen> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
     
//       appBar: AppBar(
//         title: Text("Hi, Arya"),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               decoration: InputDecoration(
//                 labelText: 'Search Plant',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: StreamBuilder(
//               stream: _firestore.collection('plants').snapshots(),
//               builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                 if (!snapshot.hasData) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//                 return ListView.builder(
//                   itemCount: snapshot.data!.docs.length,
//                   itemBuilder: (context, index) {
//                     Plant plant = Plant.fromFirestore(snapshot.data!.docs[index]);
//                     return PlantCard(plant: plant);
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class BottomNavClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     final center = size.width / 2;

//     path.lineTo(center - 50, 0);
//     path.quadraticBezierTo(center - 30, 0, center - 30, 20);
//     path.arcToPoint(
//       Offset(center + 30, 20),
//       radius: Radius.circular(40),
//       clockwise: false,
//     );
//     path.quadraticBezierTo(center + 30, 0, center + 50, 0);
//     path.lineTo(size.width, 0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(0, size.height);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }


// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({super.key, required this.title});

// //   final String title;

// //   @override
// //   State<MyHomePage> createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<MyHomePage> {
// //   int _counter = 0;

// //   void _incrementCounter() {
// //     setState(() {
// //       _counter++;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
// //         title: Text('Flutter with firebase'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             const Text(
// //               'You have pushed the button this many times:',
// //             ),
// //             Text(
// //               '$_counter',
// //               style: Theme.of(context).textTheme.headlineMedium,
// //             ),
// //           ],
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: _incrementCounter,
// //         tooltip: 'Increment',
// //         child: const Icon(Icons.add),
// //       ),
// //     );
// //   }
// // }

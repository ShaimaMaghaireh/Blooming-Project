import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import '../../Blooming_App/firebase_options.dart';
import 'package:flutter/material.dart';


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Color(0xFF1A3A34),
//         body: PlantDetailsScreen(),
//       ),
//     );
//   }
// }

// class PlantDetailsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Top Content with Back Button and Plant Details
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Back Button
//                 Icon(
//                   Icons.arrow_back,
//                   color: Colors.greenAccent,
//                 ),
//                 SizedBox(height: 20),
//                 // Plant Title and Description
//                 Text(
//                   'Rubber Tree',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 Text(
//                   'Robust and dramatic,\nwith glossy leaves.',
//                   style: TextStyle(
//                     color: Colors.white70,
//                     fontSize: 16,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 // Plant Tags
//                 Row(
//                   children: [
//                     PlantTag(label: 'Easy to Grow'),
//                     SizedBox(width: 10),
//                     PlantTag(label: 'Air Cleaner'),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 Row(
//                   children: [
//                     PlantTag(label: 'Pet Friendly'),
//                     SizedBox(width: 10),
//                     PlantTag(label: '28-35" Tall'),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 // Plant Requirements
//                 Container(
//                   padding: EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: Color(0xFF2E4D4B),
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       RequirementRow(icon: Icons.water_drop, text: 'Every 7 days'),
//                       RequirementRow(icon: Icons.wb_sunny, text: 'Needs sun'),
//                       RequirementRow(icon: Icons.thermostat, text: 'Minimum of 1°C'),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         // Size Selection and Add to Cart Section
//         Container(
//           padding: EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Choose the size',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   SizeOption(label: '10"'),
//                   SizeOption(label: '15"'),
//                   SizeOption(label: '20"'),
//                   SizeOption(label: '25"'),
//                 ],
//               ),
//               SizedBox(height: 20),
//               // Add to Cart Button
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Add to Cart - \$55',
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.green,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                     child: Text('Buy Now'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class PlantTag extends StatelessWidget {
//   final String label;

//   const PlantTag({required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//       decoration: BoxDecoration(
//         color: Colors.tealAccent.withOpacity(0.2),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Text(
//         label,
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 12,
//         ),
//       ),
//     );
//   }
// }

// class RequirementRow extends StatelessWidget {
//   final IconData icon;
//   final String text;

//   const RequirementRow({required this.icon, required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.greenAccent, size: 20),
//           SizedBox(width: 10),
//           Text(
//             text,
//             style: TextStyle(color: Colors.white70),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class SizeOption extends StatelessWidget {
//   final String label;

//   const SizeOption({required this.label});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: Color(0xFF2E4D4B),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Text(
//         label,
//         style: TextStyle(color: Colors.white),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Color(0xFF2D6A4F),
//         body: CactusDetailsScreen(),
//       ),
//     );
//   }
// }

// class CactusDetailsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Top Content with Back Button, Title, Icon, and Cactus Image
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Header with Back and Menu Icons
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Icon(Icons.arrow_back, color: Colors.white),
//                     Row(
//                       children: [
//                         Icon(Icons.search, color: Colors.white),
//                         SizedBox(width: 10),
//                         Icon(Icons.more_vert, color: Colors.white),
//                       ],
//                     ),
//                   ],
//                 ),
//                 //SizedBox(height: 20),
//                 // Plant Title
//                 Text(
//                   'Cactus',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 32,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                // SizedBox(height: 5),
//                 // Text(
//                 //   'in terracotta potta',
//                 //   style: TextStyle(
//                 //     color: Colors.white70,
//                 //     fontSize: 16,
//                 //   ),
//                 // ),
//                 SizedBox(height: 20),
//                 // Requirement Icons and Text
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     RequirementRow(icon: Icons.water_drop, text: '2 times'),
//                     RequirementRow(icon: Icons.wb_sunny, text: '1-2° sunlight'),
//                     RequirementRow(icon: Icons.pets, text: 'Pets friendly'),
//                     RequirementRow(icon: Icons.thermostat, text: '1° C minimum'),
//                   ],
//                 ),
//                 // Spacer(),
//                 // Cactus Image
//                 Center(
//                   child: Image.network(
//                     'https://cdn-icons-png.flaticon.com/512/3895/3895080.png',
//                     height: 80,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         // Details Section
//         Container(
//           padding: EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Details Information
//               DetailRow(label: 'Price', value: '\$120.00'),
//               DetailRow(label: 'Plant', value: 'Cactus'),
//               DetailRow(label: 'Size', value: 'Medium'),
//               SizedBox(height: 20),
//               // Description Section
//               Text(
//                 'Description',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'A cactus is a great addition to the home. Caring for it is very easy as it doesn’t require much water or sunlight. It brings a touch of nature to your space.',
//                 style: TextStyle(color: Colors.black54),
//               ),
//               SizedBox(height: 20),
//               // Add to Cart Button
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                   ),
//                   child: Text('Add to cart', style: TextStyle(fontSize: 16)),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// class RequirementRow extends StatelessWidget {
//   final IconData icon;
//   final String text;

//   const RequirementRow({required this.icon, required this.text});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 8.0),
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.yellow, size: 20),
//           SizedBox(width: 10),
//           Text(
//             text,
//             style: TextStyle(color: Colors.white70),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class DetailRow extends StatelessWidget {
//   final String label;
//   final String value;

//   const DetailRow({required this.label, required this.value});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(label, style: TextStyle(color: Colors.black54, fontSize: 16)),
//           Text(value, style: TextStyle(color: Colors.black, fontSize: 16)),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF2D6A4F),
        body: CactusDetailsScreen(),
      ),
    );
  }
}

class CactusDetailsScreen extends StatefulWidget {
  @override
  _CactusDetailsScreenState createState() => _CactusDetailsScreenState();
}

class _CactusDetailsScreenState extends State<CactusDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top Content with Back Button, Title, Icon, and Cactus Image
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with Back and Menu Icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.arrow_back, color: Colors.white),
                    Row(
                      children: [
                        Icon(Icons.search, color: Colors.white),
                        SizedBox(width: 10),
                        Icon(Icons.more_vert, color: Colors.white),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Plant Title
                Text(
                  'Cactus',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'in terracotta potta',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                // Requirement Icons and Text
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.water_drop, color: Colors.yellow, size: 20),
                      SizedBox(width: 10),
                      Text(
                        '2 times',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.wb_sunny, color: Colors.yellow, size: 20),
                      SizedBox(width: 10),
                      Text(
                        '1-2° sunlight',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.pets, color: Colors.yellow, size: 20),
                      SizedBox(width: 10),
                      Text(
                        'Pets friendly',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.thermostat, color: Colors.yellow, size: 20),
                      SizedBox(width: 10),
                      Text(
                        '1° C minimum',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                // Cactus Image
                Center(
                  child: Image.network(
                    'https://example.com/cactus.png',
                    height: 180,
                  ),
                ),
              ],
            ),
          ),
        ),
        // Details Section
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Details Information
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Price', style: TextStyle(color: Colors.black54, fontSize: 16)),
                    Text('\$120.00', style: TextStyle(color: Colors.black, fontSize: 16)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Plant', style: TextStyle(color: Colors.black54, fontSize: 16)),
                    Text('Cactus', style: TextStyle(color: Colors.black, fontSize: 16)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Size', style: TextStyle(color: Colors.black54, fontSize: 16)),
                    Text('Medium', style: TextStyle(color: Colors.black, fontSize: 16)),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Description Section
              Text(
                'Description',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'A cactus is a great addition to the home. Caring for it is very easy as it doesn’t require much water or sunlight. It brings a touch of nature to your space.',
                style: TextStyle(color: Colors.black54),
              ),
              SizedBox(height: 20),
              // Add to Cart Button
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text('Add to cart', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
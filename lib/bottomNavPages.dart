import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'homepage2.dart';

// class CartPage extends StatefulWidget {
//   @override
//   _CartPageState createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cart'),
//       ),
//       body: StreamBuilder<DocumentSnapshot>(
//         stream: _firestore.collection('cart').doc('user1').snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData || !snapshot.data!.exists) {
//             return Center(child: Text('No items in the cart.'));
//           }

//           final cartItems = List<String>.from(snapshot.data!['plants']);
//           if (cartItems.isEmpty) {
//             return Center(child: Text('No items in the cart.'));
//           }

//           return Column(
//             children: [
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: cartItems.length,
//                   itemBuilder: (context, index) {
//                     final plantId = cartItems[index];
//                     return FutureBuilder<DocumentSnapshot>(
//                       future: _firestore.collection('plants').doc(plantId).get(),
//                       builder: (context, plantSnapshot) {
//                         if (!plantSnapshot.hasData) {
//                           return Center(child: CircularProgressIndicator());
//                         }

//                         final plant = plantSnapshot.data!;
//                         return Card(
//                           child: ListTile(
//                             leading: Image.network(
//                               plant['imageUrl'],
//                               fit: BoxFit.cover,
//                               width: 50,
//                               height: 50,
//                             ),
//                             title: Text(plant['name']),
//                             subtitle: Text('₹${plant['price']}'),
//                             trailing: IconButton(
//                               icon: Icon(Icons.delete, color: Colors.red),
//                               onPressed: () async {
//                                 // Remove item from cart
//                                 cartItems.remove(plantId);
//                                 await _firestore
//                                     .collection('cart')
//                                     .doc('user1')
//                                     .update({'plants': cartItems});
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   SnackBar(content: Text('Removed from Cart!')),
//                                 );
//                               },
//                             ),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 ),
//               ),
//               // Checkout Button at the bottom
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Pass the cart items to CheckoutScreen
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => CheckoutScreen(cartItems: cartItems),
//                       ),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                   child: Text('Proceed to Checkout'),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
// class CartPage extends StatefulWidget {
//   @override
//   _CartPageState createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// void _checkout() {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Proceeding to Checkout!')),
//     );

//    Navigator.push(context, MaterialPageRoute(builder: (context) => CheckoutScreen(cartItems: cartItems)));
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cart'),
//       ),
//       body: StreamBuilder<DocumentSnapshot>(
//         stream: _firestore.collection('cart').doc('user1').snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData || !snapshot.data!.exists) {
//             return Center(child: Text('No items in the cart.'));
//           }

//           final cartItems = List<String>.from(snapshot.data!['plants']);
//           if (cartItems.isEmpty) {
//             return Center(child: Text('No items in the cart.'));
//           }

//           return ListView.builder(
//             itemCount: cartItems.length,
//             itemBuilder: (context, index) {
//               final plantId = cartItems[index];
//               return FutureBuilder<DocumentSnapshot>(
//                 future: _firestore.collection('plants').doc(plantId).get(),
//                 builder: (context, plantSnapshot) {
//                   if (!plantSnapshot.hasData) {
//                     return Center(child: CircularProgressIndicator());
//                   }

//                   final plant = plantSnapshot.data!;
//                   return Card(
//                     child: ListTile(
//                       leading: Image.network(
//                         plant['imageUrl'],
//                         fit: BoxFit.cover,
//                         width: 50,
//                         height: 50,
//                       ),
//                       title: Text(plant['name']),
//                       subtitle: Text('₹${plant['price']}'),
//                       trailing: IconButton(
//                         icon: Icon(Icons.delete, color: Colors.red),
//                         onPressed: () async {
//                           // Remove item from cart
//                           cartItems.remove(plantId);
//                           await _firestore
//                               .collection('cart')
//                               .doc('user1')
//                               .update({'plants': cartItems});
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text('Removed from Cart!')),
//                           );
//                         },
//                       ),
//                     ),
//                   );
//                 },
//               );
//             },
//           );
//         },
//       ),
//      //Checkout Button at the bottom
//       floatingActionButton: FloatingActionButton(
//         onPressed: _checkout,
//         backgroundColor: Colors.green,
//         child: Icon(Icons.check),),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {
//       //     // Navigate to CheckoutScreen
//       //     Navigator.push(
//       //       context,
//       //       MaterialPageRoute(
//       //         builder: (context) => CheckoutScreen(cartItems: snapshot.data!['plants']),
//       //       ),
//       //     );
//       //   },
//       //   backgroundColor: Colors.green,
//       //   child: Icon(Icons.check),
//       // ),
      
//     );
//   }
// }
// class CartPage extends StatefulWidget {
//   @override
//   _CartPageState createState() => _CartPageState();
// }

// class _CartPageState extends State<CartPage> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   void _checkout(List<String> cartItems) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Proceeding to Checkout!')),
//     );

//     print("Cart Items: $cartItems");  // Log the cart items

//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => CheckoutScreen(cartItems: cartItems),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cart'),
//       ),
//       body: StreamBuilder<DocumentSnapshot>(
//         stream: _firestore.collection('cart').doc('user1').snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData || !snapshot.data!.exists) {
//             return Center(child: Text('No items in the cart.'));
//           }

//           final cartItems = List<String>.from(snapshot.data!['plants']);
//           if (cartItems.isEmpty) {
//             return Center(child: Text('No items in the cart.'));
//           }

//           return ListView.builder(
//             itemCount: cartItems.length,
//             itemBuilder: (context, index) {
//               final plantId = cartItems[index];
//               return FutureBuilder<DocumentSnapshot>(
//                 future: _firestore.collection('plants').doc(plantId).get(),
//                 builder: (context, plantSnapshot) {
//                   if (!plantSnapshot.hasData) {
//                     return Center(child: CircularProgressIndicator());
//                   }

//                   final plant = plantSnapshot.data!;
//                   return Card(
//                     child: ListTile(
//                       leading: Image.network(
//                         plant['imageUrl'],
//                         fit: BoxFit.cover,
//                         width: 50,
//                         height: 50,
//                       ),
//                       title: Text(plant['name']),
//                       subtitle: Text('₹${plant['price']}'),
//                       trailing: IconButton(
//                         icon: Icon(Icons.delete, color: Colors.red),
//                         onPressed: () async {
//                           // Remove item from cart
//                           cartItems.remove(plantId);
//                           await _firestore
//                               .collection('cart')
//                               .doc('user1')
//                               .update({'plants': cartItems});
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(content: Text('Removed from Cart!')),
//                           );
//                         },
//                       ),
//                     ),
//                   );
//                 },
//               );
//             },
//           );
//         },
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _checkout(List<String>.from(snapshot.data!['plants']));  // Pass correct cart items
//         },
//         backgroundColor: Colors.green,
//         child: Icon(Icons.check),
//       ),
//     );
//   }
// }

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Method to navigate to CheckoutScreen with cartItems
  void _checkout(List<String> cartItems) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Proceeding to Checkout!')),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CheckoutScreen(cartItems: cartItems),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: _firestore.collection('cart').doc('user1').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('No items in the cart.'));
          }

          final cartItems = List<String>.from(snapshot.data!['plants']);
          if (cartItems.isEmpty) {
            return Center(child: Text('No items in the cart.'));
          }

          return ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final plantId = cartItems[index];
              return FutureBuilder<DocumentSnapshot>(
                future: _firestore.collection('plants').doc(plantId).get(),
                builder: (context, plantSnapshot) {
                  if (!plantSnapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  final plant = plantSnapshot.data!;
                  return Card(
                    child: ListTile(
                      leading: Image.network(
                        plant['imageUrl'],
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                      ),
                      title: Text(plant['name']),
                      subtitle: Text('₹${plant['price']}'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () async {
                          // Remove item from cart
                          cartItems.remove(plantId);
                          await _firestore
                              .collection('cart')
                              .doc('user1')
                              .update({'plants': cartItems});
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Removed from Cart!')),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      // Checkout Button at the bottom
      floatingActionButton: StreamBuilder<DocumentSnapshot>(
        stream: _firestore.collection('cart').doc('user1').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return SizedBox.shrink();  // Hide button if no cart items
          }

          final cartItems = List<String>.from(snapshot.data!['plants']);
          return FloatingActionButton(
            onPressed: () {
              _checkout(cartItems);  // Pass cart items here
            },
            backgroundColor: Colors.green,
            child: Icon(Icons.check),
          );
        },
      ),
    );
  }
}



// class CheckoutScreen extends StatefulWidget {
//   final List<String> cartItems; // Cart items passed from CartPage

//   CheckoutScreen({required this.cartItems});

//   @override
//   _CheckoutScreenState createState() => _CheckoutScreenState();
// }

// class _CheckoutScreenState extends State<CheckoutScreen> {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   double totalAmount = 0.0;

//   @override
//   void initState() {
//     super.initState();
//     _calculateTotalAmount();
//   }

//   // Calculate the total amount of the cart
//   Future<void> _calculateTotalAmount() async {
//     double total = 0.0;
//     for (var plantId in widget.cartItems) {
//       final plantSnapshot = await _firestore.collection('plants').doc(plantId).get();
//       if (plantSnapshot.exists) {
//         total += plantSnapshot['price'] as double;
//       }
//     }
//     setState(() {
//       totalAmount = total;
//     });
//   }

//   // Confirm order (you can extend this with payment or order processing)
//   void _confirmOrder() async {
//     // Process the order (for now, just show a confirmation message)
//     await _firestore.collection('orders').add({
//       'userId': 'user1', // Use the actual user ID
//       'plants': widget.cartItems,
//       'totalAmount': totalAmount,
//       'status': 'Pending',
//       'orderDate': Timestamp.now(),
//     });

//     // After placing the order, clear the cart
//     await _firestore.collection('cart').doc('user1').update({'plants': []});

//     // Show confirmation and navigate back
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Order Confirmed!')),
//     );
//     Navigator.pop(context); // Go back to the previous screen (CartPage)
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Checkout'),
//       ),
//       body: FutureBuilder<void>(
//         future: _calculateTotalAmount(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }

//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Review your Order',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 20),
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: widget.cartItems.length,
//                     itemBuilder: (context, index) {
//                       final plantId = widget.cartItems[index];
//                       return FutureBuilder<DocumentSnapshot>(
//                         future: _firestore.collection('plants').doc(plantId).get(),
//                         builder: (context, plantSnapshot) {
//                           if (!plantSnapshot.hasData) {
//                             return Center(child: CircularProgressIndicator());
//                           }

//                           final plant = plantSnapshot.data!;
//                           return Card(
//                             margin: EdgeInsets.symmetric(vertical: 8),
//                             child: ListTile(
//                               leading: Image.network(
//                                 plant['imageUrl'],
//                                 fit: BoxFit.cover,
//                                 width: 50,
//                                 height: 50,
//                               ),
//                               title: Text(plant['name']),
//                               subtitle: Text('₹${plant['price']}'),
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ),
//                 Divider(),
//                 Text(
//                   'Total Amount: ₹$totalAmount',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: _confirmOrder,
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                   child: Text('Confirm Order'),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class CheckoutScreen extends StatefulWidget {
  final List<String> cartItems; // Cart items passed from CartPage

  CheckoutScreen({required this.cartItems});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  double totalAmount = 0.0;

  @override
  void initState() {
    super.initState();
    _calculateTotalAmount();
  }

  // Calculate the total amount of the cart
  Future<void> _calculateTotalAmount() async {
    double total = 0.0;
    for (var plantId in widget.cartItems) {
      final plantSnapshot = await _firestore.collection('plants').doc(plantId).get();
      if (plantSnapshot.exists) {
        total += plantSnapshot['price'] as double;
      }
    }
    setState(() {
      totalAmount = total;
    });
  }

  // Confirm order (you can extend this with payment or order processing)
  void _confirmOrder() async {
    // Process the order (for now, just show a confirmation message)
    await _firestore.collection('orders').add({
      'userId': 'user1', // Use the actual user ID
      'plants': widget.cartItems,
      'totalAmount': totalAmount,
      'status': 'Pending',
      'orderDate': Timestamp.now(),
    });

    // After placing the order, clear the cart
    await _firestore.collection('cart').doc('user1').update({'plants': []});

    // Show confirmation and navigate back
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Order Confirmed!')),
    );
    Navigator.pop(context); // Go back to the previous screen (CartPage)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: FutureBuilder<void>(
        future: _calculateTotalAmount(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Review your Order',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.cartItems.length,
                    itemBuilder: (context, index) {
                      final plantId = widget.cartItems[index];
                      return FutureBuilder<DocumentSnapshot>(
                        future: _firestore.collection('plants').doc(plantId).get(),
                        builder: (context, plantSnapshot) {
                          if (!plantSnapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          }

                          final plant = plantSnapshot.data!;
                          return Card(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            child: ListTile(
                              leading: Image.network(
                                plant['imageUrl'],
                                fit: BoxFit.cover,
                                width: 50,
                                height: 50,
                              ),
                              title: Text(plant['name']),
                              subtitle: Text('₹${plant['price']}'),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Divider(),
                Text(
                  'Total Amount: ₹$totalAmount',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _confirmOrder,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text('Confirm Order'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: _firestore.collection('favorites').doc('user1').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('No items in favorites.'));
          }

          final favoriteItems = List<String>.from(snapshot.data!['plants']);
          if (favoriteItems.isEmpty) {
            return Center(child: Text('No items in favorites.'));
          }

          return ListView.builder(
            itemCount: favoriteItems.length,
            itemBuilder: (context, index) {
              final plantId = favoriteItems[index];
              return FutureBuilder<DocumentSnapshot>(
                future: _firestore.collection('plants').doc(plantId).get(),
                builder: (context, plantSnapshot) {
                  if (!plantSnapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (!plantSnapshot.data!.exists) {
                    // Skip rendering if the plant doesn't exist
                    return SizedBox.shrink();
                  }

                  final plant = plantSnapshot.data!;
                  return Card(
                    child: ListTile(
                      leading: Image.network(
                        plant['imageUrl'],
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                      ),
                      title: Text(plant['name']),
                      subtitle: Text('₹${plant['price']}'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () async {
                          // Remove item from favorites
                          favoriteItems.remove(plantId);
                          await _firestore
                              .collection('favorites')
                              .doc('user1')
                              .update({'plants': favoriteItems});
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Removed from Favorites!')),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'homepage2.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
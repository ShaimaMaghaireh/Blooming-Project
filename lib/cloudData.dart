import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
var db= FirebaseFirestore.instance;
// class Product{
//   final String? name;
//   final int? price;
//   final String? category;
//   final String? description;
//   Product({this.name,this.price,this.category,this.description});

//  static Product fromMap(item)
//   {
//    Product product=Product(
//       name: item['name'],
//       price: item['price'],
//       category: item['category'],
//       description: item['description'],
 
//     );
//     return product;
//   }
// }

class Products{
 String name;
 int price;
 String description;
 List images;
String id;
  Products(this.name,this.price,this.description,this.images,this.id);

 factory Products.fromMap(String id,Map<String,dynamic> map)
  {
    print("Product name:${map['description']}");
    return Products(
     map ['name'],
     map ['price'],
     map ['description'],
     List <String>.from(map['images']),id,
    );
  }
  @override
  
  String toString()
  {
    return 'Products(name:$name,description:$description,price:$price,images:$images)';
  }
}

class Firestore
{
  static Future<List<Products>> getProducts(String collection) async
  {
    try{
      final QuerySnapshot querySnapshot=
      await FirebaseFirestore.instance.collection(collection).get();
      for(var snapshot in querySnapshot.docs)
      {
        var documentID= snapshot.id;
        print("Document ID: $documentID");
      }
      final products = querySnapshot.docs.map((e)=> Products.fromMap(e.id,e.data()as Map<String,dynamic>)).toList();
      print(products);
      return products;
    }
    catch(e)
    {
      print("Error fetching products:$e");
      return[];
    }
  }
}
//  Future<List<Products>> getAllProducts () async
// {
//   return (await FirebaseFirestore.instance.collection('product').get()).docs.map((item)=> 
//   Products.fromMap(item.data())).toList();

// }



class productScreen extends StatefulWidget
{
   @override
  _productScreenState createState() =>  _productScreenState();
}

class _productScreenState extends State<productScreen>
{
  List products= [];
  String searchtext='';
  String categorySearchText = '';
 late Future<List<Products>> productsFuture;

void refreshProduct()
{
  setState(() {
    productsFuture = Firestore.getProducts('product');
  });
}
  // Future<List<Products>> getAllProductsByPrice(price) async
  // {
  //   return (await FirebaseFirestore.instance.collection('product').where('price',isGreaterThanOrEqualTo:price)
  //   .get()).docs.map((item)=> Products.fromMap(item.data())).toList();
  // }
   //late Future<List<Products>> productsFuture = Firestore.getProducts('product');
    @override

    void initState() {
    super.initState();
    // Initially, load all products
    productsFuture = Firestore.getProducts('product');
  }

    Future<List<Products>> searchProducts(String query) async {
    // Search by name
    return (await FirebaseFirestore.instance.collection('product')
      .where('name', isGreaterThanOrEqualTo: query)
      .where('name', isLessThan: query + 'z')
      .get())
      .docs
      .map((item) => Products.fromMap(item.id, item.data() as Map<String, dynamic>))
      .toList();
  }

  Future<List<Products>> getAllProductsByPrice(int price) async {
    // Fetch by price filter
    return (await FirebaseFirestore.instance.collection('product')
      .where('price', isGreaterThanOrEqualTo: price)
      .get())
      .docs
      .map((item) => Products.fromMap(item.id, item.data() as Map<String, dynamic>))
      .toList();
  }

  Future<List<Products>> searchByCategory(String category) async {
  // Search by category
  return (await FirebaseFirestore.instance.collection('product')
    .where('category', isEqualTo: category)  // Filter by category
    .get())
    .docs
    .map((item) => Products.fromMap(item.id, item.data() as Map<String, dynamic>))
    .toList();
}

  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(title:Text('Product Screen')),
      body:
      ListView(
        children: [
          Column(
            children: [
              SizedBox(height: 10,),
              TextFormField(
              decoration: InputDecoration(labelText:'search for items',border: OutlineInputBorder()),
              onChanged: (value) {
                setState(() {
                  searchtext=value;
                });
                
              },),
               TextFormField(
              decoration: InputDecoration(labelText: 'Search by category', border: OutlineInputBorder()),
              onChanged: (value) {
                setState(() {
                  categorySearchText = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Call the search function when the user presses the search button
                if (categorySearchText.isNotEmpty) {
                  searchByCategory(categorySearchText).then((value) {
                    setState(() {
                      products = value;
                    });
                  });
                } else {
                  print('Please enter a category to search');
                }
              },
              child: Text('Search'),
            ),
              ElevatedButton(onPressed:() {
                int price=0;
                try{
                  price=int.parse(searchtext);
                }
                catch(e)
                {
                  print('invalid input');
                  return;
                }
                getAllProductsByPrice(price).then((value)=> setState(() {
                  products=value;
            
                }));
              }, child:Text('search')),
               SizedBox(height: 30,),
              Container(
                width: 500,height: 500,
                child: FutureBuilder<List<Products>>
                (
                  future:productsFuture,
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.waiting)
                    {
                      return Center(child:CircularProgressIndicator());
                    }
                    else if(snapshot.hasError)
                    {
                       return Center(child:Text("error:${snapshot.error}"));
                    }
                    else if(!snapshot.hasData || snapshot.data!.isEmpty)
                    {
                       return Center(child:Text("No product found"));
                    }
                    else 
                    {
                      final products= snapshot.data!;
                      return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
                      (crossAxisCount: 2,childAspectRatio:1/1.2,crossAxisSpacing:16,mainAxisSpacing: 16),
                      itemCount:products.length,
                       itemBuilder: (context,index)
                       {
                        final product = products[index];
                        return Card(
                           semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          margin: EdgeInsets.all(8),
                          child:Column(children: [
                            Expanded
                        (child:Image.network(product.images.isNotEmpty ? product.images[0]:'',
                        fit:BoxFit.fill,width:double.infinity,height:200,)),
                        Padding(padding: const EdgeInsets.all(8),
                        child:Column(children: [Text(product.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)
                        ,),
                        Text("\$ ${product.price}",style: TextStyle(fontSize:14,color:Colors.purple),),
                         IconButton(onPressed: ()
                            {
                              db.collection("product").doc(product.id).delete().
                              then((doc)=> {print("Document deleted"), refreshProduct()},
                             
                              onError:(e) => print("Error updating document $e"));
                            } ,
                             icon:Icon(Icons.delete,color:Colors.red,size:15,)),
                        ],),),
                        ],
                      ),);
                       });
                    
                    }
                  
                  
                },),
              ),
            ],
          ),
        ],
      )
    );
  }
}
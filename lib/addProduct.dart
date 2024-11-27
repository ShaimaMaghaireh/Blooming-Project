import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var db= FirebaseFirestore.instance;
class addProductScreen extends StatefulWidget
{
  @override 
  _addProductScreenState createState() => _addProductScreenState();
}

class _addProductScreenState extends State<addProductScreen>
{
  String _productName='';
  int  _price=1;
  String _description='';
  List _images=[];

  //? create key for the form 
  final GlobalKey<FormState> _formkey= GlobalKey<FormState>();
  @override
   Widget build(BuildContext context)
   {
    return Scaffold(
      appBar: AppBar(title:Text('Add Product'),),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
      children:<Widget> [
       Form(
        key: _formkey,
        child: Column(children:<Widget> [
        TextFormField(decoration: InputDecoration(labelText: 'Product name'),
        onSaved: (newValue)=> {
  
          _productName=newValue!,
        },),
        TextFormField(decoration: InputDecoration(labelText: 'Price'),
        onSaved: (newValue) => {
          _price=int.parse(newValue!),
        }),
        TextFormField(decoration: InputDecoration(labelText: 'Description'),
        onSaved: (newValue) => {
          _description=newValue!,
        }),
         TextFormField(decoration: InputDecoration(labelText: 'Images'),
         onSaved: (newValue) => {
          _images=[newValue!],//? beacuse the image is a list
        }),
          ],)),
          ElevatedButton(onPressed:() 
          {
            if(_formkey.currentState!.validate())
            {
              _formkey.currentState!.save();
              db.collection('product').add({
                'name':_productName,
                'price':_price,
                'images':_images, 
                'description':_description,
              }).then((value) => print("Added data with id:${value.id}"));
            }
          
        }, child: Text('Add Product'))],
      ),),
    );
   }
}
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_with_firebase/main.dart';
import 'package:image_picker/image_picker.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});
  @override
  
  Widget build(BuildContext context)
  {
    return MaterialApp(home: Gallery());
  }
}

class Gallery extends StatefulWidget
{
  const Gallery({super.key});
  @override

  State<Gallery> createState()=> _GalleryState();
}

class _GalleryState extends  State<Gallery>
{
  File? galaryFile;
  final picker= ImagePicker();
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 100),
          child: ListView(children: [
            Container(child:
            galaryFile == null ? Text('No file found') : Image.file(galaryFile!),),
           // Image.file(galaryFile!),
            ElevatedButton(onPressed: ()
            {
              getImageFile(ImageSource.camera);
            },
             child: Text('Camera')),
             ElevatedButton(onPressed: ()
            {
              getImageFile(ImageSource.gallery);
            },
             child: Text('Galary')),
          ],),
        ),
      ),
    );
  }
  Future getImageFile(ImageSource img) async
{
  final choosenFile= await picker.pickImage(source:img);
  XFile? newFile = choosenFile;

  setState(() {
    if(newFile != null)
    {
      galaryFile=File(choosenFile!.path);
    }
    else{
      print('No file found');
    }
  });
}

}


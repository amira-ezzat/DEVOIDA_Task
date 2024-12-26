import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../../core/componant/appBar.dart';
import '../../../core/componant/custom_text.dart';
import '../../../core/utils/app_icons.dart';
import '../../../core/utils/colors.dart';
import '../../modelView/RecipeViewModel.dart';

class RecipeCreateScreen extends StatefulWidget {
  @override
  _RecipeCreateScreenState createState() => _RecipeCreateScreenState();
}

class _RecipeCreateScreenState extends State<RecipeCreateScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  File? _image;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final recipeViewModel = Provider.of<RecipeViewModel>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const CustomApp(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                cursorColor: Colors.grey,
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Recipe Title'),
              ),
              TextField(
                cursorColor: Colors.grey,
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  _image == null
                      ? Text('No image selected.')
                      : Image.file(
                    _image!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  IconButton(
                    icon: const Icon(IconBroken.Camera),
                    onPressed: _pickImage,
                  ),
                ],
              ),
              const SizedBox(height: 44),
              SizedBox(
                height: height * 0.08,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      if (_image != null) {
                        String imageUrl = await recipeViewModel.uploadImage(_image!); // استدعاء uploadImage من RecipeViewModel
                        final recipeData = {
                          'title': _titleController.text,
                          'description': _descriptionController.text,
                          'imageUrl': imageUrl,
                          'likes': 0,
                        };
                        await recipeViewModel.createRecipe(recipeData);
                        Navigator.pop(context); // الرجوع إلى الشاشة السابقة
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please select an image!')),
                        );
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: $e')),
                      );
                    }
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(13),
                    backgroundColor: AppColor.kPrimaryColor1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: CustomText(
                    text: 'Create',
                    colorText: Colors.white,
                    fontSize: width / 20.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
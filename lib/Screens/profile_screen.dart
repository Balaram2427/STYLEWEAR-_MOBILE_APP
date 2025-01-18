import 'package:flutter/material.dart';
//import 'package:file_picker/file_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _empIdController =
      TextEditingController(); // Added employee ID controller
  final _addressController =
      TextEditingController(); // Added address controller
  String? _gender; // Added gender variable
  File? _image; // Re-added _image variable

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _empIdController.dispose(); // Dispose employee ID controller
    _addressController.dispose(); // Dispose address controller
    super.dispose();
  }

  // Future<void> _pickImage() async {
  //  // FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.image,
  //   );
  //   if (result != null) {
  //     setState(() {
  //       _image = File(result.files.single.path!);
  //     });
  //   }
  // }

  void _saveProfile() {
    if (_formKey.currentState!.validate()) {
      // Save profile information
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Profile updated successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Center(
                child: GestureDetector(
                  //onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor:
                        Colors.grey.shade200, // Set background color
                    backgroundImage: _image != null
                        ? FileImage(_image!)
                        : null, // Remove default background image
                    child: _image == null
                        ? Icon(
                            Icons.camera_alt,
                            size: 50,
                            color: Colors.grey,
                          )
                        : null,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Card(
                  color: Colors.green.shade100, // Added green shade color
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    width: 300, // Set a fixed width for the card
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(labelText: 'Name'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(labelText: 'Email'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                .hasMatch(value)) {
                              return 'Please enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _phoneController,
                          decoration: InputDecoration(labelText: 'Phone'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _empIdController,
                          decoration: InputDecoration(labelText: 'Employee ID'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your employee ID';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                          controller: _addressController,
                          decoration: InputDecoration(labelText: 'Address'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your address';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 10),
                        DropdownButtonFormField<String>(
                          value: _gender,
                          decoration: InputDecoration(labelText: 'Gender'),
                          items:
                              ['Male', 'Female', 'Other'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              _gender = newValue;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select your gender';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 300, // Set a fixed width for the button
                  child: ElevatedButton(
                    onPressed: _saveProfile,
                    child: Text('Save Profile'),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 300, // Set a fixed width for the button
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to order history screen
                    },
                    child: Text('View Order History'),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 300, // Set a fixed width for the button
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to saved preferences screen
                    },
                    child: Text('View Saved Preferences'),
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

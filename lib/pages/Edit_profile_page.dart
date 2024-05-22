import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  String _name = 'Bilal Taleb';
  String _phone = '+6281 2211';
  String _email = 'designer.gabut@gmail.com';
  String _address = '';
  String _city = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).iconTheme.color),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Edit Profile', style: TextStyle(color: Theme.of(context).textTheme.headline6!.color)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 40,
                backgroundColor: Theme.of(context).dividerColor,  // Adjust based on your theme
                child: Icon(Icons.person, color: Theme.of(context).iconTheme.color, size: 40),
              ),
              SizedBox(height: 20),
              _buildTextField(_name, 'Name', Icons.person),
              SizedBox(height: 20),
              _buildTextField(_phone, 'Phone', Icons.phone),
              SizedBox(height: 20),
              _buildTextField(_email, 'Email', Icons.email),
              SizedBox(height: 20),
              _buildTextField(_address, 'Address', null),
              SizedBox(height: 20),
              _buildTextField(_city, 'City', null),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle save
                  }
                },
                child: Text('Save'),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).buttonTheme.colorScheme!.background, // Button background
                  onPrimary: Theme.of(context).buttonTheme.colorScheme!.onBackground, // Button text color
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String initialValue, String label, IconData? icon) {
    return TextFormField(
      initialValue: initialValue,
      style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color),
        prefixIcon: icon != null ? Icon(icon, color: Theme.of(context).iconTheme.color) : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Theme.of(context).dividerColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }
}

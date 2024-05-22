import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white, // Use a light background color
        elevation: 0, // Remove shadow for a flat design
        title: Text('Welcome, Bilal', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black), // Notifications icon
            onPressed: () {
              // Handle notification action here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search service',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
              ),
              SizedBox(height: 20),
              Text('All Service', style: Theme.of(context).textTheme.headline6),
              SizedBox(height: 20),
              // Categories Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCategoryIcon(context, "Development", Icons.developer_mode),
                  _buildCategoryIcon(context, "Education", Icons.school),
                ],
              ),
              SizedBox(height: 20),
              // Add more components for top netizens or other categories as needed
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryIcon(BuildContext context, String label, IconData icon) {
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey[800],
          child: Icon(icon, color: Colors.white, size: 30),
        ),
        SizedBox(height: 8),
        Text(label, style: TextStyle(color: Colors.black, fontSize: 16)),
      ],
    );
  }
}

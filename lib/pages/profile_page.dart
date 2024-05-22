import 'package:flutter/material.dart';
import 'package:project_flutter/auth/login_or_register.dart';
import 'package:project_flutter/pages/Edit_profile_page.dart';
import 'package:project_flutter/pages/Online_Status_page.dart';
import 'package:project_flutter/pages/settings_page.dart';
import 'package:project_flutter/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Text(
          "Profile",
          style: TextStyle(color: themeProvider.isDarkMode ? Colors.white : Colors.black),
        ),
        backgroundColor: themeProvider.isDarkMode ? Colors.grey[900] : Colors.white,
        elevation: 1,
      ),
      backgroundColor: themeProvider.isDarkMode ? Colors.black : Colors.white,
      body: ListView(
        children: <Widget>[
          profileHeader(context),
          optionTile(context, Icons.edit, "Edit Profile", () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage()));
          }),
          optionTile(context, Icons.settings, "Settings", () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
          }),
          optionTile(context, Icons.toggle_on, "Online Status", () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => OnlineStatusPage()));
          }),
          optionTile(context, Icons.payment, "Payments", () {}),
          optionTile(context, Icons.storefront, "Become a Seller", () {}),
          logoutButton(context),
        ],
      ),
    );
  }

  Widget profileHeader(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'), // Replace with actual image URL
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                    "Bilal Taleb",
                    style: TextStyle(
                        color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    )
                ),
                Text(
                    "154 Overall Jobs",
                    style: TextStyle(
                        color: themeProvider.isDarkMode ? Colors.grey[300] : Colors.grey[700],
                        fontSize: 14
                    )
                ),
                Text(
                    "Personal Balance 200",
                    style: TextStyle(
                        color: themeProvider.isDarkMode ? Colors.grey[300] : Colors.grey[700],
                        fontSize: 14
                    )
                ),
              ],
            ),
          ),
          Icon(Icons.settings, color: themeProvider.isDarkMode ? Colors.white : Colors.black),
        ],
      ),
    );
  }

  Widget optionTile(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return ListTile(
      leading: Icon(icon, color: themeProvider.isDarkMode ? Colors.white : Colors.black),
      title: Text(title, style: TextStyle(color: themeProvider.isDarkMode ? Colors.white : Colors.black)),
      trailing: Icon(Icons.chevron_right, color: themeProvider.isDarkMode ? Colors.white : Colors.black),
      onTap: onTap,
    );
  }

  Widget logoutButton(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: ElevatedButton.icon(
        icon: Icon(Icons.exit_to_app, color: Colors.white),  // The icon before the text
        label: Text('Log Out'),
        style: ElevatedButton.styleFrom(
            primary: Colors.red,  // Button color
            onPrimary: Colors.white,  // Text and icon color
            minimumSize: Size(double.infinity, 50)  // Full-width button
        ),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginOrRegister(),
              ),
                  (route) => false);
        },
      ),
    );
  }

}


class PaymentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payments")),
      body: Center(child: Text("Payments Page")),
    );
  }
}

class SellerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Become a Seller")),
      body: Center(child: Text("Become a Seller Page")),
    );
  }
}

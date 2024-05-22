import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/my_app_bar.dart';
import '../theme/theme_provider.dart';

class OnlineStatusPage extends StatelessWidget {
  const OnlineStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const MyAppBar(
        title: "Online Status",
        actions: [],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.only(left: 25, top: 10, right: 25),
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text(
                      "Online Status",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),


                    CupertinoSwitch(
                      value: true, // or false
                      onChanged: (_) {}, // Empty function block
                      activeColor: Colors.grey[300],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

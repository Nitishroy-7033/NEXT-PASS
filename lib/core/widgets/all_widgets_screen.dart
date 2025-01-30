import 'package:flutter/material.dart';
import 'package:next_pass/core/constants/app_assets.dart';
import 'package:next_pass/core/widgets/primary_button.dart';

class AllWidgetsScreen extends StatelessWidget {
  const AllWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Widgets Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontFamily: "Montserrat",
                ),
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontFamily: "Montserrat",
                  ),
                  hintText: 'Enter your name',
                  suffixIcon: Icon(
                    Icons.done,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                ),
              ),
              SizedBox(height: 20),
              PrimaryButton(
                text: 'Button',
                onPressed: () {},
                icon: IconsAssets.searchIcon,
              )
            ],
          ),
        ));
  }
}

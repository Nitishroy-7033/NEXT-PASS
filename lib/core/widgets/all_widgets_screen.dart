import 'package:flutter/material.dart';
import 'package:next_pass/core/constants/app_assets.dart';
import 'package:next_pass/core/widgets/primary_button.dart';
import 'package:next_pass/core/widgets/primary_icon_button.dart';
import 'package:next_pass/core/widgets/primary_outline_icon_button.dart';
import 'package:next_pass/core/widgets/secondary_button.dart';

class AllWidgetsScreen extends StatelessWidget {
  const AllWidgetsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('All Widgets Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Enter name",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextFormField(
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontFamily: "Montserrat",
                ),
                decoration: InputDecoration(
                  hintStyle: const TextStyle(
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
                  prefixIcon: const Icon(Icons.person),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your name',
                ),
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                text: 'Button With icon',
                onPressed: () {},
                icon: IconsAssets.searchIcon,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                color: Theme.of(context).colorScheme.surface,
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                text: 'Button without icon',
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PrimaryIconButton(
                    onPressed: () {},
                    icon: IconsAssets.searchIcon,
                  ),
                  PrimaryIconButton(
                    onPressed: () {},
                    icon: IconsAssets.searchIcon,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  PrimaryOutlineIconButton(
                    onPressed: () {},
                    icon: IconsAssets.searchIcon,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              SecondaryButton(
                text: 'Outline With icon',
                onPressed: () {},
                icon: IconsAssets.searchIcon,
              ),
            ],
          ),
        ));
  }
}

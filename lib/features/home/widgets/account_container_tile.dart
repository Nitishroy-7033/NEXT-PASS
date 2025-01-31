import 'package:flutter/material.dart';

class AccountContainerTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subTitle;
  final VoidCallback ontap;
  const AccountContainerTile(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.subTitle,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      clipBehavior: Clip.hardEdge,
      color: Theme.of(context).colorScheme.primaryContainer,
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        subtitle: Text(
          subTitle,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        leading: SizedBox(
          height: 35,
          width: 35,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 20,
          color: Theme.of(context).colorScheme.tertiary,
        ),
        onTap: ontap,
        splashColor: Theme.of(context).colorScheme.secondaryContainer,
        
      ),
    );
  }
}

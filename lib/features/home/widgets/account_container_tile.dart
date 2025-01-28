import 'package:flutter/material.dart';
import 'package:next_pass/res/font_res.dart';

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
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontFamily: FontRes.MONTSERRAT_SEMIBOLD,
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          subTitle,
          style: TextStyle(
            fontFamily: FontRes.MONTSERRAT_REGULAR,
            fontSize: 14,
            color: Theme.of(context).colorScheme.tertiary,
          ),
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
        minTileHeight: 70,
      ),
    );
  }
}

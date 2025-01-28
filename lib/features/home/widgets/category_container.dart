import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:next_pass/res/font_res.dart';

class CategoryContainer extends StatelessWidget {
  final String icon;
  final String title;
  final String count;
  const CategoryContainer(
      {super.key,
      required this.icon,
      required this.title,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 25,
            width: 25,
            child: SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: const TextStyle(
              fontFamily: FontRes.MONTSERRAT_SEMIBOLD,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "$count Password",
            style: TextStyle(
              fontFamily: FontRes.MONTSERRAT_REGULAR,
              color: Theme.of(context).colorScheme.tertiary,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

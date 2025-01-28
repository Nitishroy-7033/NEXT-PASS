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
    return
        // Container(
        //   height: 100,
        //   width: 100,
        //   decoration: BoxDecoration(
        //     color: Theme.of(context).colorScheme.primaryContainer,
        //     borderRadius: BorderRadius.circular(10),
        //   ),
        //   child:
        SizedBox(
      height: 100,
      width: 100,
      child: Card(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: SvgPicture.asset(
                icon,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.tertiary,
                  BlendMode.srcIn,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(
                fontFamily: FontRes.MONTSERRAT_SEMIBOLD,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "${count} Password",
              style: TextStyle(
                fontFamily: FontRes.MONTSERRAT_REGULAR,
                color: Theme.of(context).colorScheme.tertiary,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
    // );
  }
}

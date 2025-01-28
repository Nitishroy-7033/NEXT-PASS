import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:next_pass/core/constants/app_assets.dart';
import 'package:next_pass/res/assets_res.dart';
import 'package:next_pass/res/font_res.dart';

// class CustomTextField extends StatelessWidget {
//   final String hintText;
//   final TextEditingController controller;

//   const CustomTextField({required this.hintText, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       autofocus: false,
//       decoration: InputDecoration(
//         // isDense: true,
//         // contentPadding: const EdgeInsets.only(bottom: 5, right: 5),
//         constraints: const BoxConstraints(
//           maxHeight: 40,
//         ),
//         hintText: "enter your full name",
//         hintStyle: TextStyle(
//           color: Theme.of(context).colorScheme.tertiary,
//           fontSize: 13,
//           fontWeight: FontWeight.w400,
//           fontFamily: FontRes.MONTSERRAT_SEMIBOLD,
//         ),
//         prefixIcon: SvgPicture.asset(
//           AssetsRes.PERSON_PROFILE,
//           colorFilter: ColorFilter.mode(
//             Theme.of(context).colorScheme.tertiary,
//             BlendMode.srcIn,
//           ),
//         ),
//         suffixIcon: SvgPicture.asset(IconsAssets.mailIcon),

//         fillColor: Theme.of(context).colorScheme.primaryContainer,
//         filled: true,
//         enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide(
//               color: Theme.of(context).colorScheme.primaryContainer,
//             )),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(10),
//           borderSide: BorderSide(
//             color: Theme.of(context).colorScheme.primary,
//           ),
//         ),
//       ),
//       maxLines: 1,
//       cursorColor: Theme.of(context).colorScheme.onPrimary,
//       cursorWidth: 1.5,
//       style: TextStyle(
//         color: Theme.of(context).colorScheme.onPrimary,
//         fontFamily: FontRes.MONTSERRAT_REGULAR,
//         fontSize: 16,
//       ),
//     );
//   }
// }

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      height: 20,
      width: 20,
      child: SvgPicture.asset(IconsAssets.browserIcon),
    );
  }
}

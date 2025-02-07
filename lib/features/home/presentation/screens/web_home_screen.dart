import 'package:flutter/material.dart';
import 'package:next_pass/core/constants/app_assets.dart';
import 'package:next_pass/features/home/presentation/widgets/account_container_tile.dart';
import 'package:next_pass/features/home/presentation/widgets/category_container.dart';

class WebHomeScreen extends StatelessWidget {
  const WebHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Category',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              CategoryContainer(
                icon: IconsAssets.mobileIcon,
                title: "Mobile",
                count: "12",
                onTap: () {},
              ),
              CategoryContainer(
                icon: IconsAssets.browserIcon,
                title: "Browser",
                count: "18",
                onTap: () {},
              ),
              CategoryContainer(
                icon: IconsAssets.paymentCardIcon,
                title: "Payment",
                count: "02",
                onTap: () {},
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Latest Account',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          // Column(
          //   children: [
          //     AccountContainerTile(
          //       title: "Spotify",
          //       subTitle: "rosepoole@email.com",
          //       imageUrl: IconsAssets.spotifyLogoUrl,
          //       ontap: () {},
          //     ),
          //     AccountContainerTile(
          //       title: "Netflix",
          //       subTitle: "rosepoole@email.com",
          //       imageUrl: IconsAssets.netflixLogoUrl,
          //       ontap: () {},
          //     ),
          //     AccountContainerTile(
          //       title: "Instagram",
          //       subTitle: "rosepoole@email.com",
          //       imageUrl: IconsAssets.instagramLogoUrl,
          //       ontap: () {},
          //     ),
          //     AccountContainerTile(
          //       title: "Slack",
          //       subTitle: "rosepoole@email.com",
          //       imageUrl: IconsAssets.slackLogoUrl,
          //       ontap: () {},
          //     ),
          //     AccountContainerTile(
          //       title: "Discord",
          //       subTitle: "rosepoole@email.com",
          //       imageUrl: IconsAssets.discordLogoUrl,
          //       ontap: () {},
          //     ),
          //     AccountContainerTile(
          //       title: "GitHub",
          //       subTitle: "rosepoole@email.com",
          //       imageUrl: IconsAssets.githubLogoUrl,
          //       ontap: () {},
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

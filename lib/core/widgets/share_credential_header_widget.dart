import '../constants/app_linker.dart';

class ShareCredentialHeaderWidget extends StatelessWidget {
  const ShareCredentialHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
              AppStrings.crediantialShare,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 34,
                      width: 34,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.blueColor,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'vikashverma@gmail.com',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Image.asset(
                  AppImageAssets.deleteIcon,
                  height: 16,
                  width: 16,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 34,
                      width: 34,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.blueColor,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Nitishr833@gmail.com',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                Image.asset(
                  AppImageAssets.deleteIcon,
                  height: 16,
                  width: 16,
                ),
              ],
            ),
      ],
    );
  }
}
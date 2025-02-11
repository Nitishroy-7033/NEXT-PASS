

import '../../../../core/constants/app_linker.dart';

class CategoryContainer extends StatelessWidget {
  final String icon;
  final String title;
  final String count;
  final VoidCallback onTap;
  const CategoryContainer(
      {super.key,
      required this.icon,
      required this.title,
      required this.count,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      color: Theme.of(context).colorScheme.primaryContainer,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        splashColor: Theme.of(context).colorScheme.secondaryContainer,
        child: SizedBox(
          height: 100,
          width: 100,
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
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "$count Password",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:next_pass/core/constants/app_linker.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 90.h),
            Container(
                height: 92.w,
                width: 92.w,
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: SvgPicture.asset(IconsAssets.personProfileIcon,
                    colorFilter: ColorFilter.mode(
                        Theme.of(context).colorScheme.onPrimaryContainer,
                        BlendMode.srcIn))),
            SizedBox(height: 20.h),
            Text(
              "Login or Sign Up",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 10.h),
            Text(
              "We need some details to create your account\nand use our system.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(height: 25.h),
            Container(
              height: 53.h,
              padding: EdgeInsets.all(2.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
              child: Row(
                children: [
                  _buildToggleButton("LOGIN", 0),
                  _buildToggleButton("SIGNUP", 1),
                ],
              ),
            ),
            SizedBox(height: 25.h),
            // Login / Signup Forms
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.all(15.w),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: selectedIndex == 0
                  ? MobileLoginScreen()
                  : MobileSignUpScreen(),
            ),
            SizedBox(height: 20.h),
            // Footer
            InkWell(
              onTap: () {},
              child: Text(
                "@NextPass",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(String title, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedIndex = index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: selectedIndex == index
                ? Theme.of(context).colorScheme.primary
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20.r),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: selectedIndex == index
                  ? Theme.of(context).colorScheme.onPrimaryContainer
                  : Theme.of(context).colorScheme.onSecondaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

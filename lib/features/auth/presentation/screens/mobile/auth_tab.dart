// import 'package:flutter/material.dart';

// class AuthScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 24),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CircleAvatar(
//                 radius: 32,
//                 backgroundColor: Colors.redAccent,
//                 child: Icon(Icons.person, size: 32, color: Colors.white),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 "Login or Sign Up Today",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 "Discover new connections and meaningful relationships with our dating app",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 14, color: Colors.grey),
//               ),
//               SizedBox(height: 20),
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     color: Theme.of(context).colorScheme.primaryContainer,
//                     borderRadius: BorderRadius.circular(20)),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         height: 50,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             color: Colors.grey),
//                         child: TabBar(
//                           labelColor: Colors.black,
//                           dividerColor: Colors.black,
//                           // indicator: BoxDecoration(
//                           //   color: Colors.white
//                           // ),
//                           tabs: [
//                             Tab(
//                               text: 'Login',
//                             ),
//                             Tab(
//                               text: "SignUp",
//                             )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               // Expanded(
//               //   child: TabBarView(
//               //     children: [
//               //       MobileLoginScreen(),
//               //       MobileSignUpScreen(),
//               //     ],
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';

// class AuthScreen extends StatefulWidget {
//   @override
//   _AuthScreenState createState() => _AuthScreenState();
// }

// class _AuthScreenState extends State<AuthScreen> {
//   int selectedIndex = 0; // 0 = Login, 1 = SignUp

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 24),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 32,
//               backgroundColor: Colors.redAccent,
//               child: Icon(Icons.person, size: 32, color: Colors.white),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Login or Sign Up Today",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 5),
//             Text(
//               "Discover new connections and meaningful relationships with our dating app",
//               textAlign: TextAlign.center,
//               style: TextStyle(fontSize: 14, color: Colors.grey),
//             ),
//             SizedBox(height: 20),
//             // Custom Tab Switcher
//             Container(
//               padding: EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: Theme.of(context).colorScheme.primaryContainer,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(
//                     height: 50,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: Colors.grey[300], // Background color for tab container
//                     ),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 selectedIndex = 0;
//                               });
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: selectedIndex == 0 ? Colors.white : Colors.transparent,
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               alignment: Alignment.center,
//                               child: Text(
//                                 'Login',
//                                 style: TextStyle(
//                                   color: selectedIndex == 0 ? Colors.black : Colors.grey,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 selectedIndex = 1;
//                               });
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: selectedIndex == 1 ? Colors.white : Colors.transparent,
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                               alignment: Alignment.center,
//                               child: Text(
//                                 'SignUp',
//                                 style: TextStyle(
//                                   color: selectedIndex == 1 ? Colors.black : Colors.grey,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   selectedIndex == 0
//                       ? Center(child: Text("Login Form", style: TextStyle(fontSize: 18)))
//                       : Center(child: Text("SignUp Form", style: TextStyle(fontSize: 18))),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:next_pass/core/constants/app_assets.dart';
import 'package:next_pass/features/auth/presentation/screens/mobile/mobile_login_screen.dart';
import 'package:next_pass/features/auth/presentation/screens/mobile/mobile_sign_up_Screen.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Image.asset(AppImageAssets.appLogo,height: 100,),
            SizedBox(height: 30),
            Text(
              "Login or Sign Up Today",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 25),
            Text(
              "Discover new connections and meaningful relationships with our dating app",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey[300],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = 0;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: selectedIndex == 0 ? Colors.white : Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: selectedIndex == 0 ? Colors.black : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = 1;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: selectedIndex == 1 ? Colors.white : Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'SignUp',
                                style: TextStyle(
                                  color: selectedIndex == 1 ? Colors.black : Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  selectedIndex == 0 ? MobileLoginScreen() : MobileSignUpScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


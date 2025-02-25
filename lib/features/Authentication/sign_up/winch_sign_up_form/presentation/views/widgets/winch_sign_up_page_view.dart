// import 'package:flutter/material.dart';

// import 'winch_sign_up_form.dart';
// import 'winch_sign_up_form2.dart';


// class WinchSignUpPageView extends StatelessWidget {
//   const WinchSignUpPageView({
//     super.key,
//     required PageController pageController,
//   }) : _pageController = pageController;

//   final PageController _pageController;

//   @override
//   Widget build(BuildContext context) {
//     return PageView(
//       physics: const NeverScrollableScrollPhysics(),
//       controller: _pageController,
//       children: [
//         SingleChildScrollView(child: WinchSignUpForm(
//           onNext: () {
//             _pageController.nextPage(
//               duration: const Duration(milliseconds: 1),
//               curve: Curves.easeInOut,
//             );
//           },
//         )),
//         const SingleChildScrollView(child: WinchSignUpForm2()),
//       ],
//     );
//   }
// }
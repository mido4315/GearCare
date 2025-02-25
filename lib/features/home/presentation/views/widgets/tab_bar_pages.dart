// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gear_care/core/utils/service_locator.dart';
// import 'package:gear_care/features/favourite_page/presentation/views/favourite_page.dart';
// import 'package:gear_care/features/chats_page/presentation/views/chats_page.dart';
// import 'package:gear_care/features/home_page/data/repos/home_repo_impl.dart';
// import 'package:gear_care/features/home_page/presentation/view%20model/home_view_cubit/home_view_cubit.dart';
// import 'package:gear_care/features/shop_page/presentation/view%20model/shop_cubit/shop_cubit.dart';
// import 'package:gear_care/features/shop_page/presentation/views/shoping_page.dart';
// import 'package:gear_care/features/home_page/presentation/views/home_view.dart';
//
// import '../../../../../core/utils/api_service.dart';
// import '../../../../shop_page/data/shop_repo_impl.dart';
//
// class TabBarBages extends StatelessWidget {
//   const TabBarBages({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return TabBarView(
//       children: [
//         BlocProvider(
//           create: (context) => HomeViewCubit(
//             HomeRepoImpl(
//               getIt.get<APIService>(),
//             ),
//           ),
//           child: const Homepage(),
//         ),
//         BlocProvider(
//           create: (context) => ShopCubit(
//             ShopRepoImpl(
//               getIt.get<APIService>(),
//             ),
//           )..getProducts(),
//           child: const ShoppingPage(),
//         ),
//         const FavouritePage(),
//         const ChatsPage(),
//       ],
//     );
//   }
// }
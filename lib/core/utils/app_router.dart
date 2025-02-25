import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gear_care/core/utils/shared_preferences.dart';
import 'package:gear_care/features/Authentication/sign_up/maintenance_sign_up_page/presentation/views/view%20model/complete_service_provider_cubit_cubit/complete_service_provider_data_cubit.dart';
import 'package:gear_care/features/Authentication/sign_up/marchant_sign_up/presentation/view%20model/complete_merchant_data_cubit/complete_merchant_data_cubit.dart';
import 'package:gear_care/features/Authentication/sign_up/marchant_sign_up/presentation/views/widgets/marchant_sign_up_form2.dart';
import 'package:gear_care/features/Authentication/sign_up/winch_sign_up_form/presentation/view%20model/complete_winch_data_cubit/complete_winch_data_cubit.dart';
import 'package:gear_care/features/Authentication/sign_up/winch_sign_up_form/presentation/views/widgets/winch_sign_up_form2.dart';
import 'package:gear_care/features/Search/presentation/view/search_view.dart';
import 'package:gear_care/features/chat_page/presentation/views/chat_page.dart';
import 'package:gear_care/features/home/presentation/views/home.dart';
import 'package:gear_care/features/identify_service/presentation/views/widgets/identify_service_page.dart';
import 'package:gear_care/features/my_profile_page/presentation/view/my_profile_page.dart';
import 'package:gear_care/features/my_profile_page/presentation/view/widgets/edit_profile_pageview.dart';
import 'package:gear_care/features/order/data/order_repo_impl.dart';
import 'package:gear_care/features/order/presentation/view%20model/order_cubit.dart';
import 'package:gear_care/features/profile_page/presentation/view/profile_page.dart';
import 'package:gear_care/features/shop_page/data/shop_repo_impl.dart';
import 'package:gear_care/features/shop_page/presentation/view%20model/shop_cubit/shop_cubit.dart';
import 'package:gear_care/features/shop_page/product_page.dart';

import 'package:gear_care/features/splash_view/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/Authentication/data/repos/auth_repo/auth_repo_impl.dart';
import '../../features/Authentication/data/repos/complete_data_rep/complete_data_repo_impl.dart';
import '../../features/Authentication/sign_in_page/presentation/view model/login cubit/login_cubit.dart';
import '../../features/Authentication/sign_in_page/presentation/views/widgets/sign_in_page.dart';
import '../../features/Authentication/sign_in_page/presentation/views/widgets/widgets/forget_password_page.dart';

import '../../features/Authentication/sign_up/customer_sign_up_page/presentation/view model/register cubit/register_cubit.dart';
import '../../features/Authentication/sign_up/customer_sign_up_page/presentation/views/customer_sign_up_page.dart';
import '../../features/Authentication/sign_up/maintenance_sign_up_page/presentation/views/widgets/maint_sign_up_form2.dart';
import '../../features/favourite_page/data/cart_repo/cart_repo_impl.dart';
import '../../features/favourite_page/presentation/view_model/remove_product_cubit/remove_product_cubit.dart';
import '../../features/home_page/presentation/views/widgets/map_view.dart';
import '../../features/merchant/merchant_bottom_nav_bar/presentation/views/merchant_bottom_nav_bar_view.dart';
import '../../features/merchant/posts/data/repos/posts_repo_impl.dart';
import '../../features/merchant/posts/presentation/view model/add new product cubit/add_new_product_cubit.dart';
import '../../features/merchant/posts/presentation/view model/posts cubit/posts_cubit.dart';
import '../../features/merchant/posts/presentation/views/add_new_product.dart';
import '../../features/order/presentation/views/order_view.dart';
import '../../features/service_providers/service_provider_bottom_nav_bar/presentation/views/service_provider_bottom_nav_bar_view.dart';
import '../../features/shop_page/presentation/views/shoping_page.dart';
import '../../features/winch/winch_bottom_nav_bar/presentation/views/winch_bottom_nav_bar_view.dart';
import '../../features/winch/winch_edit_profile/presentation/views/winch_edit_profile_view.dart';
import 'api_service.dart';
import 'service_locator.dart';

abstract class AppRouter {
  static const kSignIn = '/SignIn';
  static const kForgetPassword = '/forgetPassword';
  static const kCustSignUp = '/CustSignUp';
  static const kCustSignUpForm2 = '/MaintSignUpForm2';
  static const kMaintSignUp = '/MaintSignUp';
  static const kWinchSignUp = '/WinchSignUpForm2';
  static const kMarchantSignUp = '/MarchantSignUppage';
  static const kIdentifyService = '/IdentifyService';
  static const kSearchView = '/searchview';
  static const kMyProfileView = '/myprofileView';
  static const kEditProfileView = '/editProfileView';
  static const kOthersProfile = '/ProfilePage';
  static const kChatPage = '/chatpage';
  static const kProductPage = '/productPage';
  static const kwinchform2 = '/winchForm2';
  static const kMarchantForm2 = '/MarchantForm2';
  static const kMaintForm2 = '/MaintantForm2';
  static const kCreateOrderView = '/CreateOrderView';
  static const kAddNewProduct = '/AddNewProduct';

  static const kHomeView = '/Home';
  static const kWinchEditProfileView = '/WinchEditProfileView';
  static const kMerchantBottomNavBarView = '/MerchantBottomNavBarView';
  static const kServiceProvidersBottomNavBarView = '/ServiceProvidersBottomNavBarView';
  static const kWinchBottomNavBarView = '/WinchBottomNavBarView';

  static final router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          // builder: (context, state) => const MerchantBottomNavBarView(),
          // builder: (context, state) => MultiBlocProvider(
          //   providers: [
          //     BlocProvider(
          //       create: (context) => ShopCubit(
          //         ShopRepoImpl(
          //           getIt.get<APIService>(),
          //         ),
          //       )..getProducts(),
          //     ),
          //     BlocProvider(
          //       create: (context) => RemoveProductCubit(
          //         CartRepoImpl(
          //           getIt.get<APIService>(),
          //         ),
          //       ),
          //     ),
          //   ],
          //   child: const HomeView(),
          // ),

          // builder: (context, state) {
          //   return MultiBlocProvider(
          //     providers: [
          //       BlocProvider(
          //         create: (context) =>
          //             PostsCubit(PostsRepoImpl(getIt.get<APIService>()))
          //               ..getProducts(),
          //       ),
          //     ],
          //     child: const MerchantBottomNavBarView(),
          //   );
          // },

          builder: (context, state) {
             // return const MapPage(
             //   locations: [
             //     "Santa Clara County, California, United States",
             //   ],
             // );

            String? token = getIt.get<SharedPrefs>().getData(key: 'token');
            if (token != null) {
              String userType =
              getIt.get<SharedPrefs>().getData(key: 'userType');
              print(userType);
              if (userType == 'Client') {
                return MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => ShopCubit(
                          ShopRepoImpl(
                            getIt.get<APIService>(),
                          ),
                        )..getProducts(),
                      ),
                      BlocProvider(
                        create: (context) => RemoveProductCubit(
                          CartRepoImpl(
                            getIt.get<APIService>(),
                          ),
                        ),
                      ),
                    ],
                    child: const HomeView(),
                );
              } else if (userType == 'WinchDriver') {
                return const WinchBottomNavBarView();
              } else if (userType == 'Seller') {
                return MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) =>
                      PostsCubit(PostsRepoImpl(getIt.get<APIService>()))
                        ..getProducts(),
                    ),
                  ],
                  child: const MerchantBottomNavBarView(),
                );
              } else {
                return const ServiceProvidersBottomNavBarView();
              }
            }
            return const SplashView();
          }

      ),
      GoRoute(
        path: kServiceProvidersBottomNavBarView,
        builder: (context, state) => const ServiceProvidersBottomNavBarView(),
      ),
      GoRoute(
        path: kWinchBottomNavBarView,
        builder: (context, state) => const WinchBottomNavBarView(),
      ),

      //   builder: (context, state) => BlocProvider(
      //     create: (context) => CompleteServiceProviderDataCubit(
      //       getIt.get<CompleteDataRepoImpl>(),
      //     ),
      //     child: MaintSignUpForm2(),
      //   ),
      // ),


      GoRoute(
        path: kMerchantBottomNavBarView,
        builder: (context, state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                PostsCubit(PostsRepoImpl(getIt.get<APIService>()))
                  ..getProducts(),
              ),
            ],
            child: const MerchantBottomNavBarView(),
          );
        },
      ),
      GoRoute(
        path: '/SignIn',
        builder: (context, state) =>
            BlocProvider(
              create: (context) =>
                  LoginCubit(
                    getIt.get<AuthRepoImpl>(),
                  ),
              child: const SignInPage(),
            ),
      ),
      GoRoute(
        path: '/forgetPassword',
        builder: (context, state) => const ForgetPasswordPage(),
      ),
      GoRoute(
        path: '/CustSignUp',
        builder: (context, state) =>
            BlocProvider(
              create: (context) =>
                  RegisterCubit(
                    getIt.get<AuthRepoImpl>(),
                  ),
              child: CustSignUpPage(
                userType: state.extra.toString(),
              ),
            ),
      ),
      GoRoute(
        path: '/MaintSignUpForm2',
        builder: (context, state) => const MaintSignUpForm2(),
      ),
      GoRoute(
        path: '/identifyService',
        builder: (context, state) => const IdentifyService(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) =>
            MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                  ShopCubit(
                    ShopRepoImpl(
                      getIt.get<APIService>(),
                    ),
                  )
                    ..getProducts(),
                ),
                BlocProvider(
                  create: (context) =>
                      RemoveProductCubit(
                        CartRepoImpl(
                          getIt.get<APIService>(),
                        ),
                      ),
                ),
              ],
              child: const HomeView(),
            ),
      ),
      GoRoute(
        path: '/searchview',
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kMyProfileView,
        builder: (context, state) => const MyProfileView(),
      ),
      GoRoute(
        path: kEditProfileView,
        builder: (context, state) => const EditProfilePage(),
      ),
      GoRoute(
        path: kWinchEditProfileView,
        builder: (context, state) => const WinchEditProfileView(),
      ),
      GoRoute(
        path: kOthersProfile,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return ProfilePage(
            name: data['name'],
            number: data['number'],
            email: data['email'],
            location: data['location'],
            photoId: data['photoId'],
            rate: data['rate'],
            specialization: List<String>.from(data['specialization']),
            carTypeToRepair: data['carTypeToRepair'],
            available: data['available'],
            userType: data['userType'],
            initialLocation: data['initialLocation'],
            initialCarType: data['initialCarType'],
            id: data['id'],
          );
        },
      ),
      GoRoute(
        path: '/chatpage',
        builder: (context, state) => const ChatPage(),
      ),
      GoRoute(
        path: kProductPage,
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return BlocProvider(
            create: (context) =>
                ShopCubit(ShopRepoImpl(getIt.get<APIService>())),
            child: ProductPage(
              id: data['id'],
              name: data['name'],
              pictureURL: List<String>.from(data['pictureURL']),
              price: data['price'],
              newPrice: data['newPrice'],
              description: data['description'],
              instock: data['instock'],
              deleted: data['deleted'],
              sellerId: data['sellerId'],
              categoryid: data['categoryid'],
              seller: data['seller'],
              discount: data['discount'],
              categorys: data['categorys'],
              photos: data['photos'],
              productShoppingcart: data['productShoppingcart'],
            ),
          );
        },
      ),
      GoRoute(
        path: '/winchForm2',
        builder: (context, state) =>
            BlocProvider(
              create: (context) =>
                  CompleteWinchDataCubit(
                    getIt.get<CompleteDataRepoImpl>(),
                  ),
              child: const WinchSignUpForm2(),
            ),
      ),
      GoRoute(
        path: '/MarchantForm2',
        builder: (context, state) =>
            BlocProvider(
              create: (context) =>
                  CompleteMerchantDataCubit(
                    getIt.get<CompleteDataRepoImpl>(),
                  ),
              child: const MarchantSignUpForm2(),
            ),
      ),
      GoRoute(
        path: '/MaintantForm2',
        builder: (context, state) =>
            BlocProvider(
              create: (context) =>
                  CompleteServiceProviderDataCubit(
                    getIt.get<CompleteDataRepoImpl>(),
                  ),
              child: const MaintSignUpForm2(),
            ),
      ),
      GoRoute(
          path: kCreateOrderView,
          builder: (context, state) {
            final data = state.extra as Map<String, dynamic>;
            return BlocProvider(
              create: (context) =>
                  OrderCubit(OrderRepoImpl(getIt.get<APIService>())),
              child: CreateOrder(
                initialLocation: data["initialLocation"],
                initialCarType: data["initialCarType"],
                serviceProviderId: data["serviceProviderId"],
                userType: data["userType"],
              ),
            );
          }),
      GoRoute(
        path: kAddNewProduct,
        builder: (context, state) =>
            MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) =>
                      AddNewProductCubit(
                        PostsRepoImpl(getIt.get<APIService>()),
                      ),
                ),
                // BlocProvider(
                //   create: (context) => PostsCubit(
                //     PostsRepoImpl(getIt.get<APIService>()),
                //   ),
                // ),
              ],
              child: const AddNewProduct(),
            ),
      ),
    ],
  );
}
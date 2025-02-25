import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gear_care/core/utils/app_router.dart';

import 'core/constants/app_colors.dart';
import 'core/utils/service_locator.dart';
import 'core/utils/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  await getIt.get<SharedPrefs>().init();
  // getIt.get<SharedPrefs>().setData(
  //     key: 'token',
  //     value:
  //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJzYXllZGRkQGdtYWlsLmNvbSIsImp0aSI6ImNkODRjZDA5LWVkMzMtNDNlNy04NDVlLThiYzM2NjlmYmMzNSIsImVtYWlsIjoic2F5ZWRkZEBnbWFpbC5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6Ijg0NzY4ZGU3LTFkNzktNDE0OS1hMmIzLTg1ZmE1N2FmODI2OSIsInJvbGVzIjoiTWVjaGFuaWMiLCJleHAiOjE3MjEzMDA4MDAsImlzcyI6IkdlYXJDYXJlQXBpIiwiYXVkIjoiU2VjdXJlQXBpVXNlciJ9.CYLhynE_mr7aWPN1KHGeV_WQVNMNMOvFLHnN0ZwVxT8',
  //   //  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtdXN0YWZhLjIwMzc1Njk1QGNvbXBpdC5hdW4uZWR1LmVnIiwianRpIjoiN2E0MzVkMzQtMTQ1Yi00NTBmLTgyZGQtN2YxNTQxMjg5Y2Y5IiwiZW1haWwiOiJtdXN0YWZhLjIwMzc1Njk1QGNvbXBpdC5hdW4uZWR1LmVnIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiIyMTk4ODNhZC05ZjA5LTQ5ZTgtYTk4OS02YTRlZjllZmU5YTciLCJyb2xlcyI6IkNsaWVudCIsImV4cCI6MTcyMTMwMDQxNywiaXNzIjoiR2VhckNhcmVBcGkiLCJhdWQiOiJTZWN1cmVBcGlVc2VyIn0._f6C9WDHDsl5Fj12iaLRN7EX__DLuPurwX8b7DtWISk'
  //     //  'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJtdXN0YWZhLjIwMzc1Njk1QGNvbXBpdC5hdW4uZWR1LmVnIiwianRpIjoiN2E0MzVkMzQtMTQ1Yi00NTBmLTgyZGQtN2YxNTQxMjg5Y2Y5IiwiZW1haWwiOiJtdXN0YWZhLjIwMzc1Njk1QGNvbXBpdC5hdW4uZWR1LmVnIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiIyMTk4ODNhZC05ZjA5LTQ5ZTgtYTk4OS02YTRlZjllZmU5YTciLCJyb2xlcyI6IkNsaWVudCIsImV4cCI6MTcyMTMwMDQxNywiaXNzIjoiR2VhckNhcmVBcGkiLCJhdWQiOiJTZWN1cmVBcGlVc2VyIn0._f6C9WDHDsl5Fj12iaLRN7EX__DLuPurwX8b7DtWISk',
  //    //'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJPbWFyQDEyMzQ1Njc4OW1tLmNvbSIsImp0aSI6ImY4ZWY2YjgxLTIyNDQtNDM2NS05Njk0LWM3ZTIyZjJkYTY4NSIsImVtYWlsIjoiT21hckAxMjM0NTY3ODltbS5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjA5ZDQxMjExLThlZmUtNDE4OC1hZTg0LWNkZDM4MDM5NzU4OSIsInJvbGVzIjoiV2luY2hEcml2ZXIiLCJleHAiOjE3MjEzMDA2ODcsImlzcyI6IkdlYXJDYXJlQXBpIiwiYXVkIjoiU2VjdXJlQXBpVXNlciJ9.mOm48c-e9EgYGA1u9SXnFSjemxfA3TORS94vqOe-3DE',
  //       //'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJzYXllZGRkQGdtYWlsLmNvbSIsImp0aSI6ImNkODRjZDA5LWVkMzMtNDNlNy04NDVlLThiYzM2NjlmYmMzNSIsImVtYWlsIjoic2F5ZWRkZEBnbWFpbC5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6Ijg0NzY4ZGU3LTFkNzktNDE0OS1hMmIzLTg1ZmE1N2FmODI2OSIsInJvbGVzIjoiTWVjaGFuaWMiLCJleHAiOjE3MjEzMDA4MDAsImlzcyI6IkdlYXJDYXJlQXBpIiwiYXVkIjoiU2VjdXJlQXBpVXNlciJ9.CYLhynE_mr7aWPN1KHGeV_WQVNMNMOvFLHnN0ZwVxT8'
  //  // /*seller*/'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJNYTIyMzY0MThAZ21haWwuY29tIiwianRpIjoiNWJjMzJkM2QtNjA3NC00NDEzLTllZmYtYzcwNDY4ODJjYWYxIiwiZW1haWwiOiJNYTIyMzY0MThAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiI3Yjk5YzM5Yy1mMTdiLTQwMTktYTgwOS1iNjJjOTk0NDY0NTQiLCJyb2xlcyI6IlNlbGxlciIsImV4cCI6MTcyMTMwMDU4OSwiaXNzIjoiR2VhckNhcmVBcGkiLCJhdWQiOiJTZWN1cmVBcGlVc2VyIn0.39p3nTSLCkg5DJoG9AUIl7lDAgk1qdJREICQNqqRpU8',
  //         // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJPbWFyQDEyMzQ1Njc4OW1tLmNvbSIsImp0aSI6ImY4ZWY2YjgxLTIyNDQtNDM2NS05Njk0LWM3ZTIyZjJkYTY4NSIsImVtYWlsIjoiT21hckAxMjM0NTY3ODltbS5jb20iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjA5ZDQxMjExLThlZmUtNDE4OC1hZTg0LWNkZDM4MDM5NzU4OSIsInJvbGVzIjoiV2luY2hEcml2ZXIiLCJleHAiOjE3MjEzMDA2ODcsImlzcyI6IkdlYXJDYXJlQXBpIiwiYXVkIjoiU2VjdXJlQXBpVXNlciJ9.mOm48c-e9EgYGA1u9SXnFSjemxfA3TORS94vqOe-3DE',
  //           );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'GearCare',
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.kPrimaryColor),
            useMaterial3: true,
          ),
          routerConfig: AppRouter.router,
          //home: const HomeView(),
        );
      },
    );
  }
}
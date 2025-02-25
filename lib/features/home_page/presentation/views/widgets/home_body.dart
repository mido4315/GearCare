import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gear_care/core/constants/app_colors.dart';
import 'package:gear_care/core/utils/assets.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/service_locator.dart';
import 'package:gear_care/core/utils/shared_preferences.dart';
import 'package:gear_care/core/utils/styles.dart';
import 'package:gear_care/features/home_page/presentation/view%20model/home_view_cubit/home_view_cubit.dart';
import 'package:gear_care/features/home_page/presentation/views/widgets/available_provider_listview.dart';
import 'package:gear_care/features/home_page/presentation/views/widgets/make_service_form.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';

import '../../../../../core/helper/custom_snack_bar.dart';
import '../../../../../core/models/service_provider_model.dart';
import '../../../../../core/utils/app_router.dart';
import '../../view model/home_view_cubit/home_view_state.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Start from below (off-screen)
      end: const Offset(0.0, 0.0), // Slide to top (on-screen)
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  List<Marker> markers = [];


  int? image;
  int? isPressed = 0;

  void getServiceProviders() {
    final String usertype;
    if (isPressed == 1) {
      usertype = "Mechanic";
    } else if (isPressed == 3) {
      usertype = "WinchDriver";
    } else {
      usertype = "Electrician";
    }

    BlocProvider.of<HomeViewCubit>(context).getAvailableServiceProvider(
      userType: usertype,
      location: BlocProvider
          .of<HomeViewCubit>(context)
          .location,
      carType: BlocProvider
          .of<HomeViewCubit>(context)
          .carType,
    );
  }

  void getServiceProvidersMarkers() {
    List<Marker> myMarkers = [];
    List<ServiceProviderModel> serviceProviders =
        BlocProvider
            .of<HomeViewCubit>(context)
            .serviceProviders;
    for (ServiceProviderModel item in serviceProviders) {
      var mar = Marker(
        point: LatLng(double.parse(item.latitude ?? "30.989779"),
            double.parse(item.longitude ?? "27.207383")),
        width: 80.w,
        height: 80.h,
        child: GestureDetector(
          onTap: () {
            GoRouter.of(context).push(
              AppRouter.kOthersProfile,
              extra: {
                'name': item.name ?? "unknown",
                'number': item.number ?? "unknown",
                'email': item.email ?? "unknown",
                'location': item.location ?? "unknown",
                'photoId': item.photoId ?? "unknown",
                'rate': item.rate ?? "unknown",
                'specialization': item.specialization ?? "unknown",
                'carTypeToRepair': item.carTypeToRepair ?? "unknown",
                'available': item.available ?? "unknown",
                'userType': item.userType ?? "unknown",
                'initialLocation':
                BlocProvider
                    .of<HomeViewCubit>(context)
                    .location,
                'initialCarType':
                BlocProvider
                    .of<HomeViewCubit>(context)
                    .carType,
                'id': item.id ?? "unknown"
              },
            );
          },
          child: Column(
            children: [
              item.photoId != null
                  ? Image.network(item.photoId!, height: 22.h, width: 22.w,)
                  : const Icon(Icons.person),
              Text(item.name ?? "", style: const TextStyle(
                  fontSize: 8, fontWeight: FontWeight.bold), maxLines: 1,),
            ],
          ),
        ),
      );

      myMarkers.add(mar);
    }

    _fitCamera();

    setState(() {
      markers = myMarkers;
    });
  }

  void _fitCamera() {
    if (markers.isEmpty) return;

    var latitudes = markers.map((marker) => marker.point.latitude).toList();
    var longitudes = markers.map((marker) => marker.point.longitude).toList();

    var north = latitudes.reduce((a, b) => a > b ? a : b);
    var south = latitudes.reduce((a, b) => a < b ? a : b);
    var east = longitudes.reduce((a, b) => a > b ? a : b);
    var west = longitudes.reduce((a, b) => a < b ? a : b);

    var bounds = LatLngBounds(LatLng(south, west), LatLng(north, east));

    setState(() {
      _mapController.fitCamera(
        CameraFit.bounds(bounds: bounds),
      );
    });
  }

  void _toggleVisibility() {
    getServiceProviders();
    getServiceProvidersMarkers();
  }

  final MapController _mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeViewCubit, HomeViewState>(
      listener: (context, state) {
        if (state is HomeViewSuccess) {
          setState(() {
            isVisible = !isVisible;
            if (isVisible) {
              _animationController.forward();
            } else {
              _animationController.reverse();
            }
          });
        } else if (state is HomeViewFailure) {
          customSnackBar(context, state.errorMessage);
          print(state.errorMessage);
        }
      },
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Opacity(
              opacity: isVisible ? 0.5 : 1.0,
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 240.h,
                    child: FlutterMap(
                      mapController: _mapController,
                      options: MapOptions(
                        initialCenter: LatLng(
                            double.parse(getIt
                                .get<SharedPrefs>()
                                .lat),
                            double.parse(getIt
                                .get<SharedPrefs>()
                                .long)),
                        initialZoom: 5,

                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.example.app',
                        ),
                        MarkerLayer(
                          markers: markers,
                        ),

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildItem(
                          image: AssetData.mechanic,
                          text: 'Mechanic',
                          index: 1),
                      buildItem(
                          image: AssetData.electrician,
                          text: 'Electrician',
                          index: 2),
                      buildItem(
                          image: AssetData.winch, text: 'Winch', index: 3),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const MakeServiceForm(),
                  SizedBox(height: context.height * 0.03),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        height: context.getHeight(givenHeight: 67),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.kPrimaryColor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: _toggleVisibility,
                              child: Container(
                                height: context.getHeight(givenHeight: 67),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColors.kPrimaryColor,
                                ),
                                child: Center(
                                  child: Text(
                                    'Who’s available now!',
                                    style: Styles.textStyle24.copyWith(
                                      fontSize:
                                      context.getWidth(givenWidth: 24),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 10,
              top: isVisible
                  ? 50.h
                  : -1000.h, // Adjust the value for the bottom position
              child: IgnorePointer(
                ignoring: !isVisible,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: AvailableProviderListViews(
                    onTap: () {},
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  GestureDetector buildItem({
    required String image,
    required String text,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isPressed == index) {
            isPressed = 0;
          } else {
            isPressed = index;
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          border: Border.all(
              color: isPressed != index
                  ? Colors.white.withOpacity(0)
                  : AppColors.kPrimaryColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Image.asset(
              image,
              width: context.getWidth(givenWidth: 62),
            ),
            SizedBox(
                width: context.getWidth(givenWidth: 105),
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: Styles.textStyle24.copyWith(
                    fontSize: context.getWidth(
                      givenWidth: 22,
                    ),
                    color: AppColors.kPrimaryColor,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
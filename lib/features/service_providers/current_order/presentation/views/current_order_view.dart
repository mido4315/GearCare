import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gear_care/core/helper/custom_snack_bar.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/core/utils/styles.dart';
import 'package:gear_care/features/service_providers/current_order/presentation/view%20model/CurrentOrderCubit.dart';
import 'package:gear_care/features/service_providers/history/presentation/view%20model/MyOrdersHistoryCubit/MyOrdersHistoryCubit.dart';
import 'package:gear_care/features/service_providers/service_providers_home/presentation/views/widgets/handle_order_buttons.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/models/order_model.dart';
import '../../../../../core/utils/api_service.dart';
import '../../../../../core/utils/service_locator.dart';
import '../../../../../widgets/chat_buttons.dart';
import '../../../service_providers_home/data/repos/service_providers_home_repo_impl.dart';
import '../../../service_providers_home/presentation/view model/HandleOrderActionCubit/HandleOrderActionCubit.dart';
import '../../../service_providers_home/presentation/views/widgets/filter_by.dart';
import '../../data/repos/current_order_repo_impl.dart';
import 'widgets/complete_order_button.dart';
import 'widgets/filter_by.dart';

class CurrentOrderView extends StatelessWidget {
  const CurrentOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your Current Orders',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.kPrimaryColor,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
         // const CurrentOrderFilterByButton(),
          BlocBuilder<CurrentOrderCubit, CurrentOrderState>(
            builder: (context, state) {
              if (state is CurrentOrderLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CurrentOrderLoaded) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.orders.length,
                    itemBuilder: (context, index) {
                      final OrderModel order = state.orders[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          // Define the shape of the card
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          // Define how the card's content should be clipped
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          // Define the child widget of the card
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Add padding around the row widget
                              Padding(
                                padding: EdgeInsets.all(15.h),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    // Add an image widget to display an image
                                    Column(
                                      children: [
                                        Image.network(
                                          order.clientImage ??
                                              "https://demofree.sirv.com/nope-not-here.jpg",
                                          height: 100.h,
                                          width: 100.w,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(
                                          height: context.height * 0.06,
                                        ),
                                        ChatButtons(
                                          number: order.clientPhone ?? "000000",
                                          size: 30,
                                          height: context.getHeight(
                                              givenHeight: 40),
                                          width:
                                              context.getWidth(givenWidth: 42),
                                        ),
                                      ],
                                    ),
                                    // Add some spacing between the image and the text
                                    Container(width: 20.w),
                                    // Add an expanded widget to take up the remaining horizontal space
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          // Add some spacing between the top of the card and the title
                                          Container(height: 5.h),
                                          // Add a title widget
                                          Text(
                                            order.clientName ??
                                                "Client Name Not Found",
                                            style: Styles.textStyle20,
                                          ),
                                          // Add some spacing between the title and the subtitle
                                          Container(height: 5.h),
                                          // Add a subtitle widget
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                order.location ?? "Unknown",
                                                style: Styles.textStyle16,
                                              ),
                                              Text(
                                                order.carType ?? "Unknown",
                                                style: Styles.textStyle16,
                                              ),
                                            ],
                                          ),
                                          // Add some spacing between the subtitle and the text
                                          Container(height: 10.h),
                                          // Add a text widget to display some text
                                          Text(
                                            order.problemDescription ??
                                                "Problem description not found",
                                            maxLines: 2,
                                            style: Styles.textStyle18,
                                          ),
                                          Text(
                                            "Status: ${order.status ?? 'unknown'}",
                                            style: Styles.textStyle16,
                                          ),
                                          BlocProvider(
                                            create: (context) =>
                                                HandleOrderActionCubit(
                                              ServiceProvidersHomeRepoImpl(
                                                  getIt.get<APIService>()),
                                            ),
                                            child: CompleteOrderButton(
                                              orderId: order.orderId ??
                                                  "order not found",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else if (state is CurrentOrderError) {
                return Center(
                    child: Text(state.message,
                        style: TextStyle(
                            color: Colors.red,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.03)));
              } else {
                return Center(
                    child: Text('No orders found',
                        style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.03)));
              }
            },
          ),
        ],
      ),
    );
  }
}
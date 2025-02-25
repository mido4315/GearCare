import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gear_care/core/utils/media_query_values.dart';
import 'package:gear_care/features/Search/presentation/view/widgets/custom_search_text_field.dart';
import 'package:gear_care/features/shop_page/presentation/views/widgets/search_item.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(),

          SizedBox(height: 24,),
          Expanded(child: SearchListView())
        ],
      ),
    );
  }
}

class SearchListView extends StatelessWidget {
  const SearchListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context,index){
      return Expanded(
        child: SizedBox(
              height: context.getHeight(givenHeight: 180),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: SearchItem(),
              )),
      );
    });
  }
}

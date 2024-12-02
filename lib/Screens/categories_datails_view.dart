//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:newsapp/api/Api_servies.dart';
import 'package:newsapp/models/Sources_model.dart';
import 'package:newsapp/widget/Sources_list.dart';

// ignore: must_be_immutable
class CategoryDetailsView extends StatefulWidget {
  CategoryDetailsView({
    super.key,
    required this.id,
  });
  final String id;

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  String? SelectedSubCatId;
 

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FutureBuilder<SourceModel>(
            future: ApiServies.getSources(widget.id),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('erorrrrr'),
                );
              }
              SourceModel? sourceModel = snapshot.data;
              // ignore: unused_local_variable
              List<Sources> sources = sourceModel?.sources ?? [];

              return SourcesList(
                  changeSelectedSource: (sourceId) {}, sources: sources);
            }),
      ],
    );
  }
}

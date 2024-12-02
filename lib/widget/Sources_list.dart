import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/AppColors.dart';
import 'package:newsapp/models/Sources_model.dart';
import 'package:newsapp/widget/News_list.dart';

// ignore: must_be_immutable
class SourcesList extends StatefulWidget {
  final void Function(String) changeSelectedSource;

  SourcesList(
      {super.key, required this.changeSelectedSource, required this.sources});

  final List<Sources> sources;
  @override
  State<SourcesList> createState() => _SourcesListState();
}

class _SourcesListState extends State<SourcesList> {
  String? SelectedSourceId;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SelectedSourceId = widget.sources.isNotEmpty ? widget.sources[0].id : null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.sources.length,
              itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.all(6.0),
                    child: ChoiceChip(
                      onSelected: (value) {
                        SelectedSourceId = widget.sources[index].id;
                        setState(() {});
                      },
                      disabledColor: Colors.white,
                      labelStyle: TextStyle(
                          color: widget.sources[index].id == SelectedSourceId
                              ? Colors.white
                              : AppColors.mainColor),
                      selectedColor: AppColors.mainColor,
                      label: Text(
                        widget.sources[index].name ?? '',
                      ),
                      selected: widget.sources[index].id == SelectedSourceId,
                      side: BorderSide(color: AppColors.mainColor),
                    ),
                  )),
        ),
        if (SelectedSourceId != null) NewsList(sourceId: SelectedSourceId!)
      ],
    );
  }
}

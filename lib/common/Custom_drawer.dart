import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newsapp/common/AppColors.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key, required this.OnSelected,});
  final Function(DrawrItem) OnSelected;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 320.w,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(25))),
      child: SizedBox(
        width: 300.w,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100.h,
              color: AppColors.mainColor,
              child: Center(
                  child: Text(
                'NewsApp!',
                style: Theme.of(context).textTheme.titleLarge,
              )),
            ),
            ListTile(onTap: () {
              OnSelected(DrawrItem.categeries);
              Navigator.of(context).pop();
            },
              leading: Icon(
                Icons.list,
                color: Colors.black,
                size: 30,
              ),
              title: Text(
                'Categories',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            ListTile(onTap: () {
              OnSelected(DrawrItem.settings);
              Navigator.of(context).pop();
            },
              leading: Icon(
                Icons.settings,
                color: Colors.black,
                size: 30,
              ),
              title: Text(
                'Settings',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            )
          ],
        ),
      ),
    );
  }
}
enum DrawrItem{
  settings,categeries
}

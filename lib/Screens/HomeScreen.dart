import 'package:flutter/material.dart';
import 'package:newsapp/Screens/Settings_view.dart';
import 'package:newsapp/Screens/categoriesScreenView.dart';
import 'package:newsapp/Screens/categories_datails_view.dart';
import 'package:newsapp/Screens/searchScreen.dart';
import 'package:newsapp/api/Api_servies.dart';
import 'package:newsapp/common/AppImages.dart';
import 'package:newsapp/common/Custom_drawer.dart';
import 'package:newsapp/common/category/category_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawrItem SelectedView = DrawrItem.categeries;
  CategoryModel? SelectedCat;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.pateernpg), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: CustomDrawer(
          OnSelected: ((p0) {
            SelectedView = p0;
            SelectedCat = null;
            setState(() {});
          }),
        ),
         appBar: AppBar(actions: [IconButton(onPressed: () {
          SearchScreen();
        }, icon: Icon(Icons.search))],
          title: SelectedCat != null
              ? Text(
                  SelectedCat!.title,
                )
              : SelectedView == DrawrItem.settings
                  ? Text('Settings')
                  : Text('NewsApp'),
        ),
        body: SelectedCat != null
            ? CategoryDetailsView(
                id: SelectedCat!.id,
              )
            : SelectedView == DrawrItem.categeries
                ? CategoriesScreenView(
                    onSelect: (p0) {
                      SelectedCat = p0;
                      setState(() {});
                    },
                  )
                : SettingsScreen(),
      ),
    );
  }
}

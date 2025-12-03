import 'package:flutter/material.dart';
import 'package:greengrocer/src/core/theme/colors_theme.dart';
import 'package:greengrocer/src/screens/home/components/category_titie_components.dart';

import 'package:greengrocer/src/core/config/app_data.dart' as app_data;
import 'package:greengrocer/src/screens/home/components/item_title_components.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  String selectedCategory = 'Frutas';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Green',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 30,
                ),
              ),
              TextSpan(
                text: 'grocer',
                style: TextStyle(
                  color: ColorsTheme.customContrastColor,
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              onPressed: () {},
              icon: Badge(
                backgroundColor: ColorsTheme.customContrastColor,
                label: Text('99+'),
                child: Icon(
                  Icons.shopping_cart,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                hintText: 'Pesquisar',
                hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide(width: 0, style: BorderStyle.none),
                ),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => SizedBox(width: 10),
                itemCount: app_data.categories.length,
                itemBuilder: (context, index) {
                  return CategoryTitieComponents(
                    onPressed: () {
                      setState(() {
                        selectedCategory = app_data.categories[index];
                      });
                    },
                    category: app_data.categories[index],
                    isSelected: app_data.categories[index] == selectedCategory,
                  );
                },
              ),
            ),

            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                physics: BouncingScrollPhysics(),
                itemCount: app_data.items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 9 / 11.5,
                ),
                itemBuilder: (context, index) {
                  return ItemTitleComponents(itemModel: app_data.items[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:greengrocer/src/core/theme/colors_theme.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/screens/product/product_screen.dart';
import 'package:greengrocer/src/services/util_services.dart';

class ItemTitleComponents extends StatelessWidget {
  final ItemModel itemModel;
  const ItemTitleComponents({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (c) {
                  return ProductScreen(itemModel: itemModel);
                },
              ),
            );
          },
          child: Card(
            color: Colors.white,
            elevation: 1,
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Hero(
                      tag: itemModel.imgUrl,
                      child: Image.asset(itemModel.imgUrl, fit: BoxFit.contain),
                    ),
                  ),
                  Text(
                    itemModel.itemName,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        UtilServices.priceToCurrency(itemModel.price),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: ColorsTheme.customSwatchColor,
                        ),
                      ),
                      Text(
                        '/${itemModel.unit}',
                        style: TextStyle(
                          fontSize: 14,
                          color: ColorsTheme.customSwatchColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 40,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(20),
                ),
              ),

              child: Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

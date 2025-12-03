import 'package:flutter/material.dart';
import 'package:greengrocer/src/components/quantity_components.dart';
import 'package:greengrocer/src/core/theme/colors_theme.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/services/util_services.dart';

class ProductScreen extends StatefulWidget {
  final ItemModel itemModel;

  const ProductScreen({super.key, required this.itemModel});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int quantidade = 0;

  aumentar() {
    setState(() {
      quantidade = quantidade + 1;
    });
  }

  diminuir() {
    setState(() {
      if (quantidade <= 0) return;
      quantidade = quantidade - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Hero(
                  tag: widget.itemModel.imgUrl,
                  child: Image.asset(widget.itemModel.imgUrl),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 30.0,
                      right: 30,
                      top: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.itemModel.itemName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  UtilServices.priceToCurrency(
                                    widget.itemModel.price,
                                  ),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: ColorsTheme.customSwatchColor,
                                  ),
                                ),
                              ],
                            ),

                            QuantityComponents(
                              itemModel: widget.itemModel,
                              quantidade: quantidade,
                              adicionar: aumentar,
                              remover: diminuir,
                            ),
                          ],
                        ),

                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text(
                                widget.itemModel.description,
                                style: TextStyle(fontSize: 15, height: 1.5),
                              ),
                            ),
                          ),
                        ),

                        ElevatedButton.icon(
                          onPressed: quantidade > 0 ? () {} : null,
                          icon: Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                          label: Text(
                            'Adicionar no carrinho ',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 20)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back_ios),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:greengrocer/src/components/payment_dialog.dart';
import 'package:greengrocer/src/components/quantity_components.dart';
import 'package:greengrocer/src/core/config/app_data.dart' as app_data;
import 'package:greengrocer/src/models/item_cart_model.dart';
import 'package:greengrocer/src/services/util_services.dart';

class CartScreens extends StatefulWidget {
  const CartScreens({super.key});

  @override
  State<CartScreens> createState() => _CartScreensState();
}

class _CartScreensState extends State<CartScreens> {
  int quantidade = 0;
  void removeItemCart(ItemCartModel item) {
    app_data.cartitems.remove(item);
  }

  double totalpriceGeral() {
    double total = 0;
    for (var item in app_data.cartitems) {
      total += item.totalprice();
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrinho'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemBuilder: (context, index) => Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 75,
                              height: 75,
                              child: Image.asset(
                                app_data.cartitems[index].itemModel.imgUrl,
                                fit: BoxFit.contain,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  app_data.cartitems[index].itemModel.itemName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  UtilServices.priceToCurrency(
                                    app_data.cartitems[index].totalprice(),
                                  ),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.lightGreen,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        QuantityComponents(
                          adicionar: () {
                            setState(() {
                              app_data.cartitems[index].quantidade += 1;
                            });
                          },
                          remover: () {
                            setState(() {
                              if (app_data.cartitems[index].quantidade == 0) {
                                removeItemCart(app_data.cartitems[index]);
                              } else {
                                app_data.cartitems[index].quantidade -= 1;
                              }
                            });
                          },
                          quantidade: app_data.cartitems[index].quantidade,
                          itemModel: app_data.cartitems[index].itemModel,
                        ),
                      ],
                    ),
                  ),
                ),
                itemCount: app_data.cartitems.length,
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: Container(
              padding: EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 3,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Total geral', style: TextStyle(fontSize: 12)),
                  Text(
                    UtilServices.priceToCurrency(totalpriceGeral()),
                    style: TextStyle(color: Colors.lightGreen, fontSize: 23),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      showDialog<bool?>(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Confirmação'),
                            content: Text(
                              'Deseja realmente concluir o pedido?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: Text('Não'),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(),
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                  showDialog(
                                    context: context,
                                    builder: (_) => PaymentDialog(
                                      order: app_data.orders.first,
                                    ),
                                  );
                                },
                                child: Text(
                                  'Sim',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(
                      Icons.save_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                    label: Text(
                      'Concluir pedido ',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

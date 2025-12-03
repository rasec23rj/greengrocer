import 'package:flutter/material.dart';
import 'package:greengrocer/src/components/payment_dialog.dart';
import 'package:greengrocer/src/models/orders_model.dart';
import 'package:greengrocer/src/screens/orders/components/order_status_widget.dart';
import 'package:greengrocer/src/services/util_services.dart';

class OrderTitleWidget extends StatelessWidget {
  final OrdersModel order;
  const OrderTitleWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: order.status == 'pending_payment',
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pedido: ${order.id}',
                style: TextStyle(color: Colors.lightGreen[800]),
              ),
              Text(
                'Data: ${UtilServices.formatDateTime(order.createdDateTime)}',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ],
          ),
          childrenPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: order.items.map((e) {
                          return Container(
                            height: 30,
                            margin: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Text(
                                  '${e.quantidade} ${e.itemModel.unit} ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                  child: Text(e.itemModel.itemName.toString()),
                                ),
                                Text(
                                  UtilServices.priceToCurrency(
                                    e.itemModel.price,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey[300],
                    thickness: 2,
                    width: 8,
                  ),
                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                      status: order.status,

                      isOverdue: order.overdueDateTime.isBefore(DateTime.now()),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  'Total ',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  UtilServices.priceToCurrency(order.total),
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
            Visibility(
              visible: order.status == 'pending_payment',
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton.icon(
                  icon: Image.asset(
                    'assets/images/pix.png',
                    fit: BoxFit.contain,
                    height: 18,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => PaymentDialog(order: order),
                    );
                  },
                  label: Text(
                    'Ver QR CODE PIX',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:greengrocer/src/models/orders_model.dart';
import 'package:greengrocer/src/services/util_services.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PaymentDialog extends StatelessWidget {
  final OrdersModel order;
  const PaymentDialog({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10),
                Text(
                  'Pagamento com Pix',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                QrImageView(
                  data: '${order.createdDateTime}',
                  version: QrVersions.auto,
                  size: 200.0,
                ),
                Text(
                  'Vencimento ${UtilServices.formatDateTime(order.overdueDateTime)}',
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  UtilServices.priceToCurrency(order.total),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.copy),
                  label: Text('Copiar código pix'),
                ),
              ],
            ),
          ),

          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}

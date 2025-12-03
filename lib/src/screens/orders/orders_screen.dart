import 'package:flutter/material.dart';
import 'package:greengrocer/src/core/theme/colors_theme.dart';
import 'package:greengrocer/src/core/config/app_data.dart' as app_data;
import 'package:greengrocer/src/screens/orders/components/order_title_widget.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Meus Pedidos'),
        backgroundColor: ColorsTheme.customSwatchColor,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16.0),
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return OrderTitleWidget(order: app_data.orders[index]);
        },
        separatorBuilder: (_, _) => SizedBox(height: 10),
        itemCount: app_data.orders.length,
      ),
    );
  }
}

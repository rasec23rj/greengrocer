import 'package:flutter/material.dart';
import 'package:greengrocer/src/core/theme/colors_theme.dart';

class OrderStatusWidget extends StatelessWidget {
  final String status;
  final bool isOverdue;

  final Map<String, int> allStatus = <String, int>{
    'pending_payment': 0,
    'refunded': 1,
    'paid': 2,
    'preparing_purchase': 3,
    'shipping': 4,
    'delivered': 5,
  };

  int get currentStatus => allStatus[status]!;

  OrderStatusWidget({super.key, required this.status, required this.isOverdue});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _OrderStatusDot(isActive: true, title: 'Pedido confirmado'),
        _CustomDivider(),
        if (currentStatus == 1) ...[
          _OrderStatusDot(
            isActive: true,
            title: 'Pix estornado',
            color: Colors.orange,
          ),
        ] else if (isOverdue) ...[
          _OrderStatusDot(
            isActive: true,
            title: 'Pagamento Pix vencido',
            color: Colors.red,
          ),
        ] else ...[
          _OrderStatusDot(isActive: currentStatus >= 2, title: 'Pagamento'),
          _CustomDivider(),
          _OrderStatusDot(isActive: currentStatus >= 3, title: 'Preparando'),
          _CustomDivider(),
          _OrderStatusDot(isActive: currentStatus >= 4, title: 'Envio'),
          _CustomDivider(),
          _OrderStatusDot(isActive: currentStatus >= 5, title: 'Entregue'),
        ],
      ],
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(left: 09, top: 2, bottom: 0),
        height: 10,
        width: 2,
        color: Colors.grey,
      ),
    );
  }
}

class _OrderStatusDot extends StatelessWidget {
  final bool isActive;
  final String title;
  final Color color;

  _OrderStatusDot({
    super.key,
    required this.isActive,
    required this.title,
    this.color = Colors.lightGreen,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //dot
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isActive ? color : ColorsTheme.customSwatchColor,
            ),
            color: isActive
                ? color ?? ColorsTheme.customSwatchColor
                : Colors.transparent,
          ),
          child: isActive
              ? Icon(Icons.check, color: Colors.white, size: 13)
              : SizedBox.shrink(),
        ),
        //text
        const SizedBox(width: 5),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5.0, top: 2),
            child: Text(title, style: TextStyle(fontSize: 12)),
          ),
        ),
      ],
    );
  }
}

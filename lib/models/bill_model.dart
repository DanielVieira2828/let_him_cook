import 'package:let_him_cook/models/order_model.dart';

class Bill {
  const Bill({
    required this.uuid,
    required this.clientUuid,
    required this.table,
    required this.orders,
  });

  final String uuid;
  final String clientUuid;
  final int table;
  final List<Order> orders;
}

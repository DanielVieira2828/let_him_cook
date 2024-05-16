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

  Bill addOrder(Order order) {
    List<Order> updatedOrders = List.from(orders)..add(order);
    return Bill(
      uuid: uuid,
      clientUuid: clientUuid,
      table: table,
      orders: updatedOrders,
    );
  }

  double calculateTotalBillValue() {
    double totalValue = 0;
    for (var order in orders) {
      totalValue += order.totalPrice;
    }
    return totalValue;
  }
}

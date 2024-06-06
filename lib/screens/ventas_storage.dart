// ventas_storage.dart
class VentasStorage {
  static List<Map<String, dynamic>> pedidosListos = [];

  static void addPedidoListo(Map<String, dynamic> pedido) {
    pedidosListos.add(pedido);
  }

  static List<Map<String, dynamic>> getPedidosDeHoy() {
    DateTime now = DateTime.now();
    return pedidosListos.where((pedido) {
      DateTime fecha = pedido['fecha'];
      return fecha.year == now.year &&
          fecha.month == now.month &&
          fecha.day == now.day;
    }).toList();
  }

  static List<Map<String, dynamic>> getPedidosDeEsteMes() {
    DateTime now = DateTime.now();
    return pedidosListos.where((pedido) {
      DateTime fecha = pedido['fecha'];
      return fecha.year == now.year && fecha.month == now.month;
    }).toList();
  }

  static List<Map<String, dynamic>> getTotalVentasMes() {
    DateTime now = DateTime.now();
    return pedidosListos.where((pedido) {
      DateTime fecha = pedido['fecha'];
      return fecha.year == now.year && fecha.month == now.month;
    }).toList();
  }
}

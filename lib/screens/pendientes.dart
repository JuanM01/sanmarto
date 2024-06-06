import 'package:flutter/material.dart';
import 'ventas_storage.dart'; // Import the new storage class

class PedidosPendientesPage extends StatefulWidget {
  static List<Map<String, dynamic>> pedidosPendientes = [];

  @override
  _PedidosPendientesPageState createState() => _PedidosPendientesPageState();
}

class _PedidosPendientesPageState extends State<PedidosPendientesPage> {
  void _marcarPedidoListo(int index) {
    setState(() {
      var pedido = PedidosPendientesPage.pedidosPendientes.removeAt(index);
      pedido['fecha'] = DateTime.now(); // Add the current date and time
      VentasStorage.addPedidoListo(pedido);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Pedido ${index + 1} marcado como listo')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedidos Pendientes'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 184, 52, 78),
              Colors.white,
            ],
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Center(
          child: ListView.builder(
            itemCount: PedidosPendientesPage.pedidosPendientes.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> pedido =
                  PedidosPendientesPage.pedidosPendientes[index];

              // Construir la lista de campos que tienen información
              List<Widget> campos = [
                Text(
                  'Pedido ${index + 1}',
                  style: TextStyle(fontSize: 18),
                ),
              ];

              String nombre = pedido['nombre'] ?? '-';
              campos.add(Text('Nombre: $nombre'));

              bool esParaLlevar = pedido['esParaLlevar'] ?? false;
              String mesa =
                  esParaLlevar ? '' : (pedido['mesa']?.toString() ?? '-');
              if (!esParaLlevar && mesa != '-') {
                campos.add(Text('Mesa: $mesa'));
              } else {
                String direccion = pedido['direccion'] ?? '-';
                String telefono = pedido['telefono'] ?? '-';
                campos.add(Text('Dirección: $direccion'));
                campos.add(Text('Teléfono: $telefono'));
              }

              String metodoDePago = pedido['metodoDePago'] ?? '-';
              campos.add(Text('Método de pago: $metodoDePago'));

              String comida = pedido['comida'] ?? '-';
              campos.add(Text('Comida: $comida'));

              String bebida = pedido['bebida'] ?? '-';
              campos.add(Text('Bebida: $bebida'));

              String postre = pedido['postre'] ?? '-';
              campos.add(Text('Postre: $postre'));

              String comentarios = pedido['comentarios'] ?? '-';
              campos.add(Text('Comentarios: $comentarios'));

              double total = pedido['total'] ?? 0.0;
              campos.add(Text('Total: \$${total.toStringAsFixed(2)}'));

              return Container(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...campos,
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () => _marcarPedidoListo(index),
                      child: Text('Marcar como listo'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

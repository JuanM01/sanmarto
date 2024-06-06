import 'package:flutter/material.dart';
import 'ventas_storage.dart'; // Import the new storage class

class VentasPage extends StatelessWidget {
  const VentasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VENTAS'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TotalVentasMesPage()),
              );
            },
            child: Text('VENTAS POR MES', style: TextStyle(fontSize: 18)),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VentasHoyPage()),
              );
            },
            child: Text('VENTAS DE HOY', style: TextStyle(fontSize: 18)),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VentasMesPage()),
              );
            },
            child: Text('VENTAS DE ESTE MES', style: TextStyle(fontSize: 18)),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
            ),
          ),
        ],
      ),
    );
  }
}

class VentasHoyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> pedidosDeHoy = VentasStorage.getPedidosDeHoy();

    return Scaffold(
      appBar: AppBar(
        title: Text('Ventas de Hoy'),
      ),
      body: ListView.builder(
        itemCount: pedidosDeHoy.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> pedido = pedidosDeHoy[index];
          String nombre = pedido['nombre'] ?? 'Sin nombre';
          String comida = pedido['comida'] ?? 'Sin comida';
          String bebida = pedido['bebida'] ?? 'Sin bebida';
          String postre = pedido['postre'] ?? 'Sin postre';
          double total = pedido['total'] ?? 0.0;

          return ListTile(
            title: Text('Pedido ${index + 1}'),
            subtitle: Text(
              'Cliente: $nombre\n'
              'Comida: $comida\n'
              'Bebida: $bebida\n'
              'Postre: $postre\n'
              'Total: \$${total.toStringAsFixed(2)}',
            ),
          );
        },
      ),
    );
  }
}

class VentasMesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> pedidosDeEsteMes =
        VentasStorage.getPedidosDeEsteMes();

    return Scaffold(
      appBar: AppBar(
        title: Text('Ventas de Este Mes'),
      ),
      body: ListView.builder(
        itemCount: pedidosDeEsteMes.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> pedido = pedidosDeEsteMes[index];
          String nombre = pedido['nombre'] ?? 'Sin nombre';
          String comida = pedido['comida'] ?? 'Sin comida';
          String bebida = pedido['bebida'] ?? 'Sin bebida';
          String postre = pedido['postre'] ?? 'Sin postre';
          double total = pedido['total'] ?? 0.0;

          return ListTile(
            title: Text('Pedido ${index + 1}'),
            subtitle: Text(
              'Cliente: $nombre\n'
              'Comida: $comida\n'
              'Bebida: $bebida\n'
              'Postre: $postre\n'
              'Total: \$${total.toStringAsFixed(2)}',
            ),
          );
        },
      ),
    );
  }
}

class TotalVentasMesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> totalVentasMes =
        VentasStorage.getTotalVentasMes();

    return Scaffold(
      appBar: AppBar(
        title: Text('Total Ventas del Mes'),
      ),
      body: ListView.builder(
        itemCount: totalVentasMes.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> pedido = totalVentasMes[index];
          String nombre = pedido['nombre'] ?? 'Sin nombre';
          String comida = pedido['comida'] ?? 'Sin comida';
          String bebida = pedido['bebida'] ?? 'Sin bebida';
          String postre = pedido['postre'] ?? 'Sin postre';
          double total = pedido['total'] ?? 0.0;

          return ListTile(
            title: Text('Pedido ${index + 1}'),
            subtitle: Text(
              'Cliente: $nombre\n'
              'Comida: $comida\n'
              'Bebida: $bebida\n'
              'Postre: $postre\n'
              'Total: \$${total.toStringAsFixed(2)}',
            ),
          );
        },
      ),
    );
  }
}

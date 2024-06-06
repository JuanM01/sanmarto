import 'package:flutter/material.dart';
import 'agregar_pedido.dart'; // Importa el archivo de la página HistorialPage
import 'pendientes.dart'; // Importa el archivo de la página PedidosPendientesPage

class PedidosPage extends StatelessWidget {
  const PedidosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PEDIDOS'),
      ),
      body: Container(
        color: Color.fromARGB(255, 184, 52, 78), // Fondo de color salmón
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AgregarPedidoPage()),
                );
              },
              child: Text('Agregar Pedido', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PedidosPendientesPage()),
                );
              },
              child: Text('Pendientes', style: TextStyle(fontSize: 18)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

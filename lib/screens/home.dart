import 'package:flutter/material.dart';
import 'editar_menu.dart';
import 'pedidos.dart';
import 'ver_mesas.dart';
import 'ventas.dart';
import 'inicio.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 184, 52, 78),
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditarMenuPage()),
                      );
                    },
                    child: Text('Editar Menu'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal:
                              40), // Ajusta el padding para hacer el botón más grande
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PedidosPage()),
                      );
                    },
                    child: Text('Pedidos'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal:
                              40), // Ajusta el padding para hacer el botón más grande
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VerMesasPage()),
                      );
                    },
                    child: Text('Mesas'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal:
                              40), // Ajusta el padding para hacer el botón más grande
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => VentasPage()),
                      );
                    },
                    child: Text('Ventas'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal:
                              40), // Ajusta el padding para hacer el botón más grande
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            ClipOval(
              child: Container(
                color: Colors.white,
                width: 200,
                height: 200,
                child: Image.asset(
                  'assets/logo.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InicioPage()),
                );
              },
              child: Text('Salir'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    vertical: 20,
                    horizontal:
                        40), // Ajusta el padding para hacer el botón más grande
              ),
            ),
          ],
        ),
      ),
    );
  }
}

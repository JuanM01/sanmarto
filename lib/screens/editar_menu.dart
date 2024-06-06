import 'package:flutter/material.dart';
import 'comidas.dart';
import 'bebidas.dart';
import 'postres.dart';
import 'home.dart';

class EditarMenuPage extends StatelessWidget {
  const EditarMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 184, 52, 78),
      appBar: AppBar(
        title: Text('Editar Menú'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ComidasPage()),
                );
              },
              child: Text('Comidas',
                  style: TextStyle(fontSize: 20, color: Colors.deepPurple)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 60),
                backgroundColor: const Color.fromARGB(255, 250, 250, 250),
                // Color de fondo del botón
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BebidasPage()),
                );
              },
              child: Text('Bebidas',
                  style: TextStyle(fontSize: 20, color: Colors.deepPurple)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 60),
                backgroundColor: const Color.fromARGB(255, 250, 250, 250),
                // Color de fondo del botón
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PostresPage()),
                );
              },
              child: Text('Postres',
                  style: TextStyle(fontSize: 20, color: Colors.deepPurple)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 30, horizontal: 60),
                backgroundColor: const Color.fromARGB(255, 250, 250, 250),
                // Color de fondo del botón
              ),
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
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('Salir', style: TextStyle(fontSize: 20)),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                backgroundColor: Colors.white,
                // Color de fondo del botón
              ),
            ),
          ],
        ),
      ),
    );
  }
}

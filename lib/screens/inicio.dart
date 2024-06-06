import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'registro.dart'; 
import 'home.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      body: Container(
        color: Color.fromARGB(255, 184, 52, 78), // Fondo de color salmón
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              Container(
                width: 150,
                height: 150,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white, // Espacio para la foto blanco y circular
                ),
                child: ClipOval(
                  child: Image.asset(
                    'logo.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  hintText: 'Usuario',
                  hintStyle: TextStyle(color: Colors.black), // Texto negro
                  prefixIcon:
                      Icon(Icons.person, color: Colors.black), // Icono negro
                  filled: true,
                  fillColor: Colors.white, // Caja de texto blanca
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Contraseña',
                  hintStyle: TextStyle(color: Colors.black), // Texto negro
                  prefixIcon:
                      Icon(Icons.lock, color: Colors.black), // Icono negro
                  filled: true,
                  fillColor: Colors.white, // Caja de texto blanca
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Lógica para iniciar sesión

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                // Establecer el color del botón directamente
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.grey), // Botón gris
                ),
                child: Text(
                  'Ingresar',
                  style: TextStyle(color: Colors.white), // Texto blanco
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  // Lógica para registrarse
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistroPage()),
                  );
                },
                // Establecer el color del botón directamente
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.grey), // Botón gris
                ),
                child: Text(
                  'Registrarse',
                  style: TextStyle(color: Colors.white), // Texto blanco
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

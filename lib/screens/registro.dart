import 'package:flutter/material.dart';

class RegistroPage extends StatelessWidget {
  const RegistroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Container(
        color: Color.fromARGB(255, 184, 52, 78), // Fondo de color salmón
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  _registrarRestaurante(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey), // Botón gris
                ),
                child: Text(
                  'Registrar mi restaurante',
                  style: TextStyle(color: Colors.white), // Texto blanco
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  _registrarCliente(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey), // Botón gris
                ),
                child: Text(
                  'Registro de clientes',
                  style: TextStyle(color: Colors.white), // Texto blanco
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Volver al inicio
                },
                child: Text(
                  'Volver al inicio',
                  style: TextStyle(color: Colors.white), // Texto blanco
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _registrarRestaurante(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registrar restaurante'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nombre del restaurante'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Dirección'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Teléfono de contacto'),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 10),
                _buildPasswordFormField('Contraseña'),
                const SizedBox(height: 10),
                _buildPasswordFormField('Confirmar contraseña'),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Lógica para cargar la imagen del logo del restaurante desde el dispositivo
                        },
                        child: Text('Cargar imagen'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nombre del administrador del restaurante'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Correo'),
                  keyboardType: TextInputType.emailAddress,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Lógica para registrar el restaurante en la base de datos
                // Implementa la lógica aquí
                Navigator.pop(context); // Cerrar el diálogo
              },
              child: Text('Registrar'),
            ),
          ],
        );
      },
    );
  }

  void _registrarCliente(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Registro de cliente'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nombre'),
                ),
                const SizedBox(height: 10),
                _buildPasswordFormField('Contraseña'),
                const SizedBox(height: 10),
                _buildPasswordFormField('Confirmar contraseña'),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Correo electrónico'),
                  keyboardType: TextInputType.emailAddress,
                ),
                // Agrega más campos según sea necesario
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Lógica para registrar el cliente en la base de datos
                // Implementa la lógica aquí
                Navigator.pop(context); // Cerrar el diálogo
              },
              child: Text('Registrar'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPasswordFormField(String labelText) {
    return TextFormField(
      decoration: InputDecoration(labelText: labelText),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor ingresa una contraseña';
        }
        return null;
      },
    );
  }
}

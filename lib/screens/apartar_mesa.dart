import 'package:flutter/material.dart';

class ApartarMesaPage extends StatelessWidget {
  const ApartarMesaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apartar Mesa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          // Implementa un formulario para apartar la mesa
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Teléfono'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Número de comensales'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Hora de llegada'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implementa la lógica para apartar la mesa
                },
                child: Text('Apartar Mesa'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

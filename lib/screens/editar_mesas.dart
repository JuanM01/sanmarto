import 'package:flutter/material.dart';

class EditarMesasPage extends StatelessWidget {
  const EditarMesasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Mesas'),
      ),
      body: ListView.builder(
        itemCount:
            10, // Cambia este valor al número de mesas que deseas mostrar
        itemBuilder: (context, index) {
          // Aquí debes implementar la lógica para editar cada mesa
          // Puedes usar un ListTile o un Widget personalizado
          return ListTile(
            title: Text('Mesa ${index + 1}'),
            onTap: () {
              // Implementa la lógica para editar la mesa seleccionada
            },
          );
        },
      ),
    );
  }
}

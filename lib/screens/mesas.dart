import 'package:flutter/material.dart';

class VerMesasPage extends StatefulWidget {
  @override
  _VerMesasPageState createState() => _VerMesasPageState();
}

class _VerMesasPageState extends State<VerMesasPage> {
  List<String> mesas = List.generate(10, (index) => 'Disponible');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ver Mesas'),
      ),
      body: ListView.builder(
        itemCount: mesas.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Mesa ${index + 1}'),
            tileColor: _getColorForTable(mesas[index]),
            onTap: () {
              _showOptionsDialog(context, index);
            },
          );
        },
      ),
    );
  }

  Color _getColorForTable(String estado) {
    switch (estado) {
      case 'Disponible':
        return Colors.green;
      case 'Ocupada':
        return Colors.red;
      case 'Apartada':
        return Colors.blue;
      default:
        return Colors.white;
    }
  }

  void _showOptionsDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Mesa ${index + 1}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  _changeTableStatus(index, 'Disponible');
                  Navigator.pop(context);
                },
                child: Text('Disponible'),
              ),
              ElevatedButton(
                onPressed: () {
                  _changeTableStatus(index, 'Ocupada');
                  Navigator.pop(context);
                },
                child: Text('Ocupada'),
              ),
              ElevatedButton(
                onPressed: () {
                  _showApartarForm(context, index);
                },
                child: Text('Apartar'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _changeTableStatus(int index, String newState) {
    setState(() {
      mesas[index] = newState;
    });
  }

  void _showApartarForm(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Apartar Mesa'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
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
              ElevatedButton(
                onPressed: () {
                  _changeTableStatus(index, 'Apartada');
                  Navigator.pop(context);
                },
                child: Text('Apartar Mesa'),
              ),
            ],
          ),
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: VerMesasPage(),
  ));
}

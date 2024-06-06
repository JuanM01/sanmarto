import 'package:flutter/material.dart';

// Clase para representar una Bebida
class Bebida {
  final String nombre;
  final String descripcion;
  final double precio;

  Bebida(
      {required this.nombre, required this.descripcion, required this.precio});
}

// Lista temporal para almacenar las Bebidas
List<Bebida> listaBebidas = [];

class BebidasPage extends StatelessWidget {
  const BebidasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 184, 52, 78),
      appBar: AppBar(
        title: Text('Bebidas'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VerBebidasPage()),
              );
            },
            child: Text('Ver Mis Bebidas',
                style: TextStyle(fontSize: 20, color: Colors.deepPurple)),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 60),
              backgroundColor: const Color.fromARGB(255, 250, 250, 250),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AgregarBebidaPage()),
              );
            },
            child: Text('Agregar Bebida',
                style: TextStyle(fontSize: 20, color: Colors.deepPurple)),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 60),
              backgroundColor: const Color.fromARGB(255, 250, 250, 250),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditarBebidasPage()),
              );
            },
            child: Text('Editar Bebidas',
                style: TextStyle(fontSize: 20, color: Colors.deepPurple)),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 60),
              backgroundColor: const Color.fromARGB(255, 250, 250, 250),
            ),
          ),
        ],
      ),
    );
  }
}

class VerBebidasPage extends StatelessWidget {
  const VerBebidasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Bebidas'),
      ),
      body: ListView.builder(
        itemCount: listaBebidas.length,
        itemBuilder: (context, index) {
          final Bebida = listaBebidas[index];
          return ListTile(
            title: Text(Bebida.nombre),
            subtitle: Text(
                '${Bebida.descripcion}\nPrecio: \$${Bebida.precio.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}

class AgregarBebidaPage extends StatefulWidget {
  @override
  _AgregarBebidaPageState createState() => _AgregarBebidaPageState();
}

class _AgregarBebidaPageState extends State<AgregarBebidaPage> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _precioController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _descripcionController.dispose();
    _precioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Bebida'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(labelText: 'Nombre de la Bebida'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa el nombre de la Bebida';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _descripcionController,
                decoration:
                    InputDecoration(labelText: 'Descripción de la Bebida'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa la descripción de la Bebida';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _precioController,
                decoration: InputDecoration(labelText: 'Precio'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa el precio de la Bebida';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final nombre = _nombreController.text;
                    final descripcion = _descripcionController.text;
                    final precio = double.parse(_precioController.text);
                    final nuevaBebida = Bebida(
                        nombre: nombre,
                        descripcion: descripcion,
                        precio: precio);
                    setState(() {
                      listaBebidas.add(nuevaBebida);
                    });
                    _nombreController.clear();
                    _descripcionController.clear();
                    _precioController.clear();
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Bebida Guardada'),
                        content: Text(
                            'Nombre: $nombre\nDescripción: $descripcion\nPrecio: $precio'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: Text('Guardar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditarBebidasPage extends StatefulWidget {
  @override
  _EditarBebidasPageState createState() => _EditarBebidasPageState();
}

class _EditarBebidasPageState extends State<EditarBebidasPage> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _descripcionController = TextEditingController();
  final _precioController = TextEditingController();

  @override
  void dispose() {
    _nombreController.dispose();
    _descripcionController.dispose();
    _precioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Bebidas'),
      ),
      body: ListView.builder(
        itemCount: listaBebidas.length,
        itemBuilder: (context, index) {
          final bebida = listaBebidas[index];
          return ListTile(
            title: Text(bebida.nombre),
            subtitle: Text(
                '${bebida.descripcion}\nPrecio: \$${bebida.precio.toStringAsFixed(2)}'),
            onTap: () {
              // Mostrar el formulario para editar la bebida seleccionada
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Editar Bebida'),
                    content: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller: _nombreController..text = bebida.nombre,
                            decoration: InputDecoration(
                                labelText: 'Nombre de la Bebida'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingresa el nombre de la Bebida';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _descripcionController
                              ..text = bebida.descripcion,
                            decoration: InputDecoration(
                                labelText: 'Descripción de la Bebida'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingresa la descripción de la Bebida';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _precioController
                              ..text = bebida.precio.toString(),
                            decoration: InputDecoration(labelText: 'Precio'),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingresa el precio de la Bebida';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final nombre = _nombreController.text;
                            final descripcion = _descripcionController.text;
                            final precio = double.parse(_precioController.text);
                            final nuevaBebida = Bebida(
                                nombre: nombre,
                                descripcion: descripcion,
                                precio: precio);
                            setState(() {
                              listaBebidas[index] = nuevaBebida;
                            });
                            Navigator.of(context).pop();
                          }
                        },
                        child: Text('Guardar'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancelar'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

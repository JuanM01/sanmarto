import 'package:flutter/material.dart';

// Clase para representar una comida
class Comida {
  final String nombre;
  final String descripcion;
  final double precio;

  Comida(
      {required this.nombre, required this.descripcion, required this.precio});
}

// Lista temporal para almacenar las comidas
List<Comida> listaComidas = [];

class ComidasPage extends StatelessWidget {
  const ComidasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 184, 52, 78),
      appBar: AppBar(
        title: Text('Comidas'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VerComidasPage()),
              );
            },
            child: Text('Ver Mis Comidas',
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
                MaterialPageRoute(builder: (context) => AgregarComidaPage()),
              );
            },
            child: Text('Agregar Comida',
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
                MaterialPageRoute(builder: (context) => EditarComidasPage()),
              );
            },
            child: Text('Editar Comidas',
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

class VerComidasPage extends StatelessWidget {
  const VerComidasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Comidas'),
      ),
      body: ListView.builder(
        itemCount: listaComidas.length,
        itemBuilder: (context, index) {
          final comida = listaComidas[index];
          return ListTile(
            title: Text(comida.nombre),
            subtitle: Text(
                '${comida.descripcion}\nPrecio: \$${comida.precio.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}

class AgregarComidaPage extends StatefulWidget {
  @override
  _AgregarComidaPageState createState() => _AgregarComidaPageState();
}

class _AgregarComidaPageState extends State<AgregarComidaPage> {
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
        title: Text('Agregar Comida'),
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
                decoration: InputDecoration(labelText: 'Nombre de la comida'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa el nombre de la comida';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _descripcionController,
                decoration:
                    InputDecoration(labelText: 'Descripción de la comida'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa la descripción de la comida';
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
                    return 'Por favor, ingresa el precio de la comida';
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
                    final nuevaComida = Comida(
                        nombre: nombre,
                        descripcion: descripcion,
                        precio: precio);
                    setState(() {
                      listaComidas.add(nuevaComida);
                    });
                    _nombreController.clear();
                    _descripcionController.clear();
                    _precioController.clear();
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Comida Guardada'),
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

class EditarComidasPage extends StatefulWidget {
  @override
  _EditarComidasPageState createState() => _EditarComidasPageState();
}

class _EditarComidasPageState extends State<EditarComidasPage> {
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
        title: Text('Editar Comidas'),
      ),
      body: ListView.builder(
        itemCount: listaComidas.length,
        itemBuilder: (context, index) {
          final comida = listaComidas[index];
          return ListTile(
            title: Text(comida.nombre),
            subtitle: Text(
                '${comida.descripcion}\nPrecio: \$${comida.precio.toStringAsFixed(2)}'),
            onTap: () {
              // Mostrar el formulario para editar la comida seleccionada
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Editar Comida'),
                    content: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller: _nombreController..text = comida.nombre,
                            decoration: InputDecoration(
                                labelText: 'Nombre de la comida'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingresa el nombre de la comida';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _descripcionController
                              ..text = comida.descripcion,
                            decoration: InputDecoration(
                                labelText: 'Descripción de la comida'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingresa la descripción de la comida';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _precioController
                              ..text = comida.precio.toString(),
                            decoration: InputDecoration(labelText: 'Precio'),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingresa el precio de la comida';
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
                            final nuevaComida = Comida(
                                nombre: nombre,
                                descripcion: descripcion,
                                precio: precio);
                            setState(() {
                              listaComidas[index] = nuevaComida;
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

import 'package:flutter/material.dart';

// Clase para representar una Postre
class Postre {
  final String nombre;
  final String descripcion;
  final double precio;

  Postre(
      {required this.nombre, required this.descripcion, required this.precio});
}

// Lista temporal para almacenar las Postres
List<Postre> listaPostres = [];

class PostresPage extends StatelessWidget {
  const PostresPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 184, 52, 78),
      appBar: AppBar(
        title: Text('Postres'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VerPostresPage()),
              );
            },
            child: Text('Ver Mis Postres',
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
                MaterialPageRoute(builder: (context) => AgregarPostrePage()),
              );
            },
            child: Text('Agregar Postre',
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
                MaterialPageRoute(builder: (context) => EditarPostresPage()),
              );
            },
            child: Text('Editar Postres',
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

class VerPostresPage extends StatelessWidget {
  const VerPostresPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Postres'),
      ),
      body: ListView.builder(
        itemCount: listaPostres.length,
        itemBuilder: (context, index) {
          final postre = listaPostres[index];
          return ListTile(
            title: Text(postre.nombre),
            subtitle: Text(
                '${postre.descripcion}\nPrecio: \$${postre.precio.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}

class AgregarPostrePage extends StatefulWidget {
  @override
  _AgregarPostrePageState createState() => _AgregarPostrePageState();
}

class _AgregarPostrePageState extends State<AgregarPostrePage> {
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
        title: Text('Agregar Postre'),
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
                decoration: InputDecoration(labelText: 'Nombre del Postre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa el nombre del Postre';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _descripcionController,
                decoration:
                    InputDecoration(labelText: 'Descripción del Postre'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingresa la descripción del Postre';
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
                    return 'Por favor, ingresa el precio del Postre';
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
                    final nuevaPostre = Postre(
                        nombre: nombre,
                        descripcion: descripcion,
                        precio: precio);
                    setState(() {
                      listaPostres.add(nuevaPostre);
                    });
                    _nombreController.clear();
                    _descripcionController.clear();
                    _precioController.clear();
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Postre Guardado'),
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

class EditarPostresPage extends StatefulWidget {
  @override
  _EditarPostresPageState createState() => _EditarPostresPageState();
}

class _EditarPostresPageState extends State<EditarPostresPage> {
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
        title: Text('Editar Postres'),
      ),
      body: ListView.builder(
        itemCount: listaPostres.length,
        itemBuilder: (context, index) {
          final postre = listaPostres[index];
          return ListTile(
            title: Text(postre.nombre),
            subtitle: Text(
                '${postre.descripcion}\nPrecio: \$${postre.precio.toStringAsFixed(2)}'),
            onTap: () {
              // Mostrar el formulario para editar la Postre seleccionada
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Editar Postre'),
                    content: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextFormField(
                            controller: _nombreController..text = postre.nombre,
                            decoration:
                                InputDecoration(labelText: 'Nombre del postre'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingresa el nombre del postre';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _descripcionController
                              ..text = postre.descripcion,
                            decoration: InputDecoration(
                                labelText: 'Descripción del postre'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingresa la descripción del postre';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            controller: _precioController
                              ..text = postre.precio.toString(),
                            decoration: InputDecoration(labelText: 'Precio'),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, ingresa el precio del postre';
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
                            final nuevoPostre = Postre(
                                nombre: nombre,
                                descripcion: descripcion,
                                precio: precio);
                            setState(() {
                              listaPostres[index] = nuevoPostre;
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

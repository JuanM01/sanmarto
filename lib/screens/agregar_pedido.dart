import 'package:flutter/material.dart';
import 'comidas.dart';
import 'postres.dart';
import 'bebidas.dart';
import 'pendientes.dart';

class AgregarPedidoPage extends StatefulWidget {
  @override
  _AgregarPedidoPageState createState() => _AgregarPedidoPageState();
}

class _AgregarPedidoPageState extends State<AgregarPedidoPage> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _mesaController = TextEditingController();
  final _direccionController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _comentariosController = TextEditingController();
  final Map<dynamic, int> _pedido = {};
  bool _esParaLlevar = false;
  String _metodoDePago = 'Efectivo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Pedido'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(labelText: 'Nombre del Cliente'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, ingrese el nombre del cliente';
                  }
                  return null;
                },
              ),
              if (!_esParaLlevar)
                TextFormField(
                  controller: _mesaController,
                  decoration: InputDecoration(labelText: 'Número de Mesa'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (!_esParaLlevar && (value == null || value.isEmpty)) {
                      return 'Por favor, ingrese el número de mesa';
                    }
                    return null;
                  },
                ),
              SwitchListTile(
                title: Text('¿Es para llevar?'),
                value: _esParaLlevar,
                onChanged: (value) {
                  setState(() {
                    _esParaLlevar = value;
                  });
                },
              ),
              if (_esParaLlevar)
                Column(
                  children: [
                    TextFormField(
                      controller: _direccionController,
                      decoration:
                          InputDecoration(labelText: 'Dirección del Cliente'),
                      validator: (value) {
                        if (_esParaLlevar && (value == null || value.isEmpty)) {
                          return 'Por favor, ingrese la dirección del cliente';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _telefonoController,
                      decoration:
                          InputDecoration(labelText: 'Número de Teléfono'),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (_esParaLlevar && (value == null || value.isEmpty)) {
                          return 'Por favor, ingrese el número de teléfono';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              SizedBox(height: 20),
              Text('Comidas'),
              _buildProductoList(listaComidas),
              SizedBox(height: 20),
              Text('Bebidas'),
              _buildProductoList(listaBebidas),
              SizedBox(height: 20),
              Text('Postres'),
              _buildProductoList(listaPostres),
              SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: _metodoDePago,
                onChanged: (String? newValue) {
                  setState(() {
                    _metodoDePago = newValue!;
                  });
                },
                items: ['Efectivo', 'Transferencia']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Método de Pago'),
              ),
              TextFormField(
                controller: _comentariosController,
                decoration:
                    InputDecoration(labelText: 'Comentarios/Observaciones'),
                maxLines: 3,
              ),
              SizedBox(height: 20),
              Text('Total: \$${_calcularTotal().toStringAsFixed(2)}'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Aquí puede ir la lógica para guardar el pedido
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Pedido agregado')),
                    );
                    _agregarPedidoPendiente();
                    _limpiarFormulario();
                  }
                },
                child: Text('Agregar Pedido'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _agregarPedidoPendiente() {
    List<String> comidas = [];
    List<String> bebidas = [];
    List<String> postres = [];

    _pedido.forEach((producto, cantidad) {
      for (int i = 0; i < cantidad; i++) {
        if (producto is Comida) {
          comidas.add(producto.nombre);
        } else if (producto is Bebida) {
          bebidas.add(producto.nombre);
        } else if (producto is Postre) {
          postres.add(producto.nombre);
        }
      }
    });

    Map<String, dynamic> pedido = {
      'nombre': _nombreController.text,
      'mesa': _mesaController.text,
      'direccion': _direccionController.text,
      'telefono': _telefonoController.text,
      'metodoDePago': _metodoDePago,
      'total': _calcularTotal(),
      'esParaLlevar': _esParaLlevar,
      'comentarios': _comentariosController.text,
      'comida': comidas.join(', '),
      'bebida': bebidas.join(', '),
      'postre': postres.join(', '),
    };

    // Añadir el pedido a la lista de pedidos pendientes
    PedidosPendientesPage.pedidosPendientes.add(pedido);
  }

  Widget _buildProductoList(List<dynamic> productos) {
    return Column(
      children: productos.map((producto) {
        return ListTile(
          title: Text(
            producto is Comida
                ? '${producto.nombre} - \$${producto.precio.toStringAsFixed(2)}'
                : producto is Bebida
                    ? '${producto.nombre} - \$${producto.precio.toStringAsFixed(2)}'
                    : '${producto.nombre} - \$${producto.precio.toStringAsFixed(2)}',
          ),
          trailing: _buildCantidadSelector(producto),
        );
      }).toList(),
    );
  }

  Widget _buildCantidadSelector(dynamic producto) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            setState(() {
              if (_pedido.containsKey(producto) && _pedido[producto]! > 0) {
                _pedido[producto] = _pedido[producto]! - 1;
              }
            });
          },
        ),
        Text(_pedido[producto]?.toString() ?? '0'),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              if (_pedido.containsKey(producto)) {
                _pedido[producto] = _pedido[producto]! + 1;
              } else {
                _pedido[producto] = 1;
              }
            });
          },
        ),
      ],
    );
  }

  double _calcularTotal() {
    double total = 0.0;
    _pedido.forEach((producto, cantidad) {
      total += producto.precio * cantidad;
    });
    return total;
  }

  void _limpiarFormulario() {
    _nombreController.clear();
    _mesaController.clear();
    _direccionController.clear();
    _telefonoController.clear();
    _comentariosController.clear();
    _pedido.clear();
    _esParaLlevar = false;
    _metodoDePago = 'Efectivo';
    setState(() {});
  }
}

void main() {
  runApp(MaterialApp(
    home: AgregarPedidoPage(),
  ));
}

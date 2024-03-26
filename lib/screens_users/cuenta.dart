import 'package:flutter/material.dart';
import 'package:map_flutter/screens_gerentes/create_account_gerente.dart';

class CuentaScreen extends StatefulWidget {
  @override
  _CuentaScreenState createState() => _CuentaScreenState();
}

class _CuentaScreenState extends State<CuentaScreen> {
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Color(0xFF1b4ee4); // Color azul

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            color: primaryColor,
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 2),
            color: Color(0xFFe6e7f8), // Color de fondo claro
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.2),
              CircleAvatar(
                radius: 50,
                child: Icon(Icons.person, size: 60, color: primaryColor),
                backgroundColor: Color(0xFFe6e7f8),
              ),
              Text(
                '[Nombre Completo]',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 16),
              Card(
                elevation: 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildListTile(
                        title: 'Editar datos personales',
                        icon: Icons.edit,
                      ),
                      _buildListTile(
                        title: 'Notificaciones',
                        icon: Icons.notifications,
                      ),
                      _buildListTile(
                        title: 'Autos',
                        icon: Icons.directions_car,
                      ),
                      _buildListTile(
                        title: 'Cerrar sesión',
                        icon: Icons.exit_to_app,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => SignUpParkingPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          textStyle:
                              TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        child: Text(
                          'Registrar mi parqueo',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildListTile({
    required String title,
    required IconData icon,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
      onTap: () {
        // Acción para cada opción
      },
    );
  }
}

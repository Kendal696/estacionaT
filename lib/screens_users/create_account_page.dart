import 'package:flutter/material.dart';

import 'login_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  String vehicleType = 'Automóvil';

  @override
  Widget build(BuildContext context) {
    Color myColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Crea tu cuenta",
                style: TextStyle(
                  color: Color(0xFF1b4ee4),
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              _buildGreyText("Nombre completo"),
              _buildInputField(nameController,
                  icon: Icons.person, focusNode: nameFocusNode),
              const SizedBox(height: 20),
              _buildGreyText("Correo Electrónico"),
              _buildInputField(emailController,
                  icon: Icons.email, focusNode: emailFocusNode),
              const SizedBox(height: 20),
              _buildGreyText("Número Telefónico"),
              _buildInputField(phoneController,
                  icon: Icons.phone, focusNode: phoneFocusNode),
              const SizedBox(height: 20),
              _buildGreyText("Tipo de Vehículo"),
              _buildVehicleTypeDropdown(),
              const SizedBox(height: 20),
              _buildGreyText("Contraseña"),
              _buildPasswordInputField(passwordController, passwordFocusNode,
                  "Contraseña", obscurePassword),
              const SizedBox(height: 20),
              _buildGreyText("Confirmar contraseña"),
              _buildPasswordInputField(
                  confirmPasswordController,
                  confirmPasswordFocusNode,
                  "Confirmar contraseña",
                  obscureConfirmPassword),
              const SizedBox(height: 40),
              _buildSignUpButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGreyText(String text) {
    return Text(text, style: const TextStyle(color: Colors.grey));
  }

  Widget _buildInputField(TextEditingController controller,
      {IconData? icon, FocusNode? focusNode}) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        prefixIcon: icon != null ? Icon(icon) : null,
      ),
    );
  }

  Widget _buildPasswordInputField(TextEditingController controller,
      FocusNode focusNode, String label, bool obscureText) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              if (focusNode == passwordFocusNode) {
                obscurePassword = !obscurePassword;
              } else {
                obscureConfirmPassword = !obscureConfirmPassword;
              }
            });
          },
        ),
      ),
    );
  }

  Widget _buildVehicleTypeDropdown() {
    return DropdownButtonFormField<String>(
      value: vehicleType,
      items: <String>['Automóvil', 'Motocicleta', 'Cuadratrack', 'Bicicleta']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          vehicleType = newValue!;
        });
      },
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.directions_car),
      ),
    );
  }

  Widget _buildSignUpButton() {
    return ElevatedButton(
      onPressed: () {
        // Navegar a la página de inicio de sesión
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LoginPage()));
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF1b4ee4),
        minimumSize: const Size.fromHeight(50), // Ajusta la altura del botón
      ),
      child: const Text(
        "Registrar",
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}

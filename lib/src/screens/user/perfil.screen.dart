import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/components/custom_text_field.dart';
import 'package:greengrocer/src/core/constants/endpoint.dart';
import 'package:greengrocer/src/core/theme/colors_theme.dart';
import 'package:greengrocer/src/core/config/app_data.dart' as app_data;
import 'package:greengrocer/src/screens/auth/controller/auth_controller.dart';
import 'package:greengrocer/src/services/util_services.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController celularController = TextEditingController();
  final authcontroller = Get.find<AuthController>();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu perfil'),
        centerTitle: true,
        backgroundColor: ColorsTheme.customSwatchColor,
        actions: [
          IconButton(
            onPressed: () {
              authcontroller.signOut();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  CustomTextField(
                    label: Text('Email'),
                    keyboardtype: TextInputType.emailAddress,
                    icon: Icons.email,
                    controller: emailController,
                  ),
                  CustomTextField(
                    label: Text('Nome'),
                    keyboardtype: TextInputType.name,
                    icon: Icons.person,
                    controller: nameController,
                  ),
                  CustomTextField(
                    label: Text('Celular'),
                    keyboardtype: TextInputType.phone,
                    icon: Icons.phone,
                    inputFormatters: [UtilServices.cpftelefone],
                    controller: celularController,
                  ),
                  CustomTextField(
                    label: Text('CPF'),
                    keyboardtype: TextInputType.number,
                    icon: Icons.app_registration,
                    isSecret: true,
                    inputFormatters: [UtilServices.cpfFormatter],
                    controller: cpfController,
                  ),
                ],
              ),
            ),

            OutlinedButton(
              onPressed: () => updatePassword(),
              child: Text('Atualizar senha'),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool?> updatePassword() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Atualizar Senha',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      label: Text('Senha atual'),
                      keyboardtype: TextInputType.number,
                      icon: Icons.password,
                      isSecret: true,
                    ),
                    CustomTextField(
                      label: Text('Nova senha'),
                      keyboardtype: TextInputType.number,
                      icon: Icons.password,
                      isSecret: true,
                    ),
                    CustomTextField(
                      label: Text('Confirmar nova senha'),
                      keyboardtype: TextInputType.number,
                      icon: Icons.password,
                      isSecret: true,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      label: Text(
                        "Atualizar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 10,
                top: 5,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

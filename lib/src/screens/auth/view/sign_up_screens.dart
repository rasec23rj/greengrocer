import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/components/custom_text_field.dart';
import 'package:greengrocer/src/core/config/app_data.dart';
import 'package:greengrocer/src/core/theme/colors_theme.dart';
import 'package:greengrocer/src/models/user_model.dart';
import 'package:greengrocer/src/screens/auth/controller/auth_controller.dart';
import 'package:greengrocer/src/services/util_services.dart';
import 'package:greengrocer/src/services/validators.dart';

class SignUpScreens extends StatefulWidget {
  const SignUpScreens({super.key});

  @override
  State<SignUpScreens> createState() => _SignUpScreensState();
}

class _SignUpScreensState extends State<SignUpScreens> {
  final _formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final phoneEC = TextEditingController();
  final cpfEC = TextEditingController();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsTheme.customSwatchColor,
      appBar: AppBar(
        title: const Text('Cadastro'),
        backgroundColor: ColorsTheme.customSwatchColor,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.lightGreen,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                          style: TextStyle(fontSize: 40),
                          children: [
                            TextSpan(
                              text: 'Cadastro',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 40,
                ),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextField(
                          label: Text("Nome"),
                          icon: Icons.person,
                          controller: nameEC,
                        ),
                        CustomTextField(
                          label: Text("Telefone"),
                          icon: Icons.phone,
                          controller: phoneEC,
                          validator: phoneValidator,
                          keyboardtype: TextInputType.phone,
                          isSecret: false,
                          inputFormatters: [UtilServices.cpftelefone],
                        ),
                        CustomTextField(
                          label: Text("CPF"),
                          controller: cpfEC,
                          icon: Icons.app_registration,
                          validator: cpfValidator,
                          keyboardtype: TextInputType.number,
                          inputFormatters: [UtilServices.cpfFormatter],
                        ),
                        CustomTextField(
                          label: Text("Email"),
                          icon: Icons.email,
                          controller: emailEC,
                          validator: emailValidator,
                        ),
                        CustomTextField(
                          label: Text("Senha"),
                          icon: Icons.password,
                          isSecret: true,
                          validator: passwordValidator,
                          controller: passwordEC,
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 50,
                          child: Obx(() {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightGreen,
                              ),
                              onPressed: authController.isLoading.value
                                  ? null
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        UserModel user = UserModel(
                                          name: nameEC.text,
                                          email: emailEC.text,
                                          password: passwordEC.text,
                                          phone: phoneEC.text,
                                          cpf: cpfEC.text,
                                        );

                                        authController.signUp(user);
                                      }
                                    },
                              child: authController.isLoading.value
                                  ? CircularProgressIndicator.adaptive()
                                  : Text(
                                      'Salvar',
                                      style: TextStyle(color: Colors.white),
                                    ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

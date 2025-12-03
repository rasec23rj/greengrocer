import 'package:flutter/material.dart';
import 'package:greengrocer/src/components/custom_text_field.dart';
import 'package:greengrocer/src/core/theme/colors_theme.dart';
import 'package:greengrocer/src/services/util_services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreens extends StatefulWidget {
  const SignUpScreens({super.key});

  @override
  State<SignUpScreens> createState() => _SignUpScreensState();
}

class _SignUpScreensState extends State<SignUpScreens> {
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomTextField(label: Text("Nome"), icon: Icons.person),
                      CustomTextField(
                        label: Text("Telefone"),
                        icon: Icons.phone,
                        keyboardtype: TextInputType.phone,
                        isSecret: false,
                        inputFormatters: [UtilServices.cpftelefone],
                      ),
                      CustomTextField(
                        label: Text("CPF"),
                        icon: Icons.app_registration,
                        keyboardtype: TextInputType.number,
                        inputFormatters: [UtilServices.cpfFormatter],
                      ),
                      CustomTextField(label: Text("Email"), icon: Icons.email),
                      CustomTextField(
                        label: Text("Senha"),
                        icon: Icons.password,
                        isSecret: true,
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightGreen,
                          ),
                          onPressed: () {},
                          child: Text(
                            'Salvar',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
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

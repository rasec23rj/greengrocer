import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greengrocer/src/core/config/app_pages.dart';
import 'package:greengrocer/src/screens/auth/controller/auth_controller.dart';
import 'package:greengrocer/src/screens/auth/view/sign_up_screens.dart';
import 'package:greengrocer/src/screens/base/base_screen.dart';
import 'package:greengrocer/src/components/custom_text_field.dart';
import 'package:greengrocer/src/core/theme/colors_theme.dart';
import 'package:greengrocer/src/services/validators.dart';

class SignInScreens extends StatelessWidget {
  const SignInScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: ColorsTheme.customSwatchColor,
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
                              text: 'Green',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'Grocer',
                              style: TextStyle(
                                color: ColorsTheme.customContrastColor,

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
                  //ctegorias
                  SizedBox(
                    height: 30,
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'Agne',
                      ),
                      child: AnimatedTextKit(
                        pause: Duration.zero,
                        repeatForever: true,
                        animatedTexts: [
                          FadeAnimatedText("Frutas"),
                          FadeAnimatedText("Verduras"),
                          FadeAnimatedText("Legumes"),
                          FadeAnimatedText("Carnes"),
                          FadeAnimatedText("Cereais"),
                          FadeAnimatedText("Laticinios"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
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
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CustomTextField(
                          label: Text("Email"),
                          controller: emailController,
                          icon: Icons.email,
                          validator: emailValidator,
                        ),
                        CustomTextField(
                          label: Text("Senha"),
                          icon: Icons.password,
                          controller: passwordController,
                          isSecret: true,
                          validator: passwordValidator,
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 50,
                          child: GetX<AuthController>(
                            builder: (authController) {
                              return ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightGreen,
                                ),
                                onPressed: authController.isLoading.value
                                    ? null
                                    : () {
                                        if (formKey.currentState!.validate()) {
                                          FocusScope.of(context).unfocus();
                                          String email = emailController.text;
                                          String password =
                                              passwordController.text;
                                          authController.signIn(
                                            email: email,
                                            password: password,
                                          );
                                        }
                                      },
                                child: authController.isLoading.value
                                    ? CircularProgressIndicator.adaptive()
                                    : Text(
                                        'Entrar',
                                        style: TextStyle(color: Colors.white),
                                      ),
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Esqueceu a senha',
                              style: TextStyle(
                                color: ColorsTheme.customContrastColor,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                color: Colors.lightGreen,
                                thickness: 2,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                              ),
                              child: Text("OU"),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.lightGreen,
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 50,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(
                                width: 2,
                                color: Colors.lightGreen,
                              ),
                            ),
                            onPressed: () {
                              Get.toNamed(Routes.signup);
                            },
                            child: Text(
                              'Criar conta',
                              style: TextStyle(color: Colors.lightGreen),
                            ),
                          ),
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

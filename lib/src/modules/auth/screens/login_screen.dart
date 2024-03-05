import 'package:curriculum_front/src/modules/auth/controllers/auth_controller/auth_controller.dart';
import 'package:curriculum_front/src/modules/auth/controllers/form_controller/form_controller.dart';
import 'package:curriculum_front/src/modules/auth/widget/observer_button.dart';
import 'package:curriculum_front/src/modules/auth/widget/observer_text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    final authController = Modular.get<AuthController>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auth"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:16.0, right: 16.0, top: 32.0),
        child: Column(
          children: [
             ObserverTextField(
                 obscureText: false,
                 hintText: "Login",
                 labelText: "Digite seu login",
                 onChanged: authController.formController.setLogin,
                 errorText: authController.validateLogin()
             ),
            const SizedBox(
              height: 20,
            ),
            ObserverTextField(
                obscureText: true,
                hintText: "Senha",
                labelText: "Digite sua senha",
                onChanged: authController.formController.setPassword,
                errorText: authController.validatePassword()
            ),
            ObserverButton(onPressed: () async {
              await authController.login();
            }, child: const Text("Entrar")),
            const SizedBox(
              height: 80,
            ),

            /// Implementação Futura:
            // ObserverButton(onPressed: () async {
            //   Modular.to.pushNamed("/register/");
            // }, child: const Text("Cadastrar-se"))
          ],
        ),
      ),
    );
  }
}

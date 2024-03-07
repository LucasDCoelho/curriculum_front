import 'package:curriculum_front/src/modules/auth/controllers/auth_controller/auth_controller.dart';
import 'package:curriculum_front/src/modules/auth/widget/observer_button.dart';
import 'package:curriculum_front/src/modules/auth/widget/observer_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Modular.get<AuthController>();
    String? loginError = authController.validateLogin();
    String? passwordError = authController.validatePassword();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Auth"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 32.0),
        child: Column(
          children: [
            ObserverTextField(
                obscureText: false,
                hintText: "Login",
                labelText: "Digite seu login",
                onChanged: authController.formController.setLogin,
                errorText: loginError),
            const SizedBox(
              height: 20,
            ),
            ObserverTextField(
                obscureText: true,
                hintText: "Senha",
                labelText: "Digite sua senha",
                onChanged: authController.formController.setPassword,
                errorText: passwordError),
            ObserverButton(
                onPressed: () async {
                  authController.isLoading
                      ? null
                      : await authController.login();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        // Cor cinza forte quando o botão está desativado
                        return Colors.grey[700]!;
                      }
                      // Cor verde quando o botão está habilitado
                      return Colors.green;
                    },
                  ),
                  foregroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      // Texto branco para ambos os estados
                      return Colors.white;
                    },
                  ),
                ),
                child: const Text("Entrar")),
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

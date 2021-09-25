import 'package:borderhacks_client/ui/components/TextField/email_text_field.dart';
import 'package:borderhacks_client/ui/components/TextField/password_text_field.dart';
import 'package:borderhacks_client/ui/components/button/login_button.dart';
import 'package:borderhacks_client/ui/view/base_view.dart';
import 'package:borderhacks_client/viewmodels/login_viewmodel.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      onModelReady: (model) => model.onModelReady(),
      onModelDestroy: (model) => model.onModelDestroy(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Center(
            child: Form(
              key: model.formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                    left: 20,
                    right: 20,
                    bottom: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 0, 8),
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            fontSize: 23,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      EmailTextField(usernameController: model.emailController),
                      const SizedBox(height: 20),
                      PasswordTextField(
                          passwordController: model.passwordController),
                      const SizedBox(height: 20),
                      LogInButton(
                        () {
                          FocusScope.of(context).unfocus();
                          model.formKey.currentState!.validate() ? null : null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

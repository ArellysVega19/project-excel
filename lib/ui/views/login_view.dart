import 'package:admin_dashboard/api/solicitud_api.dart';
import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/login_form_provider.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final api = SolicitudApi();

    return ChangeNotifierProvider(
      create: (_) => LoginFormProvider(),
      child: Builder(
        builder: (context) {
          final loginFormProvider =
              Provider.of<LoginFormProvider>(context, listen: false);

          void sendLogin() async {
            final isValid = loginFormProvider.validateForm();
            if (isValid) {
              final ticket = await api.queryUsers(
                  loginFormProvider.usuario, loginFormProvider.password);
              if (ticket.length >= 1) {
                authProvider.login(loginFormProvider.usuario,
                    loginFormProvider.password, ticket.first);
              } else {
                NotificationsService.showSnackbarError(
                    'Usuario / Password no válidos');
              }
            }
          }

          return Container(
            margin: EdgeInsets.only(top: 100),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 370),
                child: Form(
                    key: loginFormProvider.formkey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese su identificacion';
                            }
                            if (value.length <= 2) {
                              return 'La identificacion debe ser mayor a 2 caracteres';
                            }

                            return null;
                          },
                          onChanged: (value) {
                            loginFormProvider.usuario = value;
                          },
                          style: TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: 'Ingrese Su Identificacion',
                              label: 'Identificacion',
                              icon: Icons.person),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (value) {
                            loginFormProvider.password = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Ingrese su password';
                            }

                            if (value.length < 6) {
                              return 'La password debe ser mayor o igual a 10 caracteres ';
                            }

                            return null;
                          },
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          decoration: CustomInputs.loginInputDecoration(
                              hint: '******',
                              label: 'Password',
                              icon: Icons.lock_outline_rounded),
                          onEditingComplete: () async {
                            sendLogin();
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomOutlinedButton(
                            onPressed: () async {
                              sendLogin();
                            },
                            text: 'Ingresar'),
                      ],
                    )),
              ),
            ),
          );
        },
      ),
    );
  }
}

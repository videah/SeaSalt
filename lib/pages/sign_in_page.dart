import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seasalt/widgets/desktop_title_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:seasalt/cubits/login_cubit.dart';
import 'package:seasalt/cubits/login_state.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WindowAppBar(
        child: AppBar(
          title: const Text("Sign In"),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 400,
            ),
            child: SignInCard(),
          ),
        ),
      ),
    );
  }
}

class SignInCard extends StatelessWidget {
  /// A key to handle form validation.
  final _formKey = GlobalKey<FormState>();

  /// A controller to get the username.
  final _usernameController = TextEditingController();

  /// A controller to get the API key.
  final _apiKeyController = TextEditingController();

  SignInCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _usernameController,
                autofocus: true,
                decoration: const InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a username";
                  }
                  return null;
                },
              ),
              const Divider(),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _apiKeyController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "API Key",
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter an API key";
                        }
                        return null;
                      },
                    ),
                  ),
                  IconButton(
                    tooltip: "Generate API Key",
                    icon: const Icon(Icons.get_app),
                    onPressed: () => launch("https://e926.net/users/0/api_key"),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Some features require an e621/e926 account. SeaSalt needs an API key linked to your account, which you can get using the button next to the field.",
                  textAlign: TextAlign.center,
                ),
              ),
              BlocListener<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: ListTile(
                          title: const Text("Oops, something went wrong..."),
                          subtitle: Text(state.message),
                          leading: const Icon(Icons.error, color: Colors.white),
                        ),
                      ),
                    );
                  }

                  if (state is LoginSuccess) {
                    Navigator.of(context).pop(true);
                  }
                },
                child: BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return const CircularProgressIndicator();
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ElevatedButton(
                        child: const Text("Sign In"),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final username = _usernameController.text;
                            final key = _apiKeyController.text;
                            context.read<LoginCubit>().login(username, key);
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

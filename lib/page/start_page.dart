import 'package:demoapp/controller/account_controller.dart';
import 'package:demoapp/controller/auth_controller.dart';
import 'package:demoapp/provider/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class StartPage extends ConsumerStatefulWidget {
  const StartPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StartPage();
}

class _StartPage extends ConsumerState<StartPage> {
  final key = GlobalKey<FormState>();
  String email = '';
  String password = '';
  bool isObscure = true;

  Future<void> createAccount() async {
    if (key.currentState!.validate() == true) {
      key.currentState!.save();
      final isCreated = await ref
          .read(authControllerProvider.notifier)
          .createUserWithEmail(email: email, password: password);
      Future.delayed(Duration.zero, () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Text(isCreated ? 'Successful!' : 'Error!'),
            actions: [
              TextButton(
                onPressed: () {
                  if (isCreated) {
                    ref
                        .read(authControllerProvider.notifier)
                        .sighInWithEmail(email: email, password: password);
                    ref.read(accountControllerProvider.notifier).createAccount(
                          id: ref
                                  .watch(firebaseAuthProvider)
                                  .currentUser
                                  ?.uid ??
                              '',
                          userName: 'aaaa',
                          birthDay: DateTime.now(),
                        );
                  }
                  context.goNamed('Home');
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      });
    }
  }

  Future<bool> logIn() async {
    if (key.currentState!.validate() == true) {
      key.currentState!.save();
      final isCreated = await ref
          .read(authControllerProvider.notifier)
          .sighInWithEmail(email: email, password: password);
      Future.delayed(Duration.zero, () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Text(isCreated ? 'Successful!' : 'Error!'),
            actions: [
              TextButton(
                onPressed: () {
                  context.goNamed('Home');
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      });
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: key,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child:
                        Image.asset('assets/images/Group-With-logos_black.png'),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    onTapOutside: (_) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    decoration: const InputDecoration(
                      labelText: 'E-mail Address',
                      hintText: 'sample@example.com',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your e-mail address.';
                      }
                      if (!value.contains('@')) {
                        return 'There is an error in your e-mail address.';
                      }
                      return null;
                    },
                    onSaved: (value) => setState(() => email = value!),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: isObscure,
                    keyboardType: TextInputType.visiblePassword,
                    onTapOutside: (_) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'More than 8 characters',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () => setState(() => isObscure = !isObscure),
                        icon: Icon(!isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password.';
                      }
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters.';
                      }
                      return null;
                    },
                    onSaved: (value) => setState(() => password = value!),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () async => await logIn(),
                    child: SizedBox(
                      width: size.width / 2,
                      child: const Center(
                        child: Text('ログイン'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async => await createAccount(),
                    child: SizedBox(
                      width: size.width / 2,
                      child: const Center(
                        child: Text('新規アカウント作成'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

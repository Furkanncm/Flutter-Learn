import 'package:flutter/material.dart';
import 'package:furkann/202/Cache/LogIn.dart';
import 'package:furkann/202/Cache/S%C4%B1gInViewModel.dart';

class SigInPageView extends StatefulWidget {
  const SigInPageView({super.key});

  @override
  State<SigInPageView> createState() => _SigInPageViewState();
}

class _SigInPageViewState extends SigInViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(labelTitle),
      ),
      body: Padding(
        padding: ProjectPadding().columnMargin,
        child: Column(
          children: [
            Form(
              key: globalKey,
              child: Column(
                children: [
                  validateMailFiled(mailController: mailController, labelMailAlert: labelMailAlert, labelMail: labelMail),
                  validatePasswordField(),
                  ElevatedButton.icon(
                      onPressed: () async {
                        await checkCondition(context);
                      },
                      icon: const Icon(Icons.check),
                      label: Text(labelTitle)),
                  ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return const LoginView();
                        }));
                      },
                      icon: const Icon(Icons.chevron_right),
                      label: Text(labelMailEmpty))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  customFormField validatePasswordField() {
    return customFormField(
                    validator: (value) {
                      return ((value!.length > 8) 
                          ? null
                          : labelPasswordAlert);
                    },
                    textEditingController: passwordController,
                    isVisible: isPasswordVisible,
                    suffixIcon: IconButton(
                      onPressed: () {
                        changePasswordVisible();
                      },
                      icon: isPasswordVisible
                          ? const Icon(Icons.visibility_off_outlined)
                          : const Icon(Icons.visibility_outlined),
                    ),
                    labeltext: labelPassword,
                    inputType: TextInputType.text,
                    icon: const Icon(Icons.lock_open_outlined));
  }
}

class validateMailFiled extends StatelessWidget {
  const validateMailFiled({
    super.key,
    required this.mailController,
    required this.labelMailAlert,
    required this.labelMail,
  });

  final TextEditingController mailController;
  final String labelMailAlert;
  final String labelMail;

  @override
  Widget build(BuildContext context) {
    return customFormField(
        textEditingController: mailController,
        validator: (value) {
          return (value?.isNotEmpty ?? false)
              ? null
              : labelMailAlert;
        },
        labeltext: labelMail,
        inputType: TextInputType.emailAddress,
        icon: const Icon(Icons.mail_outline_outlined));
  }
}

class customFormField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final TextInputType inputType;
  final Widget? suffixIcon;
  final String labeltext;
  final Icon icon;
  final bool? isVisible;
  const customFormField({
    super.key,
    required this.textEditingController,
    this.validator,
    required this.inputType,
    this.suffixIcon,
    required this.labeltext,
    required this.icon,
    this.isVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ProjectPadding().textFieldBottomPadding,
      child: TextFormField(
        controller: textEditingController,
        validator: validator,
        obscureText: isVisible ?? false,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          labelText: labeltext,
          prefixIcon: icon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}

class ProjectPadding {
  final columnMargin = const EdgeInsets.all(8.0);
  final textFieldBottomPadding = const EdgeInsets.only(bottom: 16.0);
  final textFieldTopPadding = const EdgeInsets.only(bottom: 8.0);
}

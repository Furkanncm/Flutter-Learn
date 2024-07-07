import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:furkann/202/Cache/LogIn.dart';
import 'package:furkann/202/Cache/S%C4%B1gInViewModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                      icon: Icon(Icons.check),
                      label: Text(labelTitle)),
                  ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginView();
                        }));
                      },
                      icon: Icon(Icons.chevron_right),
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
                          ? Icon(Icons.visibility_off_outlined)
                          : Icon(Icons.visibility_outlined),
                    ),
                    labeltext: labelPassword,
                    inputType: TextInputType.text,
                    icon: Icon(Icons.lock_open_outlined));
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
        icon: Icon(Icons.mail_outline_outlined));
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
    Key? key,
    required this.textEditingController,
    this.validator,
    required this.inputType,
    this.suffixIcon,
    required this.labeltext,
    required this.icon,
    this.isVisible,
  }) : super(key: key);

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
          suffixIcon: suffixIcon ?? null,
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
  final columnMargin = EdgeInsets.all(8.0);
  final textFieldBottomPadding = EdgeInsets.only(bottom: 16.0);
  final textFieldTopPadding = EdgeInsets.only(bottom: 8.0);
}

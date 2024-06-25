import 'package:flutter/material.dart';

class ServicePostModel extends StatefulWidget {
  const ServicePostModel({super.key});

  @override
  State<ServicePostModel> createState() => _ServicePostModelState();
}

class _ServicePostModelState extends State<ServicePostModel> {
  final String title = "Title";
  final String body = "Body";
  final String Id = "Id";
  final String userId = "UserId";
  final String check = "Check & Post";
  final String appbarTitle = "Service Post Model";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(appbarTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _customTextField(
                    text: userId, inputType: TextInputType.number),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    _customTextField(text: Id, inputType: TextInputType.number),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _customTextField(
                  text: title,
                  inputType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    _customTextField(text: body, inputType: TextInputType.text),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.check),
                    label: Text(check),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      shadowColor: Colors.blue,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                    )),
              )
            ],
          ),
        ));
  }
}

class _customTextField extends StatelessWidget {
  final String text;
  final TextInputType inputType;
  const _customTextField({
    Key? key,
    required this.text,
    required this.inputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: text,
        hintText: text,
        border: OutlineInputBorder(),
      ),
    );
  }
}

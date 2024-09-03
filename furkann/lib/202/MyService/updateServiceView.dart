import 'package:flutter/material.dart';
import 'package:furkann/202/MyService/service.dart';
import 'package:furkann/202/service/service_post_view.dart';

class UpdateServiceView extends StatefulWidget {
  const UpdateServiceView({super.key});

  @override
  State<UpdateServiceView> createState() => _UpdateServiceViewState();
}

class _UpdateServiceViewState extends State<UpdateServiceView> {
  late final TextEditingController _updateIdController;
  late final IService _service;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _updateIdController = TextEditingController();
    _service = Service();
  }

  void fetchSpesific() {
    final response = _service
        .getSpecialItems(int.tryParse(_updateIdController.text) ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update & Delete Service View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            customTextField(
                controller: _updateIdController,
                text: "The userID you want to UPDATE",
                inputType: TextInputType.number),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                  onPressed: () {
                    fetchSpesific();
                  },
                  icon: const Icon(Icons.find_in_page_outlined),
                  label: const Text("Search User")),
            ),
          ],
        ),
      ),
    );
  }
}

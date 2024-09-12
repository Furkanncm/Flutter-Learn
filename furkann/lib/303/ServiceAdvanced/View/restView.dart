import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../Service/restService.dart';
import '../ViewModel/restProvider.dart';
import '../ViewModel/restViewModel.dart';
import '../../../product/global/theme_notifer.dart';
import 'package:provider/provider.dart';

class RestView extends StatefulWidget {
  const RestView({super.key});

  @override
  State<RestView> createState() => _RestViewState();
}

class _RestViewState extends restViewModel {
  @override
  final Dio manager =
      Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));
  late final IRestService mana;

  @override
  void initState() {
    super.initState();
    mana = RestService(manager);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestProvider>(create: (context) {
      return RestProvider(mana);
    }, builder: (context, child) {
      return Padding(
        padding: const EdgeInsets.all(3.0),
        child: Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: () {
            context.read<ThemeNotifer>().changeTheme();
            print(context.read<ThemeNotifer>().currentTheme.bottomSheetTheme);
          }),
          appBar: AppBar(
            title: context.watch<RestProvider>().isLoading
                ? const CircularProgressIndicator.adaptive()
                : const Text("Company Person List"),
          ),
          body: ListView.builder(
            itemCount: user?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return Selector<RestProvider, bool>(
                  builder: (context, value, child) {
                return value
                    ? const Placeholder()
                    : Card(
                        elevation: 5,
                        surfaceTintColor: Colors.indigo,
                        shadowColor: Colors.blue,
                        child: ListTile(
                          title: Text(
                              context.watch<RestProvider>().user[index].name ??
                                  ""),
                          subtitle: Text(context
                                  .watch<RestProvider>()
                                  .user[index]
                                  .email ??
                              ""),
                          trailing: IconButton.outlined(
                              onPressed: () {},
                              icon: const Icon(Icons.attachment_outlined)),
                        ),
                      );
              }, selector: (context, provider) {
                return provider.isLoading;
              });
            },
          ),
        ),
      );
    });
  }
}

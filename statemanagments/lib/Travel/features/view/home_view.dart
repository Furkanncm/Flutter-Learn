import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../../Login&OnBoard/product/padding/page_padding.dart';
import '../../product/lang/travel_lang.dart';
import '../service/service.dart';
import '../viewmodel/travel_viewmodel.dart';
import '../../product/widgets/custom_row.dart';
import '../../product/widgets/destination_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin {
  late final TravelViewModel viewmodel =
      TravelViewModel(service: Service(dio: Dio()));

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const PagePadding.all(),
        child: Column(
          children: [
            const CustomText(text: TravelLang.hey),
            const CustomText(text: TravelLang.goFor),
            const SearchBar(leading: Icon(Icons.search_outlined)),
            CustomRow(
                viewmodel: viewmodel,
                onPressed: () {
                  viewmodel.changeIsVisibleTop();
                },
                text: TravelLang.top),
            Expanded(
                flex: 2,
                child: Observer(builder: (_) {
                  return _PageView(Axis.horizontal, viewmodel.isVisibleTop);
                })),
            CustomRow(
                viewmodel: viewmodel,
                onPressed: () {
                  viewmodel.changeIsVisibleBottom();
                },
                text: TravelLang.featureDest),
            Expanded(
                flex: 2,
                child: Observer(builder: (_) {
                  return _PageView(Axis.vertical, viewmodel.isVisibleBottom);
                })),
          ],
        ),
      ),
    );
  }

  Observer _PageView(Axis scrollDirection, bool isVisible) {
    return Observer(builder: (_) {
      return viewmodel.isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : isVisible
              ? PageView.builder(
                  scrollDirection: scrollDirection,
                  controller: PageController(viewportFraction: 0.7),
                  itemCount: viewmodel.items.length,
                  itemBuilder: (context, index) {
                    return Observer(builder: (_) {
                      return DestinationCard(
                        model: viewmodel.items[index],
                        viewmodel: viewmodel,
                      );
                    });
                  })
              : SizedBox.shrink();
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class CustomText extends StatelessWidget {
  final String text;
  const CustomText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}

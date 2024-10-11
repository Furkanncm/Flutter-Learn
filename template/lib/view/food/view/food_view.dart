import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:template/core/components/text/card_text.dart';
import 'package:template/core/extensions/context_extension.dart';
import 'package:template/core/init/language/locale_keys.g.dart';
import 'package:template/view/food/_product/enum/tabbar_enum.dart';
import 'package:template/view/food/_product/extension/food_tabbar_extension.dart';
import 'package:template/view/food/_widget/filter_button.dart';

import '../../../core/components/button/normal_icon_button.dart';
import '../_widget/menu_card.dart';
import '../cubit/food_cubit.dart';

class FoodView extends StatefulWidget {
  const FoodView({super.key});
  @override
  State<FoodView> createState() => _FoodViewState();
}

class _FoodViewState extends State<FoodView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodCubit()..fetchUsers(),
      child: BlocConsumer<FoodCubit, FoodCubitState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: const Icon(Icons.set_meal_rounded),
              actions: [Padding(padding: context.rightNormal, child: const CircleAvatar())],
            ),
            body: Padding(
              padding: context.paddingNormal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(flex: 3, child: _SearchCard()),
                  Expanded(flex: 1, child: CardText(text: LocaleKeys.category, textStyle: Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w400))),
                  const Expanded(flex: 1, child: _ListViewBuilder()),
                  Expanded(
                      flex: 4,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: context.read<FoodCubit>().users?[0].recipes?.length??0,
                        itemBuilder: (BuildContext context, int index) {
                          return MenuCard(model: FoodCubit().users?[0].recipes?[index]);
                        },
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ListViewBuilder extends StatelessWidget {
  const _ListViewBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: FoodTabbarEnum.values.length,
      itemBuilder: (BuildContext context, int index) {
        return listViewRow(index, context);
      },
    );
  }

  Widget listViewRow(int index, BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: context.rightNormal,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              )),
          onPressed: () {},
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NormalIconButton(
                  onPressed: null,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: FoodTabbarEnum.values[index].icon("https://picsum.photos/200"),
                  )),
              Center(
                  child: Text(
                FoodTabbarEnum.values[index].name,
                style: const TextStyle(color: Colors.black),
              )),
            ],
          )),
    );
  }
}

class _SearchCard extends StatelessWidget {
  const _SearchCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardText(
              text: LocaleKeys.letsEat,
              textStyle: Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w400, fontSize: 30),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(decoration: InputDecoration(hintText: LocaleKeys.search, border: const OutlineInputBorder(), prefixIcon: Icon(Icons.search, color: Theme.of(context).iconTheme.color?.withOpacity(0.5)))),
                ),
                FilterButton(onPressed: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}

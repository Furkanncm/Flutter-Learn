import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/components/button/normal_icon_button.dart';
import '../../../core/components/text/card_text.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../_product/enum/filter_enum.dart';
import '../_product/extension/food_tabbar_extension.dart';
import '../_widget/filter_button.dart';
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
      create: (context) => FoodCubit()..fetchRecipes(),
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
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(flex: 3, child: _SearchCard()),
                  Expanded(flex: 1, child: _ListViewBuilder()),
                  Expanded(flex: 4, child: _MenuView()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MenuView extends StatelessWidget {
  const _MenuView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodCubit, FoodCubitState>(
      builder: (context, state) {
        if (state is ItemLoaded && state.recieps != null && state.recieps!.isNotEmpty) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.recieps!.length,
            itemBuilder: (BuildContext context, int index) {
              return MenuCard(model: state.recieps![index]);
            },
          );
        } else if (state is FoodCubitInitial) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else {
          return const Center(child: Text(LocaleKeys.notFound));
        }
      },
    );
  }
}

class _ListViewBuilder extends StatelessWidget {
  const _ListViewBuilder();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: FilterEnum.values.length,
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
          onPressed: () {
            context.read<FoodCubit>().filterBy(FilterEnum.values[index]);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NormalIconButton(onPressed: null, color: Colors.white, child: Padding(padding: const EdgeInsets.all(6.0), child: FilterEnum.values[index].icon)),
              Center(child: Text(FilterEnum.values[index].name, style: const TextStyle(color: Colors.black))),
            ],
          )),
    );
  }
}

class _SearchCard extends StatelessWidget {
  const _SearchCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: context.paddingNormal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            CardText(
              text: LocaleKeys.letsEat,
              textStyle: Theme.of(context).textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w400, fontSize: 30),
            ),
            const Spacer(),
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

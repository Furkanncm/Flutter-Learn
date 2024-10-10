import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'game_card.dart';
import '../cubit/dashboard_cubit.dart';

import '../../../core/components/text/normal_board_text.dart';
import '../../../core/init/language/locale_keys.g.dart';
import '../model/game_model.dart';

class RowCards extends StatelessWidget {
  final DashboardCubitState state;
  final String text;
  const RowCards({
    super.key,
    required this.state,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NormalBoardText(text: text, textStyle: Theme.of(context).textTheme.bodySmall),
            NormalBoardText(text: LocaleKeys.viewAll, textStyle: Theme.of(context).textTheme.bodySmall),
          ],
        ),
        state is DashboardCubitInitial
            ? const Center(child: CircularProgressIndicator.adaptive())
            : Expanded(
                flex: 2,
                child: BlocBuilder<DashboardCubit, DashboardCubitState>(
                  builder: (context, state) {
                    return GridView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: state is ItemLoaded ? state.gameItems.length : 0,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
                        itemBuilder: (context, index) {
                          return GameCard(state: state, model: state is ItemLoaded ? state.gameItems[index] : GameModel());
                        });
                  },
                ),
              ),
      ],
    );
  }
}

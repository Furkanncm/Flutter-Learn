import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../features/model/travel_model.dart';
import '../../features/viewmodel/travel_viewmodel.dart';

class DestinationCard extends StatefulWidget {
  final TravelModel model;
  final TravelViewModel viewmodel;
  const DestinationCard({
    Key? key,
    required this.model,
    required this.viewmodel,
  }) : super(key: key);

  @override
  State<DestinationCard> createState() => _DestinationCardState();
}

class _DestinationCardState extends State<DestinationCard> {
  void changeBookMarks(TravelModel model) {
    setState(() {
      model.isFav = !model.isFav;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.network(widget.model.thumbnailUrl ?? ""),
          ),
          Positioned(
            left: 0,
            right: 200,
            top: 120,
            child: Text(
              widget.model.title ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            left: 200,
            child: IconButton(
                onPressed: () {
                  changeBookMarks(widget.model);
                  widget.viewmodel.saveModel(widget.model);
                },
                icon: widget.model.isFav
                    ? const Icon(Icons.bookmark)
                    : const Icon(Icons.bookmark_border_outlined)),
          ),
        ],
      ),
    );
  }
}

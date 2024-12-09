import 'package:flutter/material.dart';
import 'package:news_app/home/widget/tap_item.dart';
import 'package:news_app/model/sources_response.dart';

// ignore: must_be_immutable
class TapContainer extends StatefulWidget {
  TapContainer({super.key, required this.sourcesList});
  List<Sources> sourcesList;

  @override
  State<TapContainer> createState() => _TapContainerState();
}

class _TapContainerState extends State<TapContainer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
            tabs: widget.sourcesList
                .map(
                  (source) => TapItem(
                    source: source,
                    isCleated:
                        selectedIndex == widget.sourcesList.indexOf(source),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}

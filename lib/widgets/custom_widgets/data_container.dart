import 'package:flutter/material.dart';
import 'package:dukaan/constants/constants.dart';
import 'package:dukaan/extensions/context_extension.dart';

class DataContainer extends StatelessWidget {
  const DataContainer({
    super.key,
    this.tableData = const SizedBox(),
    this.tableHeader = const SizedBox(),
    this.containerWidth,
    this.isGrid = false,
    this.itemCount = 15,
    this.withFooter = false,
    this.showLoading = false,
    this.show2Container = false,
    this.secondContainerWidth,
    this.showList = false,
    this.secondContainerChild = const SizedBox(),
    this.gridItemCard = const SizedBox(),
  });

  final double? containerWidth;
  final double? secondContainerWidth;
  final Widget tableHeader;
  final Widget tableData;
  final Widget gridItemCard;
  final bool isGrid;
  final bool show2Container;
  final int itemCount;
  final bool showList;
  final bool withFooter;
  final bool showLoading;
  final Widget secondContainerChild;
  @override
  Widget build(BuildContext context) {
    return show2Container
        ? Row(
            children: [
              Container(
                width: containerWidth,
                margin: EdgeInsets.only(
                    top: Sizes.MARGIN_8,
                    bottom: withFooter ? Sizes.MARGIN_8 : Sizes.MARGIN_30,
                    right: Sizes.MARGIN_30),
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.PADDING_12,
                  horizontal: Sizes.PADDING_40,
                ),
                decoration: BoxDecoration(
                  color: context.buttonTextColor,
                  border:
                      Border.all(color: context.primaryColorDark, width: 0.5),
                  borderRadius: BorderRadius.circular(
                    Sizes.RADIUS_6,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: Sizes.PADDING_10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.list,
                            color: context.iconColor1,
                            size: Sizes.WIDTH_30,
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: showList
                          ? ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: SizedBox(
                                    height: Sizes.HEIGHT_40,
                                    width: Sizes.WIDTH_40,
                                    child: Container(
                                      color: Colors.blue,
                                    ),
                                  ),
                                );
                              },
                            )
                          : GridView.builder(
                              itemCount: itemCount,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: 2 / 2.3,
                                      crossAxisCount: 3,
                                      mainAxisSpacing: Sizes.PADDING_8,
                                      crossAxisSpacing: Sizes.PADDING_14),
                              itemBuilder: (context, index) {
                                return gridItemCard;
                              },
                            ),
                    ),
                  ],
                ),
              ),
              Container(
                width: secondContainerWidth,
                margin: EdgeInsets.only(
                    top: Sizes.MARGIN_8,
                    bottom: withFooter ? Sizes.MARGIN_8 : Sizes.MARGIN_30,
                    right: Sizes.MARGIN_30),
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.PADDING_12,
                  horizontal: Sizes.PADDING_24,
                ),
                decoration: BoxDecoration(
                  color: const Color(
                    0xffe2f8f9,
                  ),
                  border: Border.all(
                    color: context.primaryColorDark,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(
                    Sizes.RADIUS_6,
                  ),
                ),
                child: secondContainerChild,
              ),
            ],
          )
        : Container(
            width: containerWidth,
            margin: EdgeInsets.only(
                top: Sizes.MARGIN_8,
                bottom: withFooter ? Sizes.MARGIN_8 : Sizes.MARGIN_30,
                right: Sizes.MARGIN_30),
            padding: const EdgeInsets.symmetric(
                vertical: Sizes.PADDING_12, horizontal: Sizes.PADDING_24),
            decoration: BoxDecoration(
              color: context.buttonTextColor,
              border: Border.all(color: context.primaryColorDark, width: 0.8),
              borderRadius: BorderRadius.circular(
                Sizes.RADIUS_6,
              ),
            ),
            child: showLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: context.primaryColor,
                    ),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // tableHeader,
                      isGrid
                          ? Flexible(
                              child: GridView.builder(
                                  itemCount: itemCount,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          childAspectRatio: 2 / 1.9,
                                          crossAxisCount: 5,
                                          crossAxisSpacing: Sizes.PADDING_10),
                                  itemBuilder: (context, index) {
                                    return gridItemCard;
                                  }),
                            )
                          : Flexible(
                              child: tableData,
                            ),
                    ],
                  ),
          );
  }
}

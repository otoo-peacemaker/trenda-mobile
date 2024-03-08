import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../../product_details/product_details_page.dart';
import 'provider/homepage_latest_provider.dart';

// ignore_for_file: must_be_immutable
class HomepageLatestPage extends StatefulWidget {
  const HomepageLatestPage({super.key});

  @override
  HomepageLatestPageState createState() => HomepageLatestPageState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomepageLatestProvider(),
      child: const HomepageLatestPage(),
    );
  }
}

class HomepageLatestPageState extends State<HomepageLatestPage>
    with AutomaticKeepAliveClientMixin<HomepageLatestPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    List<Item> items = [
      Item(
          title: 'Item 1',
          imageUrl: ImageConstant.imgFrame60,
          description: 'Description for Item 1',
          price: 10.0,
          tag: 'Tag 1',
          condition: 'New',
          type: 'Laptop',
          isBookedMarked: true),
      Item(
          title: 'Item 2',
          imageUrl: ImageConstant.imgFrame601,
          description: 'Description for Item 2',
          price: 20.0,
          tag: 'Tag 2',
          condition: 'Home Used',
          type: 'Vehicle',
          isBookedMarked: false),
      Item(
          title: 'Item 1',
          imageUrl: ImageConstant.imgFrame6012,
          description: 'Description for Item 1',
          price: 10.0,
          tag: 'Tag 1',
          condition: 'New',
          type: 'Vehicle',
          isBookedMarked: false),
      Item(
          title: 'Item 2',
          imageUrl: ImageConstant.imgFrame6013,
          description: 'Description for Item 2',
          price: 20.0,
          tag: 'Tag 2',
          condition: 'Used',
          type: 'Vehicle',
          isBookedMarked: true),
      Item(
          title: 'Item 1',
          imageUrl: ImageConstant.imgFrame6014,
          description: 'Description for Item 1',
          price: 10.0,
          tag: 'Tag 1',
          condition: 'New',
          type: 'Vehicle',
          isBookedMarked: false),
      Item(
          title: 'Item 2',
          imageUrl: ImageConstant.imgFrame60,
          description: 'Description for Item 2',
          price: 20.0,
          tag: 'Tag 2',
          condition: 'Used',
          type: 'Vehicle',
          isBookedMarked: false),

      Item(
          title: 'Item 1',
          imageUrl: ImageConstant.imgFrame60,
          description: 'Description for Item 1',
          price: 10.0,
          tag: 'Tag 1',
          condition: 'New',
          type: 'Vehicle',
          isBookedMarked: false),
      Item(
          title: 'Item 2',
          imageUrl: ImageConstant.imgFrame601,
          description: 'Description for Item 2',
          price: 20.0,
          tag: 'Tag 2',
          condition: 'Used',
          type: 'Vehicle',
          isBookedMarked: false),
      Item(
          title: 'Item 1',
          imageUrl: ImageConstant.imgFrame6012,
          description: 'Description for Item 1',
          price: 10.0,
          tag: 'Tag 1',
          condition: 'New',
          type: 'Vehicle',
          isBookedMarked: false),
      Item(
          title: 'Item 2',
          imageUrl: ImageConstant.imgFrame6013,
          description: 'Description for Item 2',
          price: 20.0,
          tag: 'Tag 2',
          condition: 'Used',
          type: 'Vehicle',
          isBookedMarked: false),
      Item(
          title: 'Item 1',
          imageUrl: ImageConstant.imgFrame6014,
          description: 'Description for Item 1',
          price: 10.0,
          tag: 'Tag 1',
          condition: 'Brand New',
          type: 'Vehicle',
          isBookedMarked: false),
      Item(
          title: 'Item 2',
          imageUrl: ImageConstant.imgFrame60,
          description: 'Description for Item 2',
          price: 20.0,
          tag: 'Tag 2',
          condition: 'Slightly Used',
          type: 'Vehicle',
          isBookedMarked: false),
      // Add more items as needed
    ];
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: CustomListView(items: items),
      ),
    );
  }
}

class Item {
  final String title;
  final String imageUrl;
  final String description;
  final double price;
  final String tag;
  final String condition;
  final String type;
  late bool isBookedMarked;

  Item(
      {required this.title,
      required this.imageUrl,
      required this.description,
      required this.price,
      required this.tag,
      required this.condition,
      required this.type,
      required this.isBookedMarked});
}

class CustomListView extends StatefulWidget {
  final List<Item> items;

  const CustomListView({super.key, required this.items});

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  List<bool> isBookmarkedList = [];

  @override
  void initState() {
    isBookmarkedList = List.generate(widget.items.length, (index) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: (widget.items.length / 2).ceil(), // Display two items per row
      itemBuilder: (context, index) {
        return Row(
          children: [
            Expanded(
              child: buildItemCard(context, widget.items[index * 2], index * 2),
            ),
            const SizedBox(width: 8), // Adjust spacing between items
            Expanded(
              child: (index * 2 + 1 < widget.items.length)
                  ? buildItemCard(
                      context, widget.items[index * 2 + 1], index * 2 + 1)
                  : const SizedBox(), // Check if the next item exists
            ),
          ],
        );
      },
    );
  }

  Widget buildItemCard(BuildContext context, Item item, int index) {
    return GestureDetector(
      child: Card(
        margin: EdgeInsets.all(8.adaptSize),
        child: Padding(
          padding: EdgeInsets.all(8.adaptSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CustomImageView(
                    radius: BorderRadius.all(Radius.circular(5.adaptSize)),
                    imagePath: item.imageUrl,
                  ), // Background image
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Chip(
                      side: const BorderSide(color: Colors.transparent),
                      label: Text(
                        item.tag,
                        style: CustomTextStyles.noticeTextStyle
                            .copyWith(fontSize: 10.fSize),
                      ),
                      backgroundColor:
                          appThemeColors.greenA100, // Tag background color
                    ),
                  ),
                  Positioned(
                    bottom: -2,
                    right: 3,
                    child: Card.filled(
                      elevation: 5.adaptSize,
                      shape: CircleBorder(
                          side: BorderSide(color: appThemeColors.whiteA700)),
                      child: IconButton(
                        color: item.isBookedMarked
                            ? appThemeColors.greenA400
                            : appThemeColors.gray400,
                        icon: const Icon(Icons.bookmark_border),
                        onPressed: () {
                          // Handle bookmark action
                          setState(() {
                            item.isBookedMarked = !item.isBookedMarked;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('\$${item.price.toStringAsFixed(2)}',
                        style: CustomTextStyles.itemHeaderTextStyle),
                    Text(
                      item.description,
                      style: CustomTextStyles.bodySmallBluegray800,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Chip(
                            side: const BorderSide(color: Colors.white),
                            label: Text(
                              item.condition,
                              style: CustomTextStyles.noticeTextStyle
                                  .copyWith(fontSize: 10.fSize),
                            ),
                            backgroundColor: appThemeColors
                                .gray10001, // Tag background color
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Chip(
                            side: const BorderSide(color: Colors.white),
                            label: Text(
                              item.type,
                              style: CustomTextStyles.noticeTextStyle
                                  .copyWith(fontSize: 10.fSize),
                            ),
                            backgroundColor: appThemeColors
                                .greenA100, // Tag background color
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        NavigatorService.pushNamed(
          AppRoutes.productDetailsPage,
          arguments: item,
        );
        debugPrint('Hey xup?');
      },
    );
  }
}

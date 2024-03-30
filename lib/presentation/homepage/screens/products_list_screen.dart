import 'package:auto_height_grid_view/auto_height_grid_view.dart';
import 'package:onyxsio_grid_view/onyxsio_grid_view.dart';

import '../../../../core/app_export.dart';
import '../models/response_models/get_all_posting_response_body.dart';

// ignore_for_file: must_be_immutable
class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, this.endpoint});

  final String? endpoint;

  @override
  ProductListScreenState createState() => ProductListScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePageProvider(),
      child: const ProductListScreen(),
    );
  }
}

class ProductListScreenState extends State<ProductListScreen>
    with AutomaticKeepAliveClientMixin<ProductListScreen> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: CustomListView(
          endpoint: widget.endpoint,
        ),
      ),
    );
  }
}

class CustomListView extends StatefulWidget {
  final String? endpoint;
  const CustomListView({super.key, this.endpoint});

  @override
  State<CustomListView> createState() => _CustomListViewState();
}

class _CustomListViewState extends State<CustomListView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(builder: (context, provider, child) {
      return FutureBuilder<GetAllPostingResponseBody?>(
          future: provider.getPostingsByATTL(endpoints: getAllPosting),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Return a loading indicator while data is being fetched
              return LoadingIndicator(
                  indicatorType: Indicator.ballPulse,

                  /// Required, The loading type of the widget
                  colors: [
                    Colors.green,
                    Colors.yellow,
                    appThemeColors.gray10001
                  ],

                  /// Optional, The color collections
                  strokeWidth: 2,

                  /// Optional, The stroke of the line, only applicable to widget which contains line
                  backgroundColor: Colors.white,

                  /// Optional, Background of the widget
                  pathBackgroundColor: Colors.orange

                  /// Optional, the stroke backgroundColor
                  );
            } else if (snapshot.hasError) {
              // Handle error state
              return Text('Error: ${snapshot.error}');
            } else {
              // Data fetched successfully, build the list view
              final postings = snapshot.data?.postingResponseData;

              debugPrint('::::::::::::::::::::::::$postings');
              if (postings == null) {
                CustomEasyLoading.showToast('No data found');
              }

              final itemLength = postings?.length.toDouble();
              return OnyxsioGridView.builder(
                padding: const EdgeInsets.all(8),
                // scrollDirection: Axis.horizontal,
                itemCount: itemLength?.toInt(),
                physics: const BouncingScrollPhysics(),
                staggeredTileBuilder: (index) =>
                    // OnyxsioStaggeredTile.count(2, index.isEven ? 2 : 1),
                    // OnyxsioStaggeredTile.extent(2, index.isEven ? 200 : 50),
                    const OnyxsioStaggeredTile.fit(1),
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                itemBuilder: (context, index) => OnyxsioGridTile(
                  index: index,
                  heightList: [itemLength!],
                  child: buildItemCard(context, postings![index], index),
                ),
              );
            }
          });
    });
  }

  Widget buildItemCard(
      BuildContext context, PostingDataResponse item, int index) {
    bool isBookedMarked = false;
    final uploadedFiles = item.uploadedFiles;
    final imgUrl = uploadedFiles?[0].url;

    String stringValue = itemConditionValues.reverse[item.itemCondition]!;

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
                    width: double.infinity,
                    radius: BorderRadius.all(Radius.circular(5.adaptSize)),
                    imagePath: imgUrl,
                    fit: BoxFit.cover,
                  ), // Background image
                  Positioned(
                    top: -7.adaptSize,
                    left: -1.adaptSize,
                    child: Chip(
                      side: const BorderSide(color: Colors.transparent),
                      label: Text(
                        maxLines: 2,
                        item.packageType!,
                        style: TextStyle(
                          fontSize: 10.fSize,
                          fontFamily: 'Gilroy-Regular',
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff005228),
                        ),
                      ),
                      backgroundColor:
                          appThemeColors.greenA100, // Tag background color
                    ),
                  ),
                  Positioned(
                    bottom: 2,
                    right: 3,
                    child: Card.filled(
                      elevation: 5.adaptSize,
                      shape: CircleBorder(
                          side: BorderSide(color: appThemeColors.whiteA700)),
                      child: IconButton(
                        color: appThemeColors.greenA400,
                        icon: const Icon(Icons.bookmark_border),
                        onPressed: () {
                          // Handle bookmark action
                          setState(() {
                            isBookedMarked = !isBookedMarked;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(5.0.adaptSize),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      maxLines: 2,
                      'Ghc ${item.amount}',
                      style: TextStyle(
                          fontSize: 14.fSize,
                          fontFamily: 'Gilroy-Bold',
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff00B557)),
                    ),
                    Text(
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      item.postTitle!,
                      style: TextStyle(
                        fontSize: 14.fSize,
                        fontFamily: 'Gilroy-Regular',
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff344054),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF2F4F7),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Align(
                              child: Text(
                                softWrap: true,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                stringValue,
                                style: TextStyle(
                                  fontSize: 10.fSize,
                                  fontFamily: 'Gilroy-Medium',
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff475467),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: const Color(0xffE6FFF2),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Align(
                              child: Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                item.category!,
                                style: TextStyle(
                                  fontSize: 10.fSize,
                                  fontFamily: 'Gilroy-Medium',
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xff008C44),
                                ),
                              ),
                            ),
                          ),
                        ),
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
        debugPrint('Hey I am going to the detail page');
      },
    );
  }
}

/*OnyxsioGridView.builder(
        padding: const EdgeInsets.all(8),
        // scrollDirection: Axis.horizontal,
        itemCount: 20,
        physics: const BouncingScrollPhysics(),
        staggeredTileBuilder: (index) =>
            // OnyxsioStaggeredTile.count(2, index.isEven ? 2 : 1),
            // OnyxsioStaggeredTile.extent(2, index.isEven ? 200 : 50),
            const OnyxsioStaggeredTile.fit(1),
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        itemBuilder: (context, index) => OnyxsioGridTile(
          index: index,
          heightList: const [150],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomImageView(
                  imagePath: categoriesData?[index].iconUrl,
                  height: 60.adaptSize,
                  width: 60.adaptSize,
                ),
              ),
              // buildWidgetSpace(height: 20),

              Expanded(
                  child: wrapCategoryText(categoriesData![index].category!)),

              Expanded(
                child: Text(
                  categoriesData[index].count.toString(),
                  softWrap: true,
                  style: TextStyle(
                    fontFamily: 'Gilroy-Medium',
                    fontSize: 12.fSize,
                    color: const Color(0xFF98A2B3),
                  ),
                ),
              ),
            ],
          ),
        ),
      )*/

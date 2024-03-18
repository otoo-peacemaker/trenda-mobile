import '../../../../core/app_export.dart';
import '../models/response_models/get_all_posting_response_body.dart';

// ignore_for_file: must_be_immutable
class HomePageProductList extends StatefulWidget {
  const HomePageProductList({super.key, this.endpoint});

  final String? endpoint;

  @override
  HomePageProductListState createState() => HomePageProductListState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePageProvider(),
      child: const HomePageProductList(),
    );
  }
}

class HomePageProductListState extends State<HomePageProductList>
    with AutomaticKeepAliveClientMixin<HomePageProductList> {
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

              final itemLength = postings?.length;
              return ListView.builder(
                itemCount:
                    (itemLength! / 2).ceil(), // Display two items per row
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: buildItemCard(
                            context, postings![index * 2], index * 2),
                      ),
                      const SizedBox(width: 8), // Adjust spacing between items
                      Expanded(
                        child: (index * 2 + 1 < itemLength)
                            ? buildItemCard(
                                context, postings[index * 2 + 1], index * 2 + 1)
                            : const SizedBox(), // Check if the next item exists
                      ),
                    ],
                  );
                },
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
                    imagePath: imgUrl,
                  ), // Background image
                  Positioned(
                    top: -7.adaptSize,
                    left: -1.adaptSize,
                    child: Chip(
                      side: const BorderSide(color: Colors.transparent),
                      label: Text(
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
                padding: EdgeInsets.all(8.0.adaptSize),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ghc ${item.amount}',
                      style: TextStyle(
                          fontSize: 14.fSize,
                          fontFamily: 'Gilroy-Bold',
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff00B557)),
                    ),
                    Text(
                      item.postTitle!,
                      style: TextStyle(
                        fontSize: 14.fSize,
                        fontFamily: 'Gilroy-Regular',
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff344054),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Chip(
                            side: const BorderSide(color: Colors.transparent),
                            label: Text(
                              item.itemCondition!.name.toString(),
                              style: TextStyle(
                                fontSize: 10.fSize,
                                fontFamily: 'Gilroy-Medium',
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff475467),
                              ),
                            ),
                            backgroundColor:
                                const Color(0xFFF2F4F7), // Tag background color
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Chip(
                            side: const BorderSide(color: Colors.transparent),
                            label: Text(
                              item.category!,
                              style: TextStyle(
                                fontSize: 10.fSize,
                                fontFamily: 'Gilroy-Medium',
                                fontWeight: FontWeight.w400,
                                color: const Color(0xff008C44),
                              ),
                            ),
                            backgroundColor:
                                const Color(0xffE6FFF2), // Tag background color
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
        debugPrint('Hey I am going to the detail page');
      },
    );
  }
}

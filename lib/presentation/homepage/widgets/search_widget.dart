import '../../../core/app_export.dart';
import '../models/response_models/get_all_posting_response_body.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, required this.postings});
  final List<PostingDataResponse> postings;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Show the searchable text widget
        showSearch(
            context: context,
            delegate: SearchDelegateWidget(postings: postings));
      },
      child: Container(
        height: 50.adaptSize,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
        child: Row(
          children: [
            CustomImageView(
              color: Colors.grey.shade600,
              imagePath: ImageConstant.imgSearch,
              height: 20.adaptSize,
              width: 20.adaptSize,
            ),
            const SizedBox(width: 10),
            Text(
              'Search for a product on Trenda',
              style: CustomTextStyles.bodyMediumGilroyRegularBluegray500,
            ),
          ],
        ),
      ),
    );
  }
}

class SearchDelegateWidget extends SearchDelegate<String> {
  late final List<PostingDataResponse> postings;
  SearchDelegateWidget({required this.postings});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = postings.where((item) =>
        item.postTitle!.toLowerCase().contains(query.toLowerCase()) ||
        item.category!.toLowerCase().contains(
            query.toLowerCase())); // Update to include subtitle search
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final item = results.elementAt(index);
        return ListTile(
          title: Text(item.postTitle!),
          subtitle: Text(item.category!), // Display subtitle
          onTap: () {
            close(context, item.postTitle!);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = postings
        .where((item) =>
            item.postTitle!.toLowerCase().contains(query.toLowerCase()) ||
            item.category!.toLowerCase().contains(
                query.toLowerCase())) // Update to include subtitle search
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final item = suggestions[index];
        return ListTile(
          leading: CustomImageView(
            height: 50,
            width: 50,
            radius: BorderRadius.circular(30),
            imagePath: item.uploadedFiles![0].url,
          ),
          title: Text(
            item.postTitle!,
            style:
                CustomTextStyles.headerTextStyle.copyWith(fontSize: 16.fSize),
          ),
          subtitle: Text(
            item.category!, // Display subtitle
            style: CustomTextStyles.noticeTextStyle
                .copyWith(color: appThemeColors.blueGray900),
          ),
          onTap: () {
            NavigatorService.pushNamed(
              AppRoutes.productDetailsPage,
              arguments: suggestions[index],
            );
          },
        );
      },
    );
  }
}

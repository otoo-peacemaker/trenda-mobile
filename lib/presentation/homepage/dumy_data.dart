import '../../core/utils/image_constant.dart';

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

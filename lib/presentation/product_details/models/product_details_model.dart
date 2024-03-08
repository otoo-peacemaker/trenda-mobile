import 'package:flutter/material.dart';

class ProductDetailsModel {
  List<FrameItemModel> frameItemList =
      List.generate(3, (index) => FrameItemModel());

  List<ProductdetailsItemModel> productdetailsItemList = [
    ProductdetailsItemModel(
        gHsCounter: "GHs 350",
        nikeShoe: "Nike Shoe",
        chip: "Brand New",
        chip1: "Fashion"),
    ProductdetailsItemModel(
        gHsCounter: "GHs 150",
        nikeShoe: "Club Tees",
        chip: "Brand New",
        chip1: "Fashion"),
    ProductdetailsItemModel(
        gHsCounter: "GHs 350",
        nikeShoe: "Unisex Tracksuit",
        chip: "Brand New",
        chip1: "Fashion"),
    ProductdetailsItemModel(
        gHsCounter: "GHs 300",
        nikeShoe: "Nike Air Shoe",
        chip: "Brand New",
        chip1: "Fashion"),
    ProductdetailsItemModel(
        gHsCounter: "GHs 425",
        nikeShoe:
            "Glossy Tassel Brogue Leather Loafer Slip-ons Classic Formal Shoes - Black",
        chip: "Brand New",
        chip1: "Fashion"),
    ProductdetailsItemModel(
        gHsCounter: "GHs 300",
        nikeShoe: "Nike Air",
        chip: "Brand New",
        chip1: "Fashion")
  ];
}

class ProductdetailsItemModel {
  ProductdetailsItemModel({
    this.gHsCounter,
    this.nikeShoe,
    this.chip,
    this.chip1,
    this.id,
  }) {
    gHsCounter = gHsCounter ?? "GHs 350";
    nikeShoe = nikeShoe ?? "Nike Shoe";
    chip = chip ?? "Brand New";
    chip1 = chip1 ?? "Fashion";
    id = id ?? "";
  }

  String? gHsCounter;

  String? nikeShoe;

  String? chip;

  String? chip1;

  String? id;
}

class FrameItemModel {
  FrameItemModel({
    this.buttonBase,
    this.isSelected,
  }) {
    buttonBase = buttonBase ?? "0262195121";
    isSelected = isSelected ?? false;
  }

  String? buttonBase;

  bool? isSelected;
}

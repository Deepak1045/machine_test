import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';

class Product {
  final String id;
  final String name;
  final String price;
  final String rating;
  final String reviews;
  final String image;
  var isFavorite = false.obs;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.image,
    bool favorite = false,
  }) {
    isFavorite.value = favorite;
  }
}

class HomeController extends GetxController {
  final selectedTab = 0.obs;
  final currentBannerIndex = 0.obs;
  final selectedCategoryIndex = 1.obs;
  final cartCount = 0.obs;

  final categories = [
    'Recommend',
    'Cell Phone',
    'Car Products',
    'Department Store',
    'Electronics',
    'Fashion',
  ];

  final products = <Product>[
    Product(
      id: '1',
      name: 'Multi Kit',
      price: r'$500',
      rating: '4.6',
      reviews: '88',
      image: AppAssets.womanBag,
    ),
    Product(
      id: '2',
      name: 'Lipstick',
      price: r'$400',
      rating: '4.6',
      reviews: '88',
      image: AppAssets.lipstick,
    ),
    Product(
      id: '3',
      name: 'Summer Dress',
      price: r'$1200',
      rating: '4.8',
      reviews: '120',
      image: AppAssets.dress,
    ),
    Product(
      id: '4',
      name: 'Casual Shirt',
      price: r'$800',
      rating: '4.5',
      reviews: '45',
      image: AppAssets.shirt,
    ),
  ].obs;

  void changeTab(int index) {
    selectedTab.value = index;
    // In a real app, this might navigate or switch IndexedStack
  }

  void changeCategory(int index) {
    selectedCategoryIndex.value = index;
    Get.snackbar(
      'Category Changed',
      'Showing products for ${categories[index]}',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primary.withOpacity(0.7),
      colorText: Colors.white,
      duration: const Duration(seconds: 1),
    );
  }

  void onBannerChanged(int index) {
    currentBannerIndex.value = index;
  }

  void toggleFavorite(Product product) {
    product.isFavorite.value = !product.isFavorite.value;
    Get.snackbar(
      product.isFavorite.value ? 'Added to Favorites' : 'Removed from Favorites',
      product.name,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1),
    );
  }

  void addToCart(Product product) {
    cartCount.value++;
    Get.snackbar(
      'Added to Cart',
      '${product.name} has been added to your shopping cart.',
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors.secondary,
      colorText: Colors.white,
    );
  }

  void onSearch() {
    Get.snackbar('Search', 'Search functionality coming soon!');
  }

  void onScan() {
    Get.snackbar('Scan', 'QR/Barcode scanner coming soon!');
  }

  void onMenu() {
    Get.snackbar('Menu', 'Drawer menu coming soon!');
  }

  void onSeeMoreCategories() {
    Get.snackbar('Categories', 'Navigating to all categories...');
  }
  
  void onProductClick(Product product) {
    Get.snackbar('Product Detail', 'Viewing details for ${product.name}');
  }

  void onCategoryClick(String name) {
    Get.snackbar('Category', 'Navigating to $name category');
  }
}

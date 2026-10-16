import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/widgets/product_card.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(),
      body: Obx(() {
        switch (controller.selectedTab.value) {
          case 0:
            return _buildHomeContent();
          case 1:
            return _buildPlaceholder('Category Screen');
          case 2:
            return _buildPlaceholder('Messages Screen');
          case 3:
            return _buildPlaceholder('Cart Screen');
          case 4:
            return _buildPlaceholder('Profile Screen');
          default:
            return _buildHomeContent();
        }
      }),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildHomeContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          _buildGreeting(),
          const SizedBox(height: 20),
          _buildBanner(),
          const SizedBox(height: 20),
          _buildCategoryTabs(),
          const SizedBox(height: 20),
          _buildCategoryGrid(),
          const SizedBox(height: 20),
          _buildProductSection(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildPlaceholder(String title) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.construction, size: 64, color: AppColors.primary.withOpacity(0.5)),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.grey),
          ),
          const SizedBox(height: 8),
          const Text('This feature is coming soon!', style: TextStyle(color: AppColors.grey)),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => controller.changeTab(0),
            child: const Text('Back to Home'),
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: AppColors.black),
        onPressed: controller.onMenu,
      ),
      title: Image.asset(AppAssets.logo, height: 30),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Image.asset(AppAssets.searchIcon, width: 24),
          onPressed: controller.onSearch,
        ),
        IconButton(
          icon: Image.asset(AppAssets.scanIcon, width: 24),
          onPressed: controller.onScan,
        ),
      ],
    );
  }

  Widget _buildGreeting() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hi, Andrea',
            style: TextStyle(fontSize: 16, color: AppColors.grey),
          ),
          SizedBox(height: 5),
          Text(
            'What are you looking for\ntoday?',
            style: TextStyle(
              fontSize: 24, 
              fontWeight: FontWeight.bold, 
              height: 1.2,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBanner() {
    final bannerList = [AppAssets.banner];
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180,
            viewportFraction: 0.9,
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) => controller.onBannerChanged(index),
          ),
          items: bannerList.map((i) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(i),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: bannerList.asMap().entries.map((entry) {
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: controller.currentBannerIndex.value == entry.key
                        ? AppColors.secondary
                        : AppColors.lightGrey,
                  ),
                );
              }).toList(),
            )),
      ],
    );
  }

  Widget _buildCategoryTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: controller.categories.asMap().entries.map((entry) {
          return Obx(() {
            bool isSelected = controller.selectedCategoryIndex.value == entry.key;
            return GestureDetector(
              onTap: () => controller.changeCategory(entry.key),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isSelected ? AppColors.secondary : Colors.transparent,
                      width: 2,
                    ),
                  ),
                ),
                child: Text(
                  entry.value,
                  style: TextStyle(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    color: isSelected ? AppColors.black : AppColors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
            );
          });
        }).toList(),
      ),
    );
  }

  Widget _buildCategoryGrid() {
    final categoriesData = [
      {'name': 'Beauty', 'image': AppAssets.beauty},
      {'name': 'Offers', 'image': AppAssets.offers},
      {'name': 'Fashion', 'image': AppAssets.fashion},
      {'name': 'Home', 'image': AppAssets.home},
      {'name': 'Shirt', 'image': AppAssets.shirt},
      {'name': 'Woman Bag', 'image': AppAssets.womanBag},
      {'name': 'Dress', 'image': AppAssets.dress},
      {'name': 'Mobiles', 'image': AppAssets.beauty},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: controller.onSeeMoreCategories,
                child: const Text(
                  'See More',
                  style: TextStyle(color: AppColors.secondary, fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 0.8,
            ),
            itemCount: categoriesData.length,
            itemBuilder: (context, index) {
              return CategoryItem(
                name: categoriesData[index]['name'] as String,
                image: categoriesData[index]['image'] as String,
                onTap: () => controller.onCategoryClick(categoriesData[index]['name'] as String),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildProductSection() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('products').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Padding(
            padding: EdgeInsets.all(20.0),
            child: CircularProgressIndicator(),
          ));
        }
        if (snapshot.hasError) {
          return Center(child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('Error: ${snapshot.error}', style: const TextStyle(color: Colors.red)),
          ));
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(40.0),
              child: Column(
                children: [
                  Icon(Icons.inventory_2_outlined, size: 48, color: AppColors.grey),
                  SizedBox(height: 10),
                  Text('No products available.', style: TextStyle(color: AppColors.grey, fontSize: 16)),
                ],
              ),
            ),
          );
        }

        final productDocs = snapshot.data!.docs;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 0.75,
            ),
            itemCount: productDocs.length,
            itemBuilder: (context, index) {
              final data = productDocs[index].data() as Map<String, dynamic>;
              
              // We create a temporary Product object to use controller logic if needed, 
              // or just pass data directly to ProductCard as requested.
              return ProductCard(
                name: data['name'] ?? 'Unnamed Product',
                price: data['price'] ?? r'$0',
                rating: (data['rating'] ?? 0.0).toString(),
                reviews: (data['reviews'] ?? 0).toString(),
                image: data['image'] ?? AppAssets.womanBag, // Ensure image path is valid or use fallback
                isFavorite: false, // Logic can be linked to user favorites collection
                onAddTap: () {
                   controller.addToCart(Product(
                     id: productDocs[index].id,
                     name: data['name'] ?? '',
                     price: data['price'] ?? '',
                     rating: (data['rating'] ?? 0.0).toString(),
                     reviews: (data['reviews'] ?? 0).toString(),
                     image: data['image'] ?? AppAssets.womanBag,
                   ));
                },
                onFavoriteTap: () {
                   Get.snackbar('Favorite', 'Added to favorites');
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildBottomNav() {
    return Obx(() => BottomNavigationBar(
          currentIndex: controller.selectedTab.value,
          onTap: controller.changeTab,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.secondary,
          unselectedItemColor: AppColors.grey,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontSize: 10),
          items: [
            _buildNavItem(AppAssets.homeIcon, 'Home', 0),
            _buildNavItem(AppAssets.categoryIcon, 'Category', 1),
            _buildNavItem(AppAssets.messageIcon, 'Message', 2),
            _buildNavItem(AppAssets.cartIcon, 'Cart', 3),
            _buildNavItem(AppAssets.privateIcon, 'Private', 4),
          ],
        ));
  }

  BottomNavigationBarItem _buildNavItem(String icon, String label, int index) {
    bool isSelected = controller.selectedTab.value == index;
    return BottomNavigationBarItem(
      icon: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            icon, 
            width: 24, 
            color: isSelected ? AppColors.secondary : AppColors.grey
          ),
          if (index == 3) // Cart tab badge
            Obx(() => controller.cartCount.value > 0 
              ? Positioned(
                  right: -5,
                  top: -5,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${controller.cartCount.value}',
                      style: const TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              : const SizedBox.shrink()),
        ],
      ),
      label: label,
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String name;
  final String image;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.name,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.lightGrey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(image, height: 35, width: 35),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: Text(
              name,
              style: const TextStyle(fontSize: 10, color: AppColors.grey, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

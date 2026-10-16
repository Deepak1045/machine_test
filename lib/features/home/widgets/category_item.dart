import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

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

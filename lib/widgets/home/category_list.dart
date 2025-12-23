import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:auction_ui/themes/app_theme.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int _selectedIndex = -1;

  final List<CategoryItem> _categories = [
    CategoryItem(
        Icons.watch, 'นาฬิกา', [AppTheme.primaryPurple, AppTheme.primaryBlue]),
    CategoryItem(Icons.phone_android, 'มือถือ',
        [AppTheme.primaryBlue, AppTheme.primaryTeal]),
    CategoryItem(Icons.diamond, 'เครื่องประดับ',
        [AppTheme.primaryTeal, AppTheme.primaryPurple]),
    CategoryItem(
        Icons.palette, 'ศิลปะ', [AppTheme.primaryPurple, AppTheme.primaryTeal]),
    CategoryItem(Icons.directions_car, 'รถยนต์',
        [AppTheme.primaryBlue, AppTheme.primaryPurple]),
    CategoryItem(Icons.chair, 'เฟอร์นิเจอร์',
        [AppTheme.primaryTeal, AppTheme.primaryBlue]),
    CategoryItem(
        Icons.style, 'การ์ด', [AppTheme.primaryPurple, AppTheme.primaryBlue]),
    CategoryItem(Icons.sports_esports, 'เกมส์',
        [AppTheme.primaryBlue, AppTheme.primaryTeal]),
    CategoryItem(Icons.camera_alt, 'กล้อง',
        [AppTheme.primaryTeal, AppTheme.primaryPurple]),
    CategoryItem(Icons.headphones, 'หูฟัง',
        [AppTheme.primaryPurple, AppTheme.primaryTeal]),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final category = _categories[index];
          final isSelected = _selectedIndex == index;

          return GestureDetector(
            onTap: () =>
                setState(() => _selectedIndex = isSelected ? -1 : index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOutCubic,
              margin: const EdgeInsets.only(right: 14),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(isSelected ? 20 : 16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOutCubic,
                        width: isSelected ? 65 : 58,
                        height: isSelected ? 65 : 58,
                        decoration: BoxDecoration(
                          gradient: isSelected
                              ? LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: category.gradientColors,
                                )
                              : LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.white.withOpacity(0.15),
                                    Colors.white.withOpacity(0.05),
                                  ],
                                ),
                          borderRadius:
                              BorderRadius.circular(isSelected ? 20 : 16),
                          border: Border.all(
                            color: isSelected
                                ? category.gradientColors[0].withOpacity(0.5)
                                : Colors.white.withOpacity(0.2),
                            width: 1,
                          ),
                          boxShadow: isSelected
                              ? [
                                  BoxShadow(
                                    color: category.gradientColors[0]
                                        .withOpacity(0.5),
                                    blurRadius: 15,
                                    spreadRadius: 2,
                                  ),
                                ]
                              : [],
                        ),
                        child: Icon(
                          category.icon,
                          color: Colors.white,
                          size: isSelected ? 28 : 24,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 300),
                    style: TextStyle(
                      fontSize: isSelected ? 12 : 11,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.w500,
                      color: isSelected
                          ? AppTheme.primaryTeal
                          : Colors.white.withOpacity(0.7),
                    ),
                    child: Text(category.label),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CategoryItem {
  final IconData icon;
  final String label;
  final List<Color> gradientColors;
  CategoryItem(this.icon, this.label, this.gradientColors);
}

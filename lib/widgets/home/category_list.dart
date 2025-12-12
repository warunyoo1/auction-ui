import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int _selectedIndex = -1;

  final List<CategoryItem> _categories = [
    CategoryItem(Icons.watch, 'นาฬิกา', const Color(0xFFE8D5F9)),
    CategoryItem(Icons.phone_android, 'มือถือ', const Color(0xFFD1C4E9)),
    CategoryItem(Icons.diamond, 'เครื่องประดับ', const Color(0xFFE1BEE7)),
    CategoryItem(Icons.palette, 'ศิลปะ', const Color(0xFFCE93D8)),
    CategoryItem(Icons.directions_car, 'รถยนต์', const Color(0xFFB39DDB)),
    CategoryItem(Icons.chair, 'เฟอร์นิเจอร์', const Color(0xFFE8D5F9)),
    CategoryItem(Icons.style, 'การ์ด', const Color(0xFFD1C4E9)),
    CategoryItem(Icons.sports_esports, 'เกมส์', const Color(0xFFE1BEE7)),
    CategoryItem(Icons.camera_alt, 'กล้อง', const Color(0xFFCE93D8)),
    CategoryItem(Icons.headphones, 'หูฟัง', const Color(0xFFB39DDB)),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
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
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutCubic,
                    width: isSelected ? 65 : 58,
                    height: isSelected ? 65 : 58,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: isSelected
                            ? [const Color(0xFF9C27B0), const Color(0xFF7B1FA2)]
                            : [
                                category.color,
                                category.color.withValues(alpha: 0.6)
                              ],
                      ),
                      borderRadius: BorderRadius.circular(isSelected ? 20 : 16),
                      boxShadow: [
                        BoxShadow(
                          color: isSelected
                              ? const Color(0xFF9C27B0).withValues(alpha: 0.5)
                              : category.color.withValues(alpha: 0.4),
                          blurRadius: isSelected ? 12 : 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Icon(category.icon,
                        color:
                            isSelected ? Colors.white : const Color(0xFF7B1FA2),
                        size: isSelected ? 28 : 24),
                  ),
                  const SizedBox(height: 8),
                  AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 300),
                    style: TextStyle(
                      fontSize: isSelected ? 12 : 11,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.w600,
                      color:
                          isSelected ? const Color(0xFF9C27B0) : Colors.black87,
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
  final Color color;
  CategoryItem(this.icon, this.label, this.color);
}

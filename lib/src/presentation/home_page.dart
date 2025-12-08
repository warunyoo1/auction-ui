import 'package:flutter/material.dart';
import 'widgets/category_card.dart';
import 'widgets/auction_card.dart';
import '../data/mock/mock_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF5B5FED), Color(0xFF7B5FED)],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.gavel, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 12),
            const Text(
              'Auction',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 26,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.notifications_outlined, color: Colors.black87),
              onPressed: () {},
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF5B5FED), Color(0xFF7B5FED)],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF5B5FED).withOpacity(0.3),
                  blurRadius: 10,
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.person, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF5B5FED).withOpacity(0.1),
                          const Color(0xFF7B5FED).withOpacity(0.05),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.search,
                      color: Color(0xFF5B5FED),
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'ค้นหาสินค้าที่ต้องการ...',
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 15,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.tune, color: Colors.grey[600], size: 20),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Categories
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'หมวดหมู่',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      const Text(
                        'ดูทั้งหมด',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: Colors.blue[700],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 110,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                itemCount: MockData.getCategories().length,
                itemBuilder: (context, index) {
                  final category = MockData.getCategories()[index];
                  return CategoryCard(
                    title: category.name,
                    icon: category.icon,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('หมวดหมู่: ${category.name}'),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            const SizedBox(height: 24),

            // Featured Auctions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'ประมูลแนะนำ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      const Text(
                        'ดูทั้งหมด',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 12,
                        color: Colors.blue[700],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Auction Items Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: MockData.getFeaturedItems().length,
              itemBuilder: (context, index) {
                final item = MockData.getFeaturedItems()[index];
                return AuctionCard(
                  title: item.title,
                  price: '฿${item.currentPrice.toStringAsFixed(0)}',
                  timeLeft: item.timeLeft,
                  imageUrl: item.imageUrl,
                  onTap: () {
                    // TODO: Navigate to item detail
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('คลิกที่: ${item.title}'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

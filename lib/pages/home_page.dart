import 'package:flutter/material.dart';
import 'package:auction_ui/pages/notification_page.dart';
import 'package:auction_ui/pages/login_page.dart';
import 'package:auction_ui/widgets/page_transitions.dart';
import 'package:auction_ui/widgets/promo_carousel.dart';
import 'package:auction_ui/widgets/category_list.dart';

class HomePage extends StatefulWidget {
  final int initialIndex;

  const HomePage({Key? key, this.initialIndex = 0}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  final List<Widget> _pages = const [
    _HomeContent(),
    NotificationPage(),
  ];

  void _onTabTapped(int index) {
    if (index == 2) {
      Navigator.push(
        context,
        FadeScalePageRoute(page: const LoginPage()),
      );
    } else {
      setState(() => _currentIndex = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTabTapped,
          selectedItemColor: const Color(0xFF9C27B0),
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: 'หน้าหลัก',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined),
              activeIcon: Icon(Icons.notifications),
              label: 'แจ้งเตือน',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.login_outlined),
              activeIcon: Icon(Icons.login),
              label: 'เข้าสู่ระบบ',
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Header with purple background
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF7B1FA2), Color(0xFF9C27B0)],
                ),
              ),
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Location & Icons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'สถานที่',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 12,
                                ),
                              ),
                              const Row(
                                children: [
                                  Icon(Icons.location_on,
                                      color: Color(0xFFE8D5F9), size: 18),
                                  SizedBox(width: 4),
                                  Text(
                                    'กรุงเทพฯ, ประเทศไทย',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Icon(Icons.keyboard_arrow_down,
                                      color: Colors.white),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              _buildIconButton(Icons.shopping_cart_outlined),
                              const SizedBox(width: 8),
                              _buildIconButton(Icons.notifications_outlined,
                                  hasBadge: true),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Search bar
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              height: 48,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.search,
                                      color: Colors.grey.shade400),
                                  const SizedBox(width: 8),
                                  Text(
                                    'ค้นหาสินค้าประมูล...',
                                    style:
                                        TextStyle(color: Colors.grey.shade400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(Icons.tune,
                                color: Color(0xFF9C27B0)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Special Offers
                  _buildSectionHeader('โปรโมชั่นพิเศษ', 'ดูทั้งหมด'),
                  const SizedBox(height: 12),
                  const PromoCarousel(),
                  const SizedBox(height: 24),
                  // Category
                  _buildSectionHeader('หมวดหมู่', 'ดูทั้งหมด'),
                  const SizedBox(height: 12),
                  const CategoryList(),
                  const SizedBox(height: 24),
                  // Recommended
                  _buildSectionHeader('แนะนำสำหรับคุณ', 'ดูทั้งหมด'),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                          child: _buildProductCard(
                              'นาฬิกา Rolex', '฿45,000', true)),
                      const SizedBox(width: 12),
                      Expanded(
                          child: _buildProductCard(
                              'iPhone 15 Pro', '฿32,000', false)),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                          child: _buildProductCard(
                              'กระเป๋า LV', '฿28,000', false)),
                      const SizedBox(width: 12),
                      Expanded(
                          child:
                              _buildProductCard('แหวนเพชร', '฿55,000', true)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildIconButton(IconData icon, {bool hasBadge = false}) {
    return Stack(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: Colors.white, size: 22),
        ),
        if (hasBadge)
          Positioned(
            right: 4,
            top: 4,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
          ),
      ],
    );
  }

  static Widget _buildSectionHeader(String title, String action) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          action,
          style: const TextStyle(
              color: Color(0xFF9C27B0), fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  static Widget _buildProductCard(String name, String price, bool isFavorite) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 120,
                decoration: const BoxDecoration(
                  color: Color(0xFFF5EEFA),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                child: const Center(
                  child: Icon(Icons.gavel, size: 50, color: Color(0xFF9C27B0)),
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.grey,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    color: Color(0xFF9C27B0),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

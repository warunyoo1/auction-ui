import 'dart:async';
import 'package:flutter/material.dart';

class PromoCarousel extends StatefulWidget {
  const PromoCarousel({Key? key}) : super(key: key);

  @override
  State<PromoCarousel> createState() => _PromoCarouselState();
}

class _PromoCarouselState extends State<PromoCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<PromoItem> _promos = [
    PromoItem(
        tag: 'ประมูลพิเศษ',
        title: 'ลดสูงสุด',
        discount: '50',
        buttonText: 'ประมูลเลย',
        icon: Icons.gavel),
    PromoItem(
        tag: 'สินค้าใหม่',
        title: 'เปิดประมูล',
        discount: '30',
        buttonText: 'ดูสินค้า',
        icon: Icons.new_releases),
    PromoItem(
        tag: 'Flash Sale',
        title: 'ลดพิเศษ',
        discount: '70',
        buttonText: 'ช้อปเลย',
        icon: Icons.flash_on),
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_currentPage < _promos.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      if (_pageController.hasClients) {
        _pageController.animateToPage(_currentPage,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 160,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemCount: _promos.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: _buildPromoCard(_promos[index]),
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
              _promos.length, (index) => _buildDot(index == _currentPage)),
        ),
      ],
    );
  }

  Widget _buildPromoCard(PromoItem promo) {
    return Container(
      decoration: BoxDecoration(
        gradient:
            const LinearGradient(colors: [Color(0xFFF3E5F5), Colors.white]),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 15,
              offset: const Offset(0, 5))
        ],
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                      color: const Color(0xFF9C27B0),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(promo.tag,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 10)),
                ),
                const SizedBox(height: 6),
                Text(promo.title,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w600)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(promo.discount,
                        style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF9C27B0))),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 4),
                      child: Text('%',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF9C27B0))),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                      color: const Color(0xFF9C27B0),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(promo.buttonText,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: const Color(0xFFE8D5F9).withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(100),
                    bottomRight: Radius.circular(16)),
              ),
              child: Center(
                  child: Icon(promo.icon,
                      size: 45, color: const Color(0xFF9C27B0))),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: isActive ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF9C27B0) : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class PromoItem {
  final String tag, title, discount, buttonText;
  final IconData icon;
  PromoItem(
      {required this.tag,
      required this.title,
      required this.discount,
      required this.buttonText,
      required this.icon});
}

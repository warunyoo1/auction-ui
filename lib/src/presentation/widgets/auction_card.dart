import 'package:flutter/material.dart';

class AuctionCard extends StatelessWidget {
  final String title;
  final String price;
  final String timeLeft;
  final VoidCallback? onTap;
  final String? imageUrl;

  const AuctionCard({
    Key? key,
    required this.title,
    required this.price,
    required this.timeLeft,
    this.onTap,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with gradient overlay
            Stack(
              children: [
                Container(
                  height: 130,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: _getGradientFromUrl(imageUrl),
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Icon(
                        _getIconFromUrl(imageUrl),
                        size: 60,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ),
                ),
                // Time badge
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 12,
                          color: Color(0xFFFF6B6B),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          timeLeft,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFFF6B6B),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'ราคาปัจจุบัน',
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF5B5FED).withOpacity(0.1),
                          const Color(0xFF7B5FED).withOpacity(0.05),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      price,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF5B5FED),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  LinearGradient _getGradientFromUrl(String? url) {
    if (url == null) {
      return LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFF5B5FED).withOpacity(0.8),
          const Color(0xFF7B5FED).withOpacity(0.6),
        ],
      );
    }

    switch (url) {
      case 'gradient_blue':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF4A90E2), Color(0xFF357ABD)],
        );
      case 'gradient_purple':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF7B5FED), Color(0xFF5B5FED)],
        );
      case 'gradient_pink':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFF6B9D), Color(0xFFE85A8F)],
        );
      case 'gradient_red':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFF6B6B), Color(0xFFE85555)],
        );
      case 'gradient_yellow':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFFD93D), Color(0xFFFFC107)],
        );
      case 'gradient_green':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF6BCB77), Color(0xFF4CAF50)],
        );
      case 'gradient_cyan':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF4ECDC4), Color(0xFF26A69A)],
        );
      case 'gradient_indigo':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF9B59B6), Color(0xFF8E44AD)],
        );
      case 'gradient_orange':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFE67E22), Color(0xFFD35400)],
        );
      case 'gradient_teal':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF3498DB), Color(0xFF2980B9)],
        );
      case 'gradient_amber':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFF39C12), Color(0xFFE67E22)],
        );
      case 'gradient_rose':
        return const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFE74C3C), Color(0xFFC0392B)],
        );
      default:
        return LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xFF5B5FED).withOpacity(0.8),
            const Color(0xFF7B5FED).withOpacity(0.6),
          ],
        );
    }
  }

  IconData _getIconFromUrl(String? url) {
    if (url == null) return Icons.shopping_bag_outlined;

    switch (url) {
      case 'gradient_blue':
      case 'gradient_purple':
      case 'gradient_teal':
        return Icons.phone_iphone;
      case 'gradient_pink':
        return Icons.shopping_bag_outlined;
      case 'gradient_red':
        return Icons.sports_basketball;
      case 'gradient_yellow':
        return Icons.style_outlined;
      case 'gradient_green':
        return Icons.palette_outlined;
      case 'gradient_cyan':
        return Icons.watch_outlined;
      case 'gradient_indigo':
        return Icons.videogame_asset_outlined;
      case 'gradient_orange':
        return Icons.music_note_outlined;
      case 'gradient_amber':
        return Icons.diamond_outlined;
      case 'gradient_rose':
        return Icons.directions_bike_outlined;
      default:
        return Icons.shopping_bag_outlined;
    }
  }
}

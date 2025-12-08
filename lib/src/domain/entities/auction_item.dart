class AuctionItem {
  final String id;
  final String title;
  final String description;
  final double currentPrice;
  final String imageUrl;
  final String timeLeft;
  final String category;
  final int bidCount;
  final String seller;

  AuctionItem({
    required this.id,
    required this.title,
    required this.description,
    required this.currentPrice,
    required this.imageUrl,
    required this.timeLeft,
    required this.category,
    required this.bidCount,
    required this.seller,
  });
}

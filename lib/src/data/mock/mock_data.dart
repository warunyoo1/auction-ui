import 'package:flutter/material.dart';
import '../../domain/entities/auction_item.dart';
import '../../domain/entities/category.dart';

class MockData {
  // Mock Categories
  static List<Category> getCategories() {
    return [
      Category(
        id: '1',
        name: 'อิเล็กทรอนิกส์',
        icon: Icons.devices,
        itemCount: 156,
      ),
      Category(
        id: '2',
        name: 'แฟชั่น',
        icon: Icons.checkroom,
        itemCount: 243,
      ),
      Category(
        id: '3',
        name: 'ของสะสม',
        icon: Icons.collections,
        itemCount: 89,
      ),
      Category(
        id: '4',
        name: 'ศิลปะ',
        icon: Icons.palette,
        itemCount: 67,
      ),
      Category(
        id: '5',
        name: 'เครื่องประดับ',
        icon: Icons.diamond,
        itemCount: 124,
      ),
      Category(
        id: '6',
        name: 'กีฬา',
        icon: Icons.sports_soccer,
        itemCount: 98,
      ),
    ];
  }

  // Mock Auction Items
  static List<AuctionItem> getAuctionItems() {
    return [
      AuctionItem(
        id: '1',
        title: 'iPhone 15 Pro Max',
        description: 'iPhone 15 Pro Max 256GB สีไทเทเนียมธรรมชาติ สภาพใหม่ 99%',
        currentPrice: 35000,
        imageUrl: 'gradient_blue',
        timeLeft: '2 ชั่วโมง',
        category: 'อิเล็กทรอนิกส์',
        bidCount: 24,
        seller: 'TechStore',
      ),
      AuctionItem(
        id: '2',
        title: 'MacBook Pro M3',
        description: 'MacBook Pro 14" M3 Pro 18GB RAM 512GB SSD',
        currentPrice: 58000,
        imageUrl: 'gradient_purple',
        timeLeft: '5 ชั่วโมง',
        category: 'อิเล็กทรอนิกส์',
        bidCount: 18,
        seller: 'AppleShop',
      ),
      AuctionItem(
        id: '3',
        title: 'กระเป๋า Louis Vuitton',
        description: 'กระเป๋า LV Neverfull MM สีน้ำตาล ของแท้ 100%',
        currentPrice: 42000,
        imageUrl: 'gradient_pink',
        timeLeft: '1 ชั่วโมง',
        category: 'แฟชั่น',
        bidCount: 31,
        seller: 'LuxuryBrand',
      ),
      AuctionItem(
        id: '4',
        title: 'รองเท้า Nike Air Jordan 1',
        description: 'Nike Air Jordan 1 Retro High OG Chicago ไซส์ 42',
        currentPrice: 8500,
        imageUrl: 'gradient_red',
        timeLeft: '3 ชั่วโมง',
        category: 'แฟชั่น',
        bidCount: 15,
        seller: 'SneakerHead',
      ),
      AuctionItem(
        id: '5',
        title: 'การ์ด Pokemon Charizard',
        description: 'Pokemon Card Charizard 1st Edition Holographic',
        currentPrice: 125000,
        imageUrl: 'gradient_yellow',
        timeLeft: '6 ชั่วโมง',
        category: 'ของสะสม',
        bidCount: 42,
        seller: 'CardCollector',
      ),
      AuctionItem(
        id: '6',
        title: 'ภาพวาดสีน้ำมัน',
        description: 'ภาพวาดสีน้ำมันต้นฉบับ ขนาด 60x80 ซม.',
        currentPrice: 15000,
        imageUrl: 'gradient_green',
        timeLeft: '4 ชั่วโมง',
        category: 'ศิลปะ',
        bidCount: 8,
        seller: 'ArtGallery',
      ),
      AuctionItem(
        id: '7',
        title: 'นาฬิกา Rolex Submariner',
        description: 'Rolex Submariner Date 41mm สแตนเลส ของแท้พร้อมใบรับประกัน',
        currentPrice: 285000,
        imageUrl: 'gradient_cyan',
        timeLeft: '8 ชั่วโมง',
        category: 'เครื่องประดับ',
        bidCount: 56,
        seller: 'WatchMaster',
      ),
      AuctionItem(
        id: '8',
        title: 'PlayStation 5',
        description: 'PS5 Disc Edition พร้อมจอย 2 ตัว และเกม 5 แผ่น',
        currentPrice: 16500,
        imageUrl: 'gradient_indigo',
        timeLeft: '2 ชั่วโมง',
        category: 'อิเล็กทรอนิกส์',
        bidCount: 27,
        seller: 'GameZone',
      ),
      AuctionItem(
        id: '9',
        title: 'กีตาร์ Gibson Les Paul',
        description: 'Gibson Les Paul Standard 60s สี Iced Tea',
        currentPrice: 95000,
        imageUrl: 'gradient_orange',
        timeLeft: '7 ชั่วโมง',
        category: 'ของสะสม',
        bidCount: 12,
        seller: 'MusicStore',
      ),
      AuctionItem(
        id: '10',
        title: 'กล้อง Canon EOS R5',
        description: 'Canon EOS R5 Body + RF 24-70mm f/2.8L IS USM',
        currentPrice: 125000,
        imageUrl: 'gradient_teal',
        timeLeft: '5 ชั่วโมง',
        category: 'อิเล็กทรอนิกส์',
        bidCount: 19,
        seller: 'CameraHub',
      ),
      AuctionItem(
        id: '11',
        title: 'แหวนเพชร 1 กะรัต',
        description: 'แหวนเพชรแท้ 1 กะรัต ทอง 18K พร้อมใบเซอร์',
        currentPrice: 180000,
        imageUrl: 'gradient_amber',
        timeLeft: '3 ชั่วโมง',
        category: 'เครื่องประดับ',
        bidCount: 38,
        seller: 'JewelryPro',
      ),
      AuctionItem(
        id: '12',
        title: 'จักรยาน Specialized S-Works',
        description: 'Specialized S-Works Tarmac SL7 Carbon ไซส์ 54',
        currentPrice: 245000,
        imageUrl: 'gradient_rose',
        timeLeft: '9 ชั่วโมง',
        category: 'กีฬา',
        bidCount: 14,
        seller: 'BikeShop',
      ),
    ];
  }

  // Get items by category
  static List<AuctionItem> getItemsByCategory(String categoryName) {
    return getAuctionItems()
        .where((item) => item.category == categoryName)
        .toList();
  }

  // Get featured items (top 6)
  static List<AuctionItem> getFeaturedItems() {
    return getAuctionItems().take(6).toList();
  }

  // Search items
  static List<AuctionItem> searchItems(String query) {
    final lowerQuery = query.toLowerCase();
    return getAuctionItems()
        .where((item) =>
            item.title.toLowerCase().contains(lowerQuery) ||
            item.description.toLowerCase().contains(lowerQuery))
        .toList();
  }
}

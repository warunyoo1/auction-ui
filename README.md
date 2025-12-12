# Auction UI

แอปพลิเคชัน Flutter สำหรับระบบประมูลออนไลน์

## สิ่งที่ต้องมี (Prerequisites)

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (เวอร์ชัน 3.0.0 ขึ้นไป)
- [Git](https://git-scm.com/)
- **Java JDK 17** (สำหรับ Android build)

## วิธีการติดตั้ง (Installation)

```bash
git clone <repository-url>
cd auction-ui
flutter pub get
```

## การรันแอป

```bash
flutter devices    # ตรวจสอบอุปกรณ์
flutter run        # รันแอป
```

## โครงสร้างโปรเจกต์

```
lib/
├── main.dart          # Entry point
├── dummay.dart        # Dummy data
├── models/            # Data models
├── pages/             # หน้าจอต่างๆ
│   ├── home_page.dart
│   ├── login_page.dart
│   └── register_page.dart
├── providers/         # State management
├── services/          # API services
├── themes/            # App themes
└── widgets/           # Reusable widgets
```

## ฟีเจอร์ที่พัฒนาแล้ว

- ✅ หน้า Login พร้อม form validation
- ✅ หน้า Register พร้อม form validation
- ✅ หน้า Home พร้อม Bottom Navigation

## การแก้ไขปัญหาเบื้องต้น

หากเจอปัญหา Gradle / Java:
- ตรวจสอบว่าใช้ **Java 17** (`java -version`)
- ลอง `flutter clean` แล้ว `flutter pub get` ใหม่

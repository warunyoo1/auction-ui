# Auction UI

แอปพลิเคชัน Flutter สำหรับระบบประมูลออนไลน์

## สิ่งที่ต้องมี (Prerequisites)

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (เวอร์ชัน 3.22.0 ขึ้นไป)
- [Git](https://git-scm.com/)
- **Java JDK 17** (สำหรับ Android build)
- **Windows**: เปิด Developer Mode (สำหรับ symlink support)

## วิธีการติดตั้ง (Installation)

```bash
# 1. Clone โปรเจค
git clone <repository-url>
cd auction-ui

# 2. ติดตั้ง dependencies
flutter pub get

# 3. (Windows) เปิด Developer Mode ถ้ายังไม่ได้เปิด
start ms-settings:developers
```

## การรันแอป

```bash
# ตรวจสอบอุปกรณ์ที่เชื่อมต่อ
flutter devices

# รันแอป
flutter run

# รันบน Chrome (Web)
flutter run -d chrome

# รันบน Android Emulator
flutter run -d emulator-5554
```

## โครงสร้างโปรเจกต์

```
lib/
├── main.dart              # Entry point
├── models/                # Data models
├── pages/                 # หน้าจอต่างๆ
│   ├── home_page.dart
│   ├── login_page.dart
│   ├── register_page.dart
│   └── notification_page.dart
├── providers/             # State management
├── services/              # API services
├── themes/
│   └── app_theme.dart     # Theme และ Font styles
└── widgets/
    ├── common/            # Widgets ทั่วไป
    │   ├── gradient_background.dart
    │   └── page_transitions.dart
    ├── inputs/            # Input fields
    │   ├── phone_input_field.dart
    │   └── password_input_field.dart
    ├── buttons/           # Buttons
    │   └── social_login_buttons.dart
    └── home/              # Home page widgets
        ├── promo_carousel.dart
        └── category_list.dart
```

## ฟีเจอร์ที่พัฒนาแล้ว

- ✅ หน้า Login พร้อม form validation
- ✅ หน้า Register พร้อม form validation
- ✅ หน้า Home พร้อม Promo Carousel และ Category List
- ✅ Bottom Navigation Bar (หน้าหลัก, แจ้งเตือน, เข้าสู่ระบบ)
- ✅ Social Login (Google, Facebook)
- ✅ Page Transitions (Slide, Fade Scale)
- ✅ Google Fonts (Poppins)

## การแก้ไขปัญหาเบื้องต้น

```bash
# Clean และ rebuild
flutter clean
flutter pub get
flutter run

# ตรวจสอบ Flutter environment
flutter doctor

# ข้าม dependency validation (ถ้าจำเป็น)
flutter run --android-skip-build-dependency-validation
```

### ปัญหาที่พบบ่อย

| ปัญหา | วิธีแก้ |
|-------|--------|
| Gradle build failed | `flutter clean` แล้ว `flutter pub get` |
| Symlink error (Windows) | เปิด Developer Mode |
| Java version error | ใช้ Java 17 (`java -version`) |

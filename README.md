# Auction UI

โปรเจกต์นี้เป็นแอปพลิเคชัน Flutter สำหรับ Auction UI ที่พัฒนาด้วยโครงสร้างแบบ Clean Architecture

## สิ่งที่ต้องมี (Prerequisites)

ก่อนเริ่มใช้งาน กรุณาตรวจสอบว่าเครื่องของคุณได้ติดตั้งสิ่งเหล่านี้แล้ว:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (เวอร์ชัน 3.0.0 ขึ้นไป)
- [Git](https://git-scm.com/)
- **Java JDK 17** (จำเป็นสำหรับ Gradle 8.5 ที่ใช้ในโปรเจกต์นี้)

## วิธีการติดตั้ง (Installation)

1. **Clone โปรเจกต์**

   ```bash
   git clone <repository-url>
   cd auction-ui
   ```

2. **ติดตั้ง dependencies**

   ```bash
   flutter pub get
   ```

## การรันโปรเจกต์ครั้งแรก (Running the App)

1. **ตรวจสอบอุปกรณ์ที่เชื่อมต่อ** (Emulator หรือ Real Device)

   ```bash
   flutter devices
   ```

2. **ลบ dependencies**

   ```bash
   flutter pub clean
   ```

3. **อัพเดต dependencies**

   ```bash
   flutter pub get
   ```

4. **รันแอปพลิเคชัน**

   ```bash
   flutter run
   ```

## การแก้ไขปัญหาเบื้องต้น (Troubleshooting)

### ปัญหา Gradle / Java Version Incompatibility

หากเจอปัญหาเกี่ยวกับการ build หรือ Gradle error ให้ตรวจสอบว่า:

- ใช้ **Java 17** ในการรัน (ตรวจสอบด้วย `java -version`)
- การตั้งค่าใน `android/gradle/wrapper/gradle-wrapper.properties` เป็น Gradle 8.5
- การตั้งค่า `jvmTarget` ใน `android/app/build.gradle` เป็น 17

---

# Flutter Clean Architecture Structure

โครงสร้างโปรเจกต์นี้ออกแบบตามหลัก **Clean Architecture** ของ Flutter เพื่อให้โค้ดมีความแยกส่วน (separation of concerns) ง่ายต่อการทดสอบและบำรุงรักษา.

## โฟลเดอร์หลัก

```
lib/
├── main.dart                           # จุดเริ่มต้นของแอป (Entry point)
└── src/
    ├── core/                           # คอมโพเนนท์ทั่วไป (constants, utilities, extensions)
    ├── services/                       # API services และ external services
    ├── data/                           # Data sources (remote/local) และ repository implementations
    ├── domain/                         # Business logic layer
    │   ├── entities/                   # โมเดลข้อมูลที่ใช้ทั่วแอป
    │   ├── repositories/               # อินเตอร์เฟซของ repository
    │   └── usecases/                   # Use cases (business rules)
    └── presentation/                   # UI Layer
        ├── login_page.dart             # หน้า Login หลัก
        └── widgets/                    # Reusable widgets หรือพวกเมนูย่อยๆ
            ├── custom_text_field.dart
            ├── gradient_background.dart
            ├── login_form.dart
            └── social_login_button.dart
```

### สถานะปัจจุบันของโปรเจค

✅ **ที่พัฒนาแล้ว:**
- หน้า Login UI พร้อม animations
- Custom widgets สำหรับ login form
- Gradient background และ social login button
- Form validation พื้นฐาน

🚧 **ที่ยังไม่ได้พัฒนา:**
- Business logic (domain layer)
- API integration (services layer)
- Data management (data layer)
- หน้าจออื่นๆ (Home, Auction List, Profile, etc.)

## ไฟล์สำคัญที่มีอยู่

- `lib/main.dart` – Entry point ของแอป เรียก `LoginPage` เป็นหน้าแรก
- `lib/src/presentation/login_page.dart` – หน้า Login หลักพร้อม animations และ form validation
- `lib/src/presentation/widgets/custom_text_field.dart` – Text field แบบกำหนดเองสำหรับ form
- `lib/src/presentation/widgets/gradient_background.dart` – Background แบบ gradient
- `lib/src/presentation/widgets/login_form.dart` – Form component สำหรับ login
- `lib/src/presentation/widgets/social_login_button.dart` – ปุ่ม social login (Google)

โครงสร้างนี้ทำให้:

1. **แยกความรับผิดชอบ** ระหว่าง UI, business logic, และ data layer
2. **ทดสอบได้ง่าย** เพราะแต่ละ layer มี interface ที่ชัดเจน
3. **ขยายได้** เพิ่มฟีเจอร์ใหม่โดยสร้างโฟลเดอร์ใน `features/` โดยไม่กระทบส่วนอื่น

## ขั้นตอนการพัฒนาต่อ

1. **เพิ่ม State Management** – ติดตั้ง Provider, Bloc, หรือ Riverpod
2. **สร้าง API Service** – เพิ่มไฟล์ใน `lib/src/services/` สำหรับเรียก backend
3. **สร้าง Domain Layer** – เพิ่ม entities, repositories, และ use cases
4. **สร้าง Data Layer** – เพิ่ม data sources และ repository implementations
5. **เพิ่มหน้าจอใหม่** – สร้าง Home, Auction List, Profile pages
6. **เชื่อมต่อ Backend** – integrate กับ API จริง

เริ่มพัฒนาโดยสร้างฟีเจอร์ใหม่ใน `lib/src/` แล้วทำตาม Clean Architecture pattern ด้านบน.

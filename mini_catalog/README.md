# miniCatalogApp

A Flutter-based mini e-commerce catalog application built to practice
Flutter fundamentals, navigation, JSON data handling, reusable widgets,
and basic state management.
Flutter kullanılarak tasarlanan bir e-ticaret katalog uygulaması. Burada Flutter'ın
temellerini, navigasyon sistemini, JSON veri analizini, tekrar kullanılabilen widget'ları
ve temel state yönetimini öğrenip pekiştirdim.

## Features/Özellikler

- Product catalog (Ürün kataloğu)
- Product search UI (Ürün arama UI)
- Category chips (Kategori çipleri)
- Product detail screen (Ürün detay ekranı)
- GridView-based product cards (GridView-bazlı ürün kartları)
- JSON-based local product data (JSON-bazlı lokal ürün verisi)
- Product model and service layer (Ürün model ve servis katmanları)
- Navigation between screens (Ekranlar arası navigasyon)
- Route argument / object passing (Yol argümanları ve obje taşıma)
- Shopping cart (Alışveriş Sepeti)
- Add/remove products from cart (Sepete ürün ekleyip çıkarma)
- Increase/decrease product quantity (Ürün miktarını arttırıp azaltma)
- Dynamic cart total (Dinamik güncellenen sepet miktarı)
- Cart item badge (Sepet ürün sayısını gösterme)
- Empty cart state (Boş sepet state'i)
- SnackBar feedback (SnackBar geri bildirim,)
- Material 3 theme (Material 3 teması)

## Screens/Ekranlar

- Home/Ana Ekran
- Products/Ürünler
- Product Detail/Ürün Detayı
- Shopping Cart/Sepet Ekranı

## Tech Stack/Kullanılan araçlar

- Flutter
- Dart
- Material 3
- JSON
- StatefulWidget / setState
- Navigator
- GridView
- ListView
- FutureBuilder

## Project Structure/Proje Yapısı

```text
lib/
├── main.dart
├── models/
│   ├── products.dart
│   └── cart_item.dart
├── screens/
│   ├── home_screen.dart
│   ├── products_screen.dart
│   ├── product_detail_screen.dart
│   └── cart_screen.dart
├── services/
│   └── product_service.dart
└── widgets/
    └── product_card.dart
```

## Data Flow/Veri Akışı

```
products.json
     ↓
ProductService
     ↓
Product Model
     ↓
Product List
     ↓
ProductCard / ProductDetailScreen
     ↓
Add to Cart
     ↓
CartItem
     ↓
CartScreen

```

## What I learned in this project/Bu projede ne öğrendim

- Flutter widget architecture/Flutter widget mimarisi
- StatelessWidget & StatefulWidget
- Navigation/Navigasyon
- Passing data between screens/Ekran geçişlerinde veri korunması
- JSON parsing/JSON veri akışı
- Asset management/Ürün yönetimi
- Reusable widgets/Tekrar kullanılabilen widget'lar
- Basic state management/Temel state yönetimi
- Callback-based communication/Callback kullanarak iletişim
- List and grid layouts/List ve grid yapıları

## Future Improvements/Gelecekte ne yapabilirim

- REST API and Backend integration/Rest API ve Backend entegrasyonu
- Persistent cart storage/Sepet deposunu sürekli sabit tutma
- Product search functionality/Ürün arama özelliği
- Category filtering/Kategori filtreleme
- Authentication/Giriş yapma
- Unit and widget tests/Birim ve widget testleri

# License/Lisans

This project was created for educational and portfolio purposes.
Bu proje öğrenme ve portfolyo amaçlı yapılmıştır.
# turkic_flags 🇹🇷 🇦🇿 🇰🇿 🇰🇬 🇺🇿 🇹🇲 🇨🇾

[![pub package](https://img.shields.io/pub/v/turkic_flags.svg)](https://pub.dev/packages/turkic_flags)
[![License](https://img.shields.io/badge/license-BSD--3--Clause-blue.svg)](LICENSE)
[![Flutter Platform](https://img.shields.io/badge/Platform-Flutter-02569B?logo=flutter)](https://flutter.dev)

**Tüm Türk Dünyası bayraklarını**, özerk cumhuriyetlerini ve tarihi Türk imparatorluklarını yüksek çözünürlüklü **vektörel (SVG)** formatta sunan, özelleştirilebilir bileşenlerle (widget) donatılmış kapsamlı Flutter eklenti ve kütüphanesi.

A comprehensive Flutter package providing high-resolution vector (SVG) flags, metadata, and customizable widgets for all sovereign Turkic states, autonomous republics, and historical steppe empires.

---

## 🌟 Özellikler / Features

- **⚡ Sıfır Kurulum (Zero-Config & Embedded SVG):** Tüm bayraklar paket içine gömülü vektörel veri olarak gelir. Projenizin `pubspec.yaml` dosyasında `assets:` tanımı yapmanıza gerek yoktur!
- **📐 Sonsuz Ölçeklenebilirlik & Doğal Oran Koruma:** SVG tabanlı vektörel mimari sayesinde pikselleşme olmadan kristal netliğinde görüntü sağlar. Varsayılan olarak (`aspectRatio: null`) tüm bayraklar kendi resmi, tarihi ve otantik en-boy oranlarıyla (Örn: Kazakistan 2:1, Türkiye 3:2, Kırgızistan 5:3) deforme olmadan sergilenir. Grid, kart veya listelerde simetrik ve tekdüze bir görünüm elde etmek istediğinizde `aspectRatio: 1.5` veya `flagAspectRatio: 1.5` parametreleriyle tüm bayrakları milimetrik olarak aynı oranda simetrik bir alana sığdırabilirsiniz.
- **🎨 Zengin Gölgelendirme ve Temalandırma:** `TurkicFlagWidget` ile çok katmanlı yumuşak gölgeler, parlama (glow) efektleri, özel kenarlıklar ve yuvarlatılmış köşeler kolayca uygulanabilir.
- **🔍 Gelişmiş Arama ve Filtreleme:** `TurkicFlagsRepository` ile devlet adları, İngilizce/Türkçe açıklamalar ve kategoriler (Bağımsız, Özerk, Tarihi) arasında anlık arama yapılabilir.
- **🛡️ %100 Null-Safe & SOLID:** Modern Dart best-practice kurallarına uygun, tam null-safe, test edilebilir ve mimari açıdan temiz kod yapısı.

---

## 📦 Kurulum / Installation

Projenizin `pubspec.yaml` bağımlılıklarına ekleyin:

```yaml
dependencies:
  turkic_flags: ^1.0.3
```

Veya terminalden doğrudan yükleyin:

```bash
flutter pub add turkic_flags
```

---

## 🚀 Hızlı Kullanım / Quick Start

### 1. Basit Bayrak Gösterimi (`TurkicFlagWidget`)

Herhangi bir Türk devletinin bayrağını gölgeli ve yuvarlatılmış kenarlarla görüntülemek için:

```dart
import 'package:flutter/material.dart';
import 'package:turkic_flags/turkic_flags.dart';

class FlagExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TurkicFlagWidget(
      code: TurkicFlagCode.tr, // Türkiye Cumhuriyeti
      width: 160,              // Genişlik (Boyutlar 3:2 oranını korur)
      elevation: 6.0,          // Gölgelendirme seviyesi
      borderRadius: BorderRadius.circular(12),
    );
  }
}
```

### 2. Hazır Tanıtım Kartı (`TurkicFlagCard`)

Devlet adı, kategori rozeti ve isteğe bağlı tarihi açıklama ile şık bir kart oluşturmak için:

```dart
TurkicFlagCard(
  code: TurkicFlagCode.az,     // Azerbaycan Cumhuriyeti
  showDescription: true,       // Tarihi açıklamayı göster
  useEnglish: false,           // Türkçe veya İngilizce dil seçeneği
  flagAspectRatio: 1.5,        // Kartlarda simetrik görünüm için standart oran
  onTap: () {
    print("Azerbaycan bayrağına tıklandı!");
  },
)
```

### 3. Bayrakları Sorgulama ve Arama (`TurkicFlagsRepository`)

Tüm bayraklar arasında arama yapmak veya kategoriye göre filtrelemek için repository API'sini kullanabilirsiniz:

```dart
// 1. Kategorisine göre filtrele (Örn: Sadece Özerk Cumhuriyetler)
List<TurkicFlagProperties> autonomous = TurkicFlagsRepository.getByCategory(
  TurkicFlagCategory.autonomous,
);

// 2. Metin ile arama yap (İsim, açıklama veya koda göre)
List<TurkicFlagProperties> searchResults = TurkicFlagsRepository.search("kazakistan");

// 3. Tek bir bayrağın özelliklerine eriş
TurkicFlagProperties turkey = TurkicFlagsRepository.getByCode(TurkicFlagCode.tr);
print("Ana renkler: ${turkey.primaryColors}");
```

---

## 🏛️ Desteklenen Bayraklar Katalogu / Supported Flags

Paket içerisinde **30 farklı Türk dünyası bayrağı** 4 ana kategoride sınıflandırılmıştır:

### 🌐 1. Bağımsız Türk Devletleri (Independent States)
| Kod | Devlet Adı (TR) | Country Name (EN) |
|---|---|---|
| `TurkicFlagCode.tr` | Türkiye Cumhuriyeti | Republic of Turkey |
| `TurkicFlagCode.az` | Azerbaycan Cumhuriyeti | Republic of Azerbaijan |
| `TurkicFlagCode.kz` | Kazakistan Cumhuriyeti | Republic of Kazakhstan |
| `TurkicFlagCode.kg` | Kırgızistan Cumhuriyeti | Kyrgyz Republic |
| `TurkicFlagCode.uz` | Özbekistan Cumhuriyeti | Republic of Uzbekistan |
| `TurkicFlagCode.tm` | Türkmenistan Cumhuriyeti | Republic of Turkmenistan |
| `TurkicFlagCode.kktc` | Kuzey Kıbrıs Türk Cumhuriyeti | Turkish Republic of Northern Cyprus |

### 🏙️ 2. Özerk Türk Cumhuriyetleri ve Bölgeleri (Autonomous Republics & Regions)
| Kod | Bölge / Cumhuriyet Adı (TR) | Name (EN) |
|---|---|---|
| `TurkicFlagCode.altai` | Altay Cumhuriyeti | Altai Republic |
| `TurkicFlagCode.bashkortostan` | Başkurdistan Cumhuriyeti | Republic of Bashkortostan |
| `TurkicFlagCode.chuvashia` | Çuvaşistan Cumhuriyeti | Chuvash Republic |
| `TurkicFlagCode.gagauzia` | Gagauzya Özerk Yeri | Gagauzia |
| `TurkicFlagCode.khakassia` | Hakasya Cumhuriyeti | Republic of Khakassia |
| `TurkicFlagCode.karachayCherkessia` | Karaçay-Çerkesya Cumhuriyeti | Karachay-Cherkess Republic |
| `TurkicFlagCode.karakalpakstan` | Karakalpakistan Cumhuriyeti | Republic of Karakalpakstan |
| `TurkicFlagCode.nakhchivan` | Nahçıvan Özerk Cumhuriyeti | Nakhchivan Autonomous Republic |
| `TurkicFlagCode.sakha` | Saka (Yakutistan) Cumhuriyeti | Sakha Republic (Yakutia) |
| `TurkicFlagCode.tatarstan` | Tataristan Cumhuriyeti | Republic of Tatarstan |
| `TurkicFlagCode.tuva` | Tuva Cumhuriyeti | Tuva Republic |
| `TurkicFlagCode.eastTurkestan` | Doğu Türkistan (Uygur) | East Turkestan (Uyghur) |
| `TurkicFlagCode.crimeanTatars` | Kırım Tatar Türkleri | Crimean Tatars |
| `TurkicFlagCode.dagestan` | Dağıstan Türkleri | Dagestan Turks |

### 🤝 3. Uluslararası Kuruluşlar ve Birlikler (Organizations & Unions)
| Kod | Kuruluş / Birlik Adı | Name (EN) |
|---|---|---|
| `TurkicFlagCode.ots` | Türk Devletleri Teşkilatı | Organization of Turkic States |
| `TurkicFlagCode.turan` | Turan Birliği Bayrağı | Turan Union Flag |

### 👑 4. Tarihi İmparatorluklar ve Topluluklar (Historical Empires & Communities - 16 Büyük Türk İmparatorluğu)
| Kod | İmparatorluk / Topluluk | Name (EN) |
|---|---|---|
| `TurkicFlagCode.hun` | Büyük Hun İmparatorluğu | Great Hun Empire (Xiongnu) |
| `TurkicFlagCode.westernHun` | Batı Hun İmparatorluğu | Western Hun Empire |
| `TurkicFlagCode.europeanHun` | Avrupa Hun İmparatorluğu | European Hun Empire |
| `TurkicFlagCode.whiteHun` | Ak Hun İmparatorluğu (Eftalitler) | Hephthalite Empire (White Huns) |
| `TurkicFlagCode.gokturk` | Göktürk Kağanlığı (Kök Türk) | Göktürk Khaganate |
| `TurkicFlagCode.avar` | Avar İmparatorluğu (Avar Kağanlığı) | Avar Khaganate |
| `TurkicFlagCode.khazar` | Hazar İmparatorluğu (Hazar Kağanlığı) | Khazar Khaganate |
| `TurkicFlagCode.uyghurKhaganate` | Uygur Devleti (Uygur Kağanlığı) | Uyghur Khaganate |
| `TurkicFlagCode.karakhanid` | Karahanlı Devleti (Karahanlılar) | Kara-Khanid Khanate |
| `TurkicFlagCode.ghaznavid` | Gazne Devleti (Gazneliler) | Ghaznavid Empire |
| `TurkicFlagCode.seljuk` | Büyük Selçuklu İmparatorluğu | Great Seljuk Empire |
| `TurkicFlagCode.khwarazmian` | Harzemşahlar Devleti | Khwarazmian Empire |
| `TurkicFlagCode.goldenHorde` | Altınordu Devleti (Altın Orda) | Golden Horde |
| `TurkicFlagCode.timurid` | Büyük Timur İmparatorluğu | Timurid Empire |
| `TurkicFlagCode.mughal` | Babür İmparatorluğu (Gürkanlılar) | Mughal Empire |
| `TurkicFlagCode.ottoman` | Osmanlı İmparatorluğu | Ottoman Empire |
| `TurkicFlagCode.iraqiTurkmen` | Irak Türkmenleri | Iraqi Turkmen |
| `TurkicFlagCode.syrianTurkmen` | Suriye Türkmenleri | Syrian Turkmen |
| `TurkicFlagCode.westernThrace` | Batı Trakya Türkleri | Western Thrace Turks |

---

## 📱 Örnek Uygulama (Example App)

Paketin tüm yeteneklerini (karanlık mod, anlık arama, detay ekranı ve kod kopyalama vb.) test edebileceğiniz zengin örnek uygulamayı çalıştırmak için:

```bash
cd example
flutter run
```

---

## 🤝 Katkıda Bulunma (Contributing)

Katkılarınızı bekliyoruz! Yeni bayraklar eklemek, açıklamaları zenginleştirmek veya hata bildirimleri için lütfen bir Issue açın veya Pull Request gönderin.

## 📄 Lisans (License)

Bu proje [BSD 3-Clause Lisansı](LICENSE) ile lisanslanmıştır.

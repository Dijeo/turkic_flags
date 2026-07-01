## 1.0.4

* **100% Web & WASM Platform Support**: Removed all dependencies on `dart:io` and migrated SVG rendering engine to Flutter's official `vector_graphics` (`^1.2.2`) and `vector_graphics_compiler` (`^1.2.3`). Explicitly added `web` to supported platform definitions in `pubspec.yaml`.
* **High-Performance Static Caching**: Implemented a custom vector graphics loader (`_TurkicFlagSvgLoader`) with in-memory static caching for compiled vector data, eliminating repeated XML parsing overhead and ensuring instant rendering across all platforms and test environments.
* **Code Maintenance**: Cleaned up unnecessary imports to ensure zero static analysis warnings and 100% test coverage.

## 1.0.3

* **16 Great Turkic Empires (16 Büyük Türk İmparatorluğu) Complete Set**: Added 11 missing historical empires under the historical category (`westernHun`, `europeanHun`, `whiteHun`, `avar`, `khazar`, `uyghurKhaganate`, `karakhanid`, `ghaznavid`, `khwarazmian`, `goldenHorde`, `timurid`, `mughal`), bringing the total repository count to 41 flags and completing the traditional 16 Great Turkic Empires set.
* **Timurid Empire Flag Design Update (`TurkicFlagCode.timurid`)**: Updated the Timurid Empire flag design to align with traditional 16 Great Turkic Empires representations. Changed the background color to sky blue (`#0099FF`) and replaced the golden rings with three solid white circular emblems (`#FFFFFF`). Updated primary colors and metadata descriptions accordingly.


## 1.0.2

* **Responsive Aspect Ratio Rendering**: Updated `TurkicFlagWidget` to respect each flag's authentic, official historical or state aspect ratio by default (`aspectRatio: null`). For example, Kazakhstan (2:1), Turkey (3:2), and Kyrgyzstan (5:3) are now rendered in their exact official proportions without distortion.
* **Uniform Layout Support**: Added optional `aspectRatio` property to `TurkicFlagWidget` and `flagAspectRatio` to `TurkicFlagCard` to allow developers to enforce uniform bounding dimensions (e.g., `1.5`) when designing symmetrical grids or lists.
* **Dual-Language Support**: Added `useEnglish` property to `TurkicFlagCard` for seamless toggling between Turkish and English country/state names and descriptions.
* **Example Application Enhancements**: Refined the grid display in the example application with uniform card aspect ratios (`flagAspectRatio: 1.5`) for a cleaner, symmetrical visual experience.
* **Code Maintenance**: Removed temporary development and data collection scripts to streamline package structure and achieve zero static analysis warnings.

## 1.0.1

* **High-Precision Vector SVGs**: Updated vector SVG graphics and color palettes for several sovereign states and autonomous republics (including Kazakhstan, Turkmenistan, Uzbekistan, Altai, Bashkortostan, and more) with official high-precision vector data.
* **Performance Optimization**: Optimized embedded SVG path strings for faster parsing and reduced memory overhead.
* **General Improvements**: Minor architectural refinements and internal documentation updates.

## 1.0.0

* Initial release of `turkic_flags` package.
* Added 30 high-resolution vector SVG flags covering:
  * Independent Turkic States (Turkey, Azerbaijan, Kazakhstan, Kyrgyzstan, Uzbekistan, Turkmenistan, Northern Cyprus).
  * Autonomous Republics & Regions (Altai, Bashkortostan, Chuvashia, Gagauzia, Khakassia, Karachay-Cherkessia, Karakalpakstan, Nakhchivan, Sakha/Yakutia, Tatarstan, Tuva, East Turkestan, Crimean Tatars, Dagestan).
  * Historical Empires & Organizations (Organization of Turkic States, Turan Union, Göktürk Khaganate, Great Seljuk Empire, Ottoman Empire, Great Hun Empire, Iraqi Turkmen, Syrian Turkmen, Western Thrace Turks).
* Introduced `TurkicFlagWidget` for customizable flag rendering with multi-layered drop shadows, borders, and rounded corners.
* Introduced `TurkicFlagCard` for responsive, interactive flag showcase cards.
* Added `TurkicFlagsRepository` for querying, searching, and filtering flags by category or keywords.
* Included a comprehensive, rich Flutter example application demonstrating theme toggles, search, and detail screens.

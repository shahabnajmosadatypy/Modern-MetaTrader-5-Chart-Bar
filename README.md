# 🚀 TV Chart Overhaul for MetaTrader 5 📈

Welcome to the **TV Chart Overhaul** indicator! Transform your clunky, outdated MetaTrader 5 (MT5) charts into a sleek, modern, and aesthetic experience that mimics TradingView. 🎨✨

> **✨ Fully vibe-coded and generated with Gemini 3.1 Pro ✨**

---

## 📸 Screenshots

### Chart One
![Chart One](Chart%20One.png)

### Chart Two
![Chart Two](Chart%20Two.png)

### Chart Three
![Chart Three](Chart%20Three.png)

---

## 🌟 Features

This lightweight utility indicator completely revamps your MT5 interface with zero hassle. Here is what it does:

- **🎨 6 Stunning Aesthetic Themes:**
  - 🌙 `TradingView Dark` - The classic, easy-on-the-eyes dark mode.
  - 💜 `Purple Vibe` - A deep, neon-esque purple aesthetic.
  - 🌸 `Pink Vibe` - A clean and vibrant pink setup.
  - 🌊 `Teal Vibe` - Cool and calm teal-toned charts.
  - ⚪ `Monochrome` - A minimalistic silver/monochrome vibe.
  - 🌿 `Green Vibe` - A fresh and sharp green aesthetic.
- **🕹️ True 2D Panning:** Enables fixed scale, allowing you to click and drag the chart UP and DOWN freely—just like TradingView!
- **🧼 Clean Interface:** Automatically hides the grid and default tick volumes for a distraction-free workspace.
- **📏 Perfect Spacing:** Enables Chart Shift with a 50% size configuration, giving you that beautiful empty space on the right side of the chart.
- **🛑 No Snap-Backs:** Disables Auto-Scroll so you can look back in time without the chart annoying jumping back to the present.

---

## 🛠️ Installation

1. **Download** the `TV_Chart_Overhaul.mq5` file.
2. Open MetaTrader 5 and click on `File` -> `Open Data Folder`.
3. Navigate to `MQL5` -> `Indicators`.
4. Paste the `TV_Chart_Overhaul.mq5` file into this folder.
5. Open the **MetaEditor** (press `F4` in MT5), find the file in the Navigator, and click **Compile** at the top.
6. Restart MT5 or refresh the Indicators list in the Navigator panel.
7. Drag and drop the **TV Chart Overhaul** indicator onto any chart! 🎯

---

## ⚙️ Configuration

It's super simple! When you attach the indicator to a chart, you'll be prompted with the **Inputs** tab.

Simply change the `InpTheme` dropdown to your preferred vibe and hit OK. 🌈

---

## 🧑‍💻 Technical Details

- **Language:** MQL5
- **Performance:** Ultra-lightweight. It runs its logic entirely in `OnInit()` and requires zero calculations on each tick (`OnCalculate`), meaning absolutely no lag or CPU drain. ⚡
- **Hex Color Support:** Includes a custom `#HEX` to MT5 `color` conversion engine, making it super easy for you to add your own custom themes in the code! 🖌️

---

### 💖 Enjoy your new, beautiful trading environment! 🚀

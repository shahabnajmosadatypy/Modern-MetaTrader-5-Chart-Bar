//+------------------------------------------------------------------+
//|                                            TV_Chart_Overhaul.mq5 |
//|                                   Copyright 2026, Modern Chart   |
//|                                                                  |
//| A utility indicator that overhauls the MT5/MT4 chart appearance  |
//| to mimic the TradingView experience.                             |
//+------------------------------------------------------------------+
#property copyright "Modern Chart"
#property link      ""
#property version   "1.00"
#property indicator_chart_window
#property indicator_plots 0

//--- Theme Enumeration
enum ENUM_CHART_THEMES
  {
   THEME_TV_DARK,       // TradingView Dark
   THEME_PURPLE_VIBE,   // Purple Vibe
   THEME_PINK_VIBE,     // Pink Vibe
   THEME_TEAL_VIBE,     // Teal Vibe
   THEME_MONOCHROME,    // Monochrome/Silver Vibe
   THEME_GREEN_VIBE     // Green Vibe
  };

//--- Inputs
input ENUM_CHART_THEMES InpTheme = THEME_TV_DARK; // Chart Theme

//+------------------------------------------------------------------+
//| Custom Indicator Initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
   // 1. Apply the selected theme colors
   ApplyTheme(InpTheme);
   
   // 2. Adjust chart properties (Scaling, Grids, Modes)
   ApplyChartSettings();
   
   // Optional: If you adapt this to MQL4, you'd use WindowRedraw() instead of ChartRedraw()
   ChartRedraw();
   
   return(INIT_SUCCEEDED);
  }

//+------------------------------------------------------------------+
//| Custom Indicator Iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
   // Since this is just a visual overhaul script acting as an indicator,
   // no calculations are needed on each tick.
   return(rates_total);
  }

//+------------------------------------------------------------------+
//| Helper: Convert Hexadecimal String (e.g. "#131722") to Color     |
//+------------------------------------------------------------------+
int HexToInt(int hexChar) 
  {
   if(hexChar >= '0' && hexChar <= '9') return hexChar - '0';
   if(hexChar >= 'a' && hexChar <= 'f') return hexChar - 'a' + 10;
   if(hexChar >= 'A' && hexChar <= 'F') return hexChar - 'A' + 10;
   return 0;
  }

color HexToColor(string hex) 
  {
   // Strip the "#" if present
   if(StringSubstr(hex, 0, 1) == "#") 
      hex = StringSubstr(hex, 1);
      
   // Fallback to NONE if invalid length
   if(StringLen(hex) != 6) 
      return clrNONE;
   
   // Extract RGB values
   int r = HexToInt(StringGetCharacter(hex, 0)) * 16 + HexToInt(StringGetCharacter(hex, 1));
   int g = HexToInt(StringGetCharacter(hex, 2)) * 16 + HexToInt(StringGetCharacter(hex, 3));
   int b = HexToInt(StringGetCharacter(hex, 4)) * 16 + HexToInt(StringGetCharacter(hex, 5));
   
   // In MQL4/MQL5, color is stored natively as a 4-byte integer formatted as 0x00BBGGRR (Blue, Green, Red)
   return (color)((b << 16) | (g << 8) | r);
  }

//+------------------------------------------------------------------+
//| Apply Chart Properties (Scaling, Grids, Modes)                   |
//+------------------------------------------------------------------+
void ApplyChartSettings()
  {
   // Ensure Candlestick mode is active
   ChartSetInteger(0, CHART_MODE, CHART_CANDLES);
   
   // Turn off the grid for a cleaner look
   ChartSetInteger(0, CHART_SHOW_GRID, false);
   
   // Hide default chart volumes to reduce clutter
   ChartSetInteger(0, CHART_SHOW_VOLUMES, CHART_VOLUME_HIDE);
   
   // Enable Chart Shift to create the empty space on the right (like TV)
   ChartSetInteger(0, CHART_SHIFT, true);
   
   // Set the empty space size (50% is the maximum allowed by MT5, giving you the most space)
   ChartSetDouble(0, CHART_SHIFT_SIZE, 50.0);
   
   // Disable Auto Scroll so you can freely drag the chart without it snapping back
   ChartSetInteger(0, CHART_AUTOSCROLL, false);

   // Enable Fixed Scale. This unlocks the ability to click and drag the chart 
   // UP and DOWN freely (true 2D panning), which feels exactly like TradingView.
   ChartSetInteger(0, CHART_SCALEFIX, true);
  }

//+------------------------------------------------------------------+
//| Apply Color Theme dynamically                                    |
//+------------------------------------------------------------------+
void ApplyTheme(ENUM_CHART_THEMES theme)
  {
   color bg, fg, bullBody, bullWick, bearBody, bearWick;
   
   switch(theme)
     {
      case THEME_TV_DARK:
         bg       = HexToColor("#131722");
         bullBody = HexToColor("#089981");
         bullWick = HexToColor("#089981");
         bearBody = HexToColor("#F23645");
         bearWick = HexToColor("#F23645");
         fg       = HexToColor("#787B86"); // TradingView dark grey text
         break;
         
      case THEME_PURPLE_VIBE:
         bg       = HexToColor("#0C0C0C");
         bullBody = HexToColor("#0C7ED2");
         bullWick = HexToColor("#9C7ED2");
         bearBody = HexToColor("#4A4A4A");
         bearWick = HexToColor("#4A4A4A");
         fg       = clrLightGray;
         break;
         
      case THEME_PINK_VIBE:
         bg       = HexToColor("#0C0C0C");
         bullBody = HexToColor("#FFFFFF");
         bullWick = HexToColor("#E8E8E8");
         bearBody = HexToColor("#FF5C8D");
         bearWick = HexToColor("#FF8FAF");
         fg       = clrLightGray;
         break;
         
      case THEME_TEAL_VIBE:
         bg       = HexToColor("#000000");
         bullBody = HexToColor("#455E6B");
         bullWick = HexToColor("#395360");
         bearBody = HexToColor("#BDBCBC");
         bearWick = HexToColor("#989797");
         fg       = clrDarkGray;
         break;
         
      case THEME_MONOCHROME:
         bg       = HexToColor("#0C0C0C");
         bullBody = HexToColor("#FFFFFF");
         bullWick = HexToColor("#B8B8B8");
         bearBody = HexToColor("#4A4A4A");
         bearWick = HexToColor("#636363");
         fg       = clrSilver;
         break;
         
      case THEME_GREEN_VIBE:
         bg       = HexToColor("#000000");
         bullBody = HexToColor("#00B242");
         bullWick = HexToColor("#69C97D");
         bearBody = HexToColor("#BDBCBC");
         bearWick = HexToColor("#989797");
         fg       = clrSilver;
         break;
         
      default:
         return;
     }
   
   // Background & Text/Axes
   ChartSetInteger(0, CHART_COLOR_BACKGROUND, (long)bg);
   ChartSetInteger(0, CHART_COLOR_FOREGROUND, (long)fg);
   
   // Bullish Candle Colors
   // CHART_COLOR_CANDLE_BULL sets the body
   // CHART_COLOR_CHART_UP sets the wicks and the body outline
   ChartSetInteger(0, CHART_COLOR_CANDLE_BULL, (long)bullBody);
   ChartSetInteger(0, CHART_COLOR_CHART_UP,    (long)bullWick);
   
   // Bearish Candle Colors
   // CHART_COLOR_CANDLE_BEAR sets the body
   // CHART_COLOR_CHART_DOWN sets the wicks and the body outline
   ChartSetInteger(0, CHART_COLOR_CANDLE_BEAR, (long)bearBody);
   ChartSetInteger(0, CHART_COLOR_CHART_DOWN,  (long)bearWick);
   
   // Misc UI Elements
   ChartSetInteger(0, CHART_COLOR_CHART_LINE, (long)fg); // Doji/Line charts
   ChartSetInteger(0, CHART_COLOR_GRID,       (long)bg); // Blend grid with bg if it accidentally shows
  }
//+------------------------------------------------------------------+

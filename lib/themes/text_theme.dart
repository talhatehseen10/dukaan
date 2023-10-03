part of themes;

const _superBold = FontWeight.w900;
const _bold = FontWeight.w700;
const _semiBold = FontWeight.w600;
const _medium = FontWeight.w500;
const _regular = FontWeight.w400;
//const _light = FontWeight.w300;

TextTheme buildTextTheme({
  required Color textColor,
  required Color buttonColor,
}) =>
    TextTheme(
      displayLarge: TextStyle(
        fontSize: Sizes.TEXT_SIZE_96,
        color: textColor,
        fontWeight: _superBold,
        fontStyle: FontStyle.normal,
        fontFamily: AppStrings.WORK_SANS,
      ),
      displayMedium: TextStyle(
        fontSize: Sizes.TEXT_SIZE_60,
        color: textColor,
        fontWeight: _bold,
        fontStyle: FontStyle.normal,
        fontFamily: AppStrings.WORK_SANS,
      ),
      displaySmall: TextStyle(
        fontSize: Sizes.TEXT_SIZE_48,
        color: textColor,
        fontWeight: _bold,
        fontStyle: FontStyle.normal,
        fontFamily: AppStrings.WORK_SANS,
      ),
      headlineMedium: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: Sizes.TEXT_SIZE_34,
          color: textColor,
          fontWeight: _regular,
        ),
      ),
      headlineSmall: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: Sizes.TEXT_SIZE_24,
          color: textColor,
        ),
      ),
      titleLarge: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: Sizes.TEXT_SIZE_24,
          color: textColor,
          fontWeight: _bold,
        ),
      ),
      titleMedium: GoogleFonts.poppins(
          textStyle: TextStyle(
        fontSize: Sizes.TEXT_SIZE_16,
        color: textColor,
        fontWeight: _semiBold,
      )),
      titleSmall: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: Sizes.TEXT_SIZE_14,
          color: textColor,
          fontWeight: _semiBold,
          // fontStyle: FontStyle.normal,
          // fontFamily: AppStrings.WORK_SANS,
        ),
      ),
      bodyLarge: GoogleFonts.poppins(
          textStyle: TextStyle(
        fontSize: Sizes.TEXT_SIZE_16,
        color: textColor,
      )),
      bodyMedium: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: Sizes.TEXT_SIZE_14,
          color: textColor,
          //fontWeight: _light,
        ),
      ),
      labelLarge: TextStyle(
        fontSize: Sizes.TEXT_SIZE_14,
        color: buttonColor,
        fontStyle: FontStyle.normal,
        fontFamily: AppStrings.WORK_SANS,
        fontWeight: _medium,
      ),
      bodySmall: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: Sizes.TEXT_SIZE_12,
          color: textColor,
        ),
      ),
    );

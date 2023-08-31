import 'package:flutter/material.dart';

int selectedPage = 0;
var id;
var name;

class AppColorAssets{
  static const Color appGreenColor = Color(0xff07AD5A);
  static const Color appWhiteColor = Color(0xFFFFFFFF);
  static const Color appGreyColor = Color(0xFF9E9E9E);
  static const Color appRedColor = Color(0xFFEB1717);
  static const Color appDataColor = Color(0xffAFAFAF);
  static const Color appRatingStarColor = Color(0xFFF3D434);
  static const Color vendorCategoryColor = Color(0xff00A651);
  static const Color filterResetColor = Color(0xff61AB43);
  static const Color unitTextColor = Color(0xffC8C8C8);
  static const Color productBodyTextColor = Color(0xffE3E3E3);
  static const Color clearApplyColor = Color(0xff9F9F9F);
}

class AppTextAssets{
 static const List item = [
    'Rating',
    'Most Popular',
    'Lowest Price',
    'Highest Price',
    'Your search (default)'
  ];
 static const List itemz = [
    'Highest rating',
    'Lowest rating',
    'Most recent',
    'Oldest',
    'Default'
  ];
  static const String homeText='Home';
  static const String menuText='Menu';
  static const String favoriteText='Favorites';
  static const String accountText='Account';
  static const String searchText='I\'m looking for...';
  static const String allCategoriesText="All Categories";
  static const String recommendedText="Recommended";
  static const String newProductText="New Products";
  static const String filterButtonText='Filters';
  static const String searchTitleText='Search Result';
  static const String viewAllText="View all";
  static const String recommendedItemText='25 Results for “Recommended Products”';
  static const String newProductItemText='75 Results for “New Products"';
  static const String sortByText='Sort by';
  static const String detailScreenBackText='Back to results';
 static const String totalReviewsText='200 reviews';
 static const String elevatedReviewsText='Add your review';
 static const String elevatedVendorText='Tesco';
 static const String productNotesText='Product Notes ';
 static const String seeMoreText='(click to see more)';
 static const String unitsText='Units:';
 static const String categoryText='Categories';
 static const String appRatingText='Rating';
 static const String appReviewText='reviews';
 static const String seeAllText='See all';
 static const String giveRatingText='Give your rating';
 static const String filterText='Filters';
 static const String superMarketText='Supermarkets';
 static const String resetText='Reset';
 static const String tescoText='Tesco';
 static const String aldiText='Aldi';
 static const String asdaText='Asda';
 static const String sainsburyText='Sainsbury\'s';
 static const String lidlText='Lidl';
 static const String ocadoText='Ocado';
 static const String clearBtnText='Clear All';
 static const String applyBtnText='Apply';
 static const String menuScreenText='This is menu screen!';
 static const String accountScreenText='This is account screen!';
}
class AppAssets{
  static const String navImage= 'assets/images/top_nav.png';
  static const String logoImage ='assets/images/logo.png';
  static const String circleAvatarImage ='assets/images/image.png';
}

class AppTextStyleAssets{
  static const TextStyle textFieldWidgetStyle= TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
  );
  static const TextStyle viewAllTextStyle= TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColorAssets.appRatingStarColor,
  );
  static const TextStyle homeTextHeadingStyle=TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle recommendTextHeadStyle=TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600
  );
  static const TextStyle recommendTextBodyStyle=TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400
  );
  static const TextStyle containerWidgetTextStyle=TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      color: AppColorAssets.vendorCategoryColor
  );
  static const TextStyle productBodyHeadingStyle=TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600
  );
  static const TextStyle productBodyDetailTextStyle=TextStyle(
      color: AppColorAssets.productBodyTextColor,
      fontSize: 10,
      fontWeight: FontWeight.w400
  );
  static const TextStyle productBodyPriceStyle=TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600
  );
  static const TextStyle productBodyRatingStyle=TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400
  );
  static const filterSrnFilterHeadingStyle= TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
  );
  static const filterSrnSuperMrktStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  static const filterSrnResetStyle = TextStyle(
    color: AppColorAssets.filterResetColor,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
    decorationThickness: 2,
  );
  static const TextStyle  sortBy= TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle detailBtmHeadngTxtStyle=TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle detailBtmUnitTxtStyle=TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    color: AppColorAssets.unitTextColor,
  );
  static const TextStyle detailBtmPriceTxtStyle=TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColorAssets.vendorCategoryColor,
  );
  static const TextStyle reviewNameTxtStyle =TextStyle(
      color: AppColorAssets.appDataColor,
      fontSize: 10.0
  );
  static const vendorRatingWidgetTxtStyle=TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static const vendorRtgWgtSeeAllTxtStyle=TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColorAssets.vendorCategoryColor,
  );
  static const vendrRtgCategoryTxtStyle= TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const vendrProductTxtStyle=TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const vendrCTSMTxtStyle=TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
  );
}

class ConstantButtonStyle{
  static final ButtonStyle clearButtonStyle = TextButton.styleFrom(
    foregroundColor: AppColorAssets.clearApplyColor,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),),
    side: const BorderSide(color: AppColorAssets.clearApplyColor, width: 1,),
  );
  static final ButtonStyle applyButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColorAssets.clearApplyColor,
    shape:  RoundedRectangleBorder(
      borderRadius:  BorderRadius.circular(30.0),
    ),
  );
}

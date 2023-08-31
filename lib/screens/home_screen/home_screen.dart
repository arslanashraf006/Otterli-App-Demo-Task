import '../../services/recommended_product_service.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../services/new_product_services.dart';
import '../../widgets/card_widget.dart';
import 'components/categories_widget.dart';
import 'components/home_refs_text_widget.dart';
import 'components/recommend_card_widget.dart';
import '../../widgets/text_field_widget.dart';
import '../../widgets/vertical_sized_widget.dart';
import 'package:flutter/material.dart';
import '../search_result_screen/search_result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<RecommendedProductServices>(context,listen: false).getRecommendProductdata();
    Provider.of<NewProductServices>(context,listen: false).getNewProductdata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColorAssets.appWhiteColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AppAssets.navImage, width: double.infinity,),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenSize.height*0.015,
                     // top: 13.0,
                  ),
                  child: Center(
                    child: SizedBox(
                      height: screenSize.height*0.08,
                        width: screenSize.width*0.48,
                        // height: 50,
                        // width: 160,
                        child: Image.asset(AppAssets.logoImage)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenSize.width*0.06,
                    top: screenSize.height*0.031,
                    right: screenSize.width*0.06
                    //   left: 24,
                    // top: 31.0,
                    // right: 24,
                  ),
                  child: TextFieldWidget(
                    height: screenSize.height*0.06,
                      width: screenSize.width*0.872,
                      // height: 48,
                      // width: 372,
                      hintText: AppTextAssets.searchText),
                ),
                 Padding(
                  padding: EdgeInsets.only(
                    top: screenSize.height*0.036,
                      left: screenSize.width*0.06,
                      // top: 26.0,
                      // left: 24,
                  ),
                  child: const Text(AppTextAssets.allCategoriesText, style: AppTextStyleAssets.homeTextHeadingStyle),
                ),
                const CategoriesWidget(),
                Consumer<RecommendedProductServices>(
                  builder: (context, snapshot,_) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                          SearchResultScreen(snapshot.data!.count!),

                      ),
                      );
                    },
                    child: HomeRefsTextWidget(title: AppTextAssets.recommendedText,
                    ),
                  );
                },),

                Padding(padding: EdgeInsets.only(
                  left: screenSize.width*0.06,
                    right: screenSize.width*0.06,
                    top: screenSize.height*0.02
                    // left: 20.0,
                    // right: 24.0,
                    // top: 20,
                ),
                    child: SizedBox(
                      width: double.infinity,
                      height: screenSize.width*0.6,
                      //height: 220,
                      child: RecommendedCardWidget(),),
                ),
                Consumer<NewProductServices>(
                  builder: (context, snapshot,_) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                            SearchResultScreen(snapshot.data!.count!),

                        ),
                        );
                      },
                      child: HomeRefsTextWidget(title: AppTextAssets.newProductText,
                      ),
                    );
                  },),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenSize.width*0.05,
                      right: screenSize.width*0.05,
                      top: screenSize.height*0.02
                      // left: 20.0,
                      // right: 20.0,
                      // top: 20,
                  ),
                  child: CardWidget(),//NewProductCardWidget(),
                ),
                VerticalSizedWidget(30),
            ]
            ),
          ),
        ),
      )
      );
  }
}


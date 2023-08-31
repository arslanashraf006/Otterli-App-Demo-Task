import '../widgets/horizontal_sized_widget.dart';

import '../services/recommended_product_service.dart';
import '../services/product_detail_services.dart';
import '../services/categoriess_services.dart';
import '../services/new_product_services.dart';
import '../screens/account_screen.dart';
import 'screens/favorite_screen/favorite_screen.dart';
import 'screens/home_screen/home_screen.dart';
import '../screens/menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';
import 'services/reviews_services.dart';
import 'widgets/bottom_bar_btn_widget.dart';
import 'widgets/floating_action_btn_widget.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColorAssets.appGreenColor,
    statusBarBrightness: Brightness.dark,
  ),
  );
  SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final _pageOptions = [
    HomeScreen(),
    MenuScreen(),
    FavoriteScreen(),
    AccountScreen(),
   // SearchResultScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewProductServices(),),
        ChangeNotifierProvider(create: (_) => CategoriesServices(),),
        ChangeNotifierProvider(create: (_) => ReviewsServices(),),
        //ChangeNotifierProvider(create: (_) => ProductDetailServices(),),
        ChangeNotifierProvider(create: (_) => RecommendedProductServices(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          extendBody: true,
          body: _pageOptions[selectedPage],
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionBtnWidget(
          //   onPressed: () {
          //   setState(() {
          //     selectedPage=4;
          //   });
          // },
          ),
          bottomNavigationBar: Builder(
            builder: (context) {
              Size screenSize=MediaQuery.of(context).size;
              return ClipRRect(
                child: BottomAppBar(
                shape: const CircularNotchedRectangle(),
        notchMargin: 7,
        child: Container(
         height: 65,
              color: Colors.transparent,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Row(
               // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HorizontalSizedWidget(
                    screenSize.width*0.07
                      //25
                  ),
                  BottomBarBtnWidget(title: AppTextAssets.homeText, icon: Icons.home,pageNumber: 0,onPressed: () {
                    setState(() {
                      selectedPage=0;
                    });
                  },),
                  HorizontalSizedWidget(
                    screenSize.width*0.15
                      //60
                  ),
                  BottomBarBtnWidget(title: AppTextAssets.menuText, icon: Icons.menu,pageNumber: 1,onPressed: () {
                    setState(() {
                      selectedPage=1;
                    });
                  },),
                ],
              ),
              Row(
               // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HorizontalSizedWidget(
                    screenSize.width*0.23
                      //90
                  ),
                  BottomBarBtnWidget(title: AppTextAssets.favoriteText, icon: Icons.favorite,pageNumber: 2,onPressed: () {
                    setState(() {
                      selectedPage=2;
                    });
                  },),
                  HorizontalSizedWidget(
                    screenSize.width*0.11
                      //45
                  ),
                  BottomBarBtnWidget(title: AppTextAssets.accountText, icon: Icons.person,pageNumber: 3,onPressed: () {
                    setState(() {
                      selectedPage=3;
                    });
                  },),
                 // HorizontalSizedWidget(20),
                ],
              ),
              ]
        ),
        ),
      ),
      );
            }
          ),
        ),
      ),
    );
  }
}

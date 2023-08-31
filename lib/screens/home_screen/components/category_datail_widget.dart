import '../../Detail_vendor_screen/details_1_vender_screen.dart';
import '../../../services/product_detail_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../search_result_screen/components/search_filter_widget.dart';
import '../../../widgets/container_widget.dart';
import '../../../widgets/favorite_icon_widget.dart';
import '../../../widgets/horizontal_sized_widget.dart';
import '../../../widgets/pop_screen_widget.dart';
import '../../../widgets/title_widget.dart';
import '../../../widgets/vertical_sized_widget.dart';

class CategoryDetailWidget extends StatelessWidget {
  final String namee;
   CategoryDetailWidget({required this.namee});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Consumer<ProductDetailServices>(
                builder: (context, snapshot,_) {
                  if (snapshot.isloading) {
                    return Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(AppAssets.navImage, width: double.infinity,),
                VerticalSizedWidget(25.0),
                Row(
                  children: [
                    HorizontalSizedWidget(20.0),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: PopScreenWidget(title: AppTextAssets.homeText),
                    ),
                    HorizontalSizedWidget(50.0),
                    TitleWidget(title: AppTextAssets.searchTitleText, fontWeight: FontWeight.normal),
                  ],
                ),
                VerticalSizedWidget(41),
                SearchFilterWidget(),
                VerticalSizedWidget(30),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text('25 Results for “Recommended Products”')
                ),
                VerticalSizedWidget(26),
                SizedBox(
                  width: double.infinity,
                  height: 550,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20,right: 20),
                    child: Container(
                      width: double.infinity,
                      height: 480,
                      child: GridView.builder(
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 2.0,
                                    crossAxisSpacing: 2.0,
                                    crossAxisCount: 2,
                                    //childAspectRatio: 1/3,
                                  ),

                                  itemCount: snapshot.data!.categories!.length,
                                  itemBuilder: (context, index) {
                                    if(name==snapshot.data!.categories![index].toString()){
                                      return GestureDetector(
                                        onTap: () {
                                          id = snapshot.data!.id;
                                          Navigator.of(context).push(
                                              MaterialPageRoute(builder: (context) {
                                                return DetailVenderScreen(snapshot.data!.id!.toInt());
                                              },));
                                        },
                                        child: Column(
                                          children: [
                                            //if(snapshot.data!.count == 25)...[
                                            Card(
                                              elevation: 1,
                                              color: const Color(0xffFFFFFF),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(12.0)),
                                              child: SizedBox(
                                                width: 170,
                                                child: Stack(
                                                  children: [
                                                    const Padding(
                                                      padding: EdgeInsets.only(left: 140, top: 8.0),
                                                      child: FavoriteIconWidget(),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.only(
                                                            top: 12.0,),
                                                          child: Center(
                                                              child: SizedBox(
                                                                  height: 65,
                                                                  width: 77,
                                                                  child: Image.network(
                                                                      snapshot.data!.imageUrl.toString()))),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(
                                                              top: 8.0, left: 10.0),
                                                          child: Text(snapshot.data!.name.toString(),
                                                            overflow: TextOverflow.ellipsis,
                                                            style: AppTextStyleAssets
                                                                .recommendTextHeadStyle,),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(
                                                              left: 10.0, right: 10.0, top: 7.0),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment
                                                                .spaceBetween,
                                                            children: [
                                                              Container(
                                                                height: 17,
                                                                width: 40,
                                                                child: ListView.builder(
                                                                    itemCount: snapshot.data!.vendors!.length,
                                                                    itemBuilder: (context,num) {
                                                                      return Text('\$${snapshot.data!.vendors![num].price!.price}',

                                                                          style: AppTextStyleAssets.recommendTextBodyStyle);
                                                                    }
                                                                ),
                                                              ),
                                                              Row(children: const [
                                                                Icon(Icons.star_half,
                                                                  color: Color(0xffF3D434),
                                                                  size: 14,),
                                                                Text('0.0', style: AppTextStyleAssets
                                                                    .recommendTextBodyStyle,),
                                                              ],)
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(
                                                              top: 10.0, left: 8, bottom: 12.0),
                                                          child: Row(
                                                            children: const [
                                                              ContainerWidget(text: 'Tesco',
                                                                // width: 36,
                                                                // height: 18,
                                                              ),
                                                              SizedBox(width: 5,),
                                                              ContainerWidget(text: 'Aldi',
                                                                // height: 18,
                                                                // width: 23,
                                                              ),
                                                              SizedBox(width: 5,),
                                                              ContainerWidget(text: 'Asda',
                                                                // width: 36,
                                                                // height: 18,
                                                              ),

                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],

                                          // ],
                                        ),
                                      );
                                    }
                                    return Container();
                                  }
                              ),
                              ),
                              ),
                              ),
    ]
                    );
                            }
                            return Center(child: CircularProgressIndicator());
                          }
                      ),
                    ),
                  ),
                ),
              //  VerticalSizedWidget(60),
            );
  }
}

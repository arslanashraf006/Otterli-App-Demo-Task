import 'package:provider/provider.dart';
import '../../Detail_vendor_screen/details_1_vender_screen.dart';
import '../../../services/recommended_product_service.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../widgets/container_widget.dart';
import '../../../widgets/favorite_icon_widget.dart';
class RecommendedCardWidget extends StatefulWidget {

  @override
  State<RecommendedCardWidget> createState() => _RecommendedCardWidgetState();
}

class _RecommendedCardWidgetState extends State<RecommendedCardWidget> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<RecommendedProductServices>(context,listen: false).getRecommendProductdata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize=MediaQuery.of(context).size;
    return  Consumer<RecommendedProductServices>(
      builder: (context,snapshot,_) {
        if(snapshot.isloaded){
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.results!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async{
                    id=snapshot.data!.results![index].id;
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return DetailVenderScreen(snapshot.data!.results![index].id!.toInt());}));
                  },
                  child: Card(
                    elevation: 1,
                    color: AppColorAssets.appWhiteColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                    child: SizedBox(
                      width: screenSize.width*0.47,
                     // width: 170,
                      child: Stack(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 140,top: 8.0),
                            child: FavoriteIconWidget(),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0,),
                                child: Center(child: SizedBox(
                                    height: 105,
                                    width: screenSize.width*0.1925,
                                    //width: 77,
                                    child: Image.network(snapshot.data!.results![index].imageUrl.toString()))),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0,left: 10.0),
                                child: Text(snapshot.data!.results![index].name.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: AppTextStyleAssets.recommendTextHeadStyle),),
                              Padding(
                                padding: const EdgeInsets.only(left:10.0,right: 10.0,top: 7.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 17,
                                     width: screenSize.width*0.1,
                                     // width: 40,
                                      child: ListView.builder(
                                          itemCount: snapshot.data!.results![index].vendors!.length,
                                          itemBuilder: (context,num) {
                                            return Text('\$${snapshot.data!.results![index].vendors![num].price!.price}',

                                                style: AppTextStyleAssets.recommendTextBodyStyle);
                                          }
                                      ),
                                    ),
                                    Row(children: [
                                      const Icon(Icons.star_half,color: AppColorAssets.appRatingStarColor,size: 14,),
                                      Text(snapshot.data!.results![index].reviews!.avgRating.toString(),
                                          style: AppTextStyleAssets.recommendTextBodyStyle,
                                      ),
                                    ],)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0,left: 8,bottom: 12.0),
                                child: SizedBox(
                                  height: 20,
                                 width: screenSize.width*0.4,
                                 // width: 120,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapshot.data!.results![index].vendors!.length,
                                      itemBuilder: (context,numb) {
                                        return Row(
                                          children: [
                                            snapshot.data!.results![index].vendors![numb].vendor!.isEmpty
                                                ? Container()
                                                : ContainerWidget(text: snapshot.data!.results![index].vendors![numb].vendor!.toString(),
                                              // width: screenSize.width*0.12,
                                              // height: 18,
                                              // width: 36,
                                            ),
                                            const SizedBox(width: 5,),
                                          ],
                                        );
                                      }
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }

          );
        }
        return const Center(child: CircularProgressIndicator(),);
      }
    );

  }
}




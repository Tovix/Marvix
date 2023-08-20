import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marvix/models/productsModel/ProductsModel.dart';
import 'package:marvix/modules/cubit/shopCubit.dart';
import 'package:marvix/modules/cubit/shopCubitStates.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../shared/Components/components.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({Key? key, required this.receivedProduct, required this.index}) : super(key: key);
  final ProductsModel receivedProduct;
  final int index;


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ShopCubit, ShopCubitStates>(builder: (context, state){
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(backgroundColor: Theme.of(context).colorScheme.background, elevation: 0,
            leading:Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 15, 0, 0),
                  child: IconButton(onPressed: ()
                  {
                    Navigator.pop(context);
                  },
                      icon: Icon(FontAwesomeIcons.arrowLeft, color: Theme.of(context).colorScheme.secondary,)),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Center(
                    child: Text(receivedProduct.title.toString(), style: TextStyle(fontWeight: FontWeight.bold,
                        fontSize: 20, color: Theme.of(context).colorScheme.secondary,), textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis, maxLines: 1, ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 15, 10, 0 ),
                  child: IconButton(onPressed: ()
                  {
                    ShopCubit.of(context).toggleFavorite(index);

                  },
                      icon: ShopCubit.of(context).favorites![receivedProduct.id] == 0 ? FaIcon(FontAwesomeIcons.heart, color: Theme.of(context).colorScheme.secondary,
                          ) :
                      FaIcon(FontAwesomeIcons.solidHeart, color: Theme.of(context).colorScheme.secondary)),
                ),
              ),
            ],
          ), leadingWidth: 450,),),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
      [
        Expanded(
          flex:15,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
            child: Container(
              decoration: BoxDecoration(
                  boxShadow:[BoxShadow(
                    color: Colors.black.withOpacity(0.7),
                    spreadRadius: 0,
                    blurRadius: 1,
                    blurStyle: BlurStyle.outer,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),]
                  ,color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(15)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(receivedProduct.images![0],
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                  return const Center(child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Text('Error Loading Image', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                  ));},
                  width: double.infinity, height: 325, fit: BoxFit.cover, loadingBuilder:
                      (BuildContext context, Widget child,ImageChunkEvent? loadingProgress)
                  {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null ?
                        loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                            : null,
                      color: Colors.black,),
                    );
                  },),
              ),
            )
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Text(
              receivedProduct.title.toString(),
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.bold,
                fontSize: 25, height: 1),
              maxLines: 2,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Text("${receivedProduct.price.toString()} \$", style: TextStyle( fontSize: 30,
                fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary, height: 1.5),),
          ),
        ),
        Expanded(
          flex:4,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Text(receivedProduct.description.toString(),
              style: TextStyle( fontSize: 19, color: Theme.of(context).colorScheme.secondary, height: 1.2),
              overflow: TextOverflow.ellipsis, maxLines: 3,),
          ),
        ),
        Expanded(
          flex: 0,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Text("Color:", style: TextStyle( fontSize: 17, fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary, height: 0.5),),
          ),
        ),
        Expanded(
          flex: 3,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow:[BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      spreadRadius: 0,
                      blurRadius: 1,
                      blurStyle: BlurStyle.outer,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),]
                    ,color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(25)),
                child: ToggleSwitch(
                  minWidth:95,
                  initialLabelIndex: 0,
                  totalSwitches: 4,
                  labels: const ['Blue', 'Indigo', 'Peach', 'Grey'],
                  onToggle: (index) {},
                  inactiveBgColor: Theme.of(context).colorScheme.secondary,
                  inactiveFgColor: Theme.of(context).colorScheme.primary,
                  cornerRadius: 25,
                  animate: true,
                  activeBgColors: const [[Color(0xFF99B2DD)], [Color(0xFF08415C)], [Color(0XFFF1BF98)], [Color(0XFF6B818C)]],
                  fontSize: 17,
                  customTextStyles: const [TextStyle(fontWeight: FontWeight.bold)],
                  curve: Curves.linear,

                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 0,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Text("Size:", style: TextStyle( fontSize: 17, fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary, height: 0.5),),
          ),
        ),
        Expanded(
          flex: 3,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 10),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow:[BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      spreadRadius: 0,
                      blurRadius: 1,
                      blurStyle: BlurStyle.outer,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),]
                    ,color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(25)),
                child: ToggleSwitch(
                  minWidth:95,
                  initialLabelIndex: 0,
                  totalSwitches: 4,
                  labels: const ['32-36', '37-40', '41-44', '45-48'],
                  onToggle: (index) {},
                  inactiveBgColor: Theme.of(context).colorScheme.secondary,
                  inactiveFgColor: Theme.of(context).colorScheme.primary,
                  cornerRadius: 25,
                  animate: true,
                  activeBgColor: [Theme.of(context).colorScheme.primary],
                  activeFgColor: Theme.of(context).colorScheme.secondary,
                  fontSize: 17,
                  customTextStyles: const [TextStyle(fontWeight: FontWeight.bold)],
                  curve: Curves.linear,

                ),
              ),
            ),
          ),
        ),

      ],),
          bottomNavigationBar: Container(
              decoration: BoxDecoration(boxShadow:[BoxShadow(
                color: Colors.black.withOpacity(0.7),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 2), // changes position of shadow
              ),], color: Theme.of(context).colorScheme.background),
            child: Row(
              children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 15),
                  child: Text("Price:\n${receivedProduct.price.toString()} \$",
                    style: TextStyle( fontSize: 19, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary),),
                ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                    child: defButton(text: "Add to Cart", onPressed: ()
                    {
                      ShopCubit.of(context).addProductToCart(receivedProduct.id);
                    }, color: Theme.of(context).colorScheme.secondary,
                        textColor: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ],
            )
          )
      );
      },
        listener: (context, state)
        {
          if(state is ShopAddItemToCartSuccessState)
          {
            final snackBar = defSnackBar("Product Added Successfully to your Cart",
                Theme.of(context).colorScheme.secondary, context);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }

          if(state is ShopAddItemToCartFailState)
          {
            final snackBar = defSnackBar("Product is Already in your Cart",
                Theme.of(context).colorScheme.secondary, context);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        });
  }
}

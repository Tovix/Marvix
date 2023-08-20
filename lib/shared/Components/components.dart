// imports
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:marvix/models/CategoriesModel/categoriesModel.dart';
import 'package:marvix/models/productsModel/ProductsModel.dart';
import 'package:marvix/modules/cubit/shopCubit.dart';
import 'package:marvix/modules/login/loginCubit/loginCubit.dart';
import 'package:marvix/modules/register/registerCubit/registerCubit.dart';
import '../../models/onBoardingModels/onboardingModel.dart';
import '../../modules/categories/selectedCategory.dart';
import '../../modules/home/productInfo.dart';


// variables

// OnBoarding Widget
Widget onBoardingWidget(BoardingModel model, BuildContext context) =>
    Column(mainAxisSize: MainAxisSize.max, children: [
    // Image / App Title Expanded
    Expanded(
      flex: 4,
      child: Stack(
        alignment: Alignment.topCenter,
        children:
        [
          ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.transparent],
              ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
            },
            blendMode: BlendMode.dstIn,
            child: Image.asset(
              model.imagePath,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 450),
            child: Center(child:Stack(
              children: <Widget>[
                // Stroked text as border.
                Text(
                  'M a r v i x',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 7
                      ..color = Theme.of(context).colorScheme.primary,
                  ),
                ),
                // Solid text as fill.
                Text(
                  'M a r v i x',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    fontSize: 23,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
                ),
          )
        ],),
    ),
    // First Text Expanded
    Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(children:
        [
          Expanded(
            flex:0,
            child: Center(child: Text(model.textOne,
              style: TextStyle(fontSize: 27,
                fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary, height: 1.1),),),
          ),
          Expanded(
            flex:0,
            child: Center(child: Text(model.textTwo,
                style: TextStyle(fontSize: 27,
                fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary, height: 1.1)),),
          ),
          Expanded(
            flex: 0,
              child: Center(child: Text(model.textThree,
                style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.secondary, height: 1.1), ),)),
          Expanded(
            flex: 0,
              child: Center(child: Text(model.textFour,
                style: TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.secondary, height: 1.1), ),))
        ],),
      ),
    ),
  ],);

// default text field
Widget defTextField({required TextEditingController teController, required String leadingText,
  required IconData prefixIcon, required TextInputType type, suffixIcon, validFunction, required bool isDisabled,
  required BuildContext context, isObscure = false, int option = 0}) =>
    TextFormField(
      enabled: isDisabled,
      obscureText: isObscure,
      cursorColor: Theme.of(context).colorScheme.secondary,
      style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.secondary,
                width: 3)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.secondary,
                  width: 3)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(color: Colors.black54,
                width: 3,)),
          filled: true,
          fillColor: Theme.of(context).colorScheme.primary,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(prefixIcon, color: Theme.of(context).colorScheme.secondary, size: 23,),
                const SizedBox(width: 5,),
                Text(leadingText, style:
              TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Theme.of(context).colorScheme.secondary,),),],),),
          suffixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: IconButton(onPressed: ()
            {
              if(option == 1)
              {
                RegisterCubit.of(context).toggleShowPassword();

              }
              if(option == 2)
              {
                LoginCubit.of(context).toggleShowPassword();
              }

            }, icon:Icon(suffixIcon, color: Theme.of(context).colorScheme.secondary,) ,),
          ),
          suffixIconColor: Colors.black,
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                  color: Theme.of(context).textTheme.displayLarge!.color!,
                  width: 3)),
          errorStyle: TextStyle(color: Theme.of(context).textTheme.displayLarge!.color!,
              fontWeight: FontWeight.w700, height:0.5, fontSize: 11), focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.secondary,
              width: 3 ), borderRadius: BorderRadius.circular(25),),
         ),

      controller: teController, keyboardType: type, validator: validFunction,);

// default button
Widget defButton({required String text, required Function() onPressed, required Color color, required Color textColor}) =>  Material(  //Wrap with Material
  shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(25)),
  clipBehavior: Clip.antiAlias, // Add This
  child: MaterialButton(
    minWidth: 375.0,
    height: 50,
    color: color,
    onPressed: onPressed,
    child: Text(text,
        style: TextStyle(fontSize: 16.0, color: textColor, fontWeight: FontWeight.bold)),
  ),
);

// navigation through screen [2Methods]
void navigate(context, screen) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
void navigateEnd(context, screen) =>
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => screen), (Route <dynamic> route) => false);

// snackBar Widget
defSnackBar(String message, Color color, BuildContext context) => SnackBar(content: Text(message, style:
TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold),),
  backgroundColor: color, shape: RoundedRectangleBorder(side:
    BorderSide(color: Theme.of(context).colorScheme.primary, width: 2),
        borderRadius: BorderRadius.circular(25)), elevation: 0, behavior: SnackBarBehavior.floating,);

// default icon-label button
Widget defLabelIconButton(String text, IconData icon, Function() onPressed, Color textColor) => MaterialButton(
  height: 45,
  onPressed: onPressed,
  child: Row(children: [Padding(padding: const EdgeInsets.fromLTRB(0, 0, 10, 0), child: Icon(icon, size: 16,
    color: textColor,),),Text(text,
      style: TextStyle(fontSize: 18.0, color: textColor, fontWeight: FontWeight.w600)), const Spacer(),
    Icon(FontAwesomeIcons.arrowRightLong, color: textColor,)],), );

// products item widget
Widget productItemBuilder(ProductsModel model, BuildContext context, int index) => GestureDetector(
  onTap: () {
    navigate(context, ProductInfo(receivedProduct: model, index: index,));
  },
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 9,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(7,7,7,0),
              child: Container(
                decoration: BoxDecoration(boxShadow:[BoxShadow(
                  color: Colors.black.withOpacity(0.7),
                  spreadRadius: 0,
                  blurRadius: 1,
                  blurStyle: BlurStyle.outer,
                  offset: const Offset(0, 0), // changes position of shadow
                ),], borderRadius: BorderRadius.circular(15)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image(image: NetworkImage(model.images![0]), fit: BoxFit.cover, width: double.infinity,
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                      return const Center(child: Padding(
                        padding: EdgeInsets.all(25),
                        child: Text('Error Loading Image', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                      ));},)),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 13 ,horizontal: 13),
              child: Text(model.title.toString(),
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Theme.of(context).colorScheme.secondary, height: 1.1),
                textAlign: TextAlign.start, overflow: TextOverflow.ellipsis, maxLines: 2,),
            ),
          ),
          Expanded(
              flex: 2,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:0, horizontal: 5),
                  child: Container(

                    decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(15), boxShadow:[BoxShadow(
                          color: Colors.black.withOpacity(0.7),
                          spreadRadius: 0,
                          blurRadius: 1,
                          blurStyle: BlurStyle.outer,
                          offset: const Offset(0, 0), // changes position of shadow
                        ),]),
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 5),
                    child: Row(
                      children:
                      [
                        Expanded(
                          flex:2,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text("${model.price.toString()} \$",
                              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,
                                color: Theme.of(context).colorScheme.primary,),),
                          ),
                        ),
                        Expanded(
                          child: CircleAvatar(backgroundColor:Theme.of(context).colorScheme.primary,
                            child: IconButton(onPressed: ()
                            {
                              ShopCubit.of(context).toggleFavorite(model.id);
                            },
                              icon: ShopCubit.of(context).favorites![model.id] == 0 ?
                              FaIcon(FontAwesomeIcons.heart, color: Theme.of(context).colorScheme.secondary,
                                  size: 15) :
                              FaIcon(FontAwesomeIcons.solidHeart, color: Theme.of(context).colorScheme.secondary,
                                  size: 15)),),
                        ),
                        const SizedBox(width: 5,),
                        Expanded(
                          child: CircleAvatar(backgroundColor: Theme.of(context).colorScheme.primary,
                            child: IconButton(onPressed: ()
                            {
                              ShopCubit.of(context).addProductToCart(model.id);
                            },
                              icon: FaIcon(IconBroken.Buy, color: Theme.of(context).colorScheme.secondary,
                                  size: 17)),),
                        ),
                        const SizedBox(width: 10,),


                      ],),
                  ),
                ),
              )
          ),
          const SizedBox(height: 5,)
        ],),
    ),
  )
);

// cart item Widget:
Widget cartItemBuilder(ProductsModel model, BuildContext context, int index) => Dismissible(
  key: Key(model.id.toString()),
  onDismissed: (i)
  {
    ShopCubit.of(context).cart?.removeAt(index);
    ShopCubit.of(context).decreaseOnDiscard(index);

  },
  child:   GestureDetector(
    onTap: ()
    {
      navigate(context, ProductInfo(receivedProduct: model, index: index,));
    },
    child: Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(15)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(image: NetworkImage(model.images![0]),
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                        return const Center(child: Padding(
                          padding: EdgeInsets.all(25),
                          child: Text('Error Loading Image', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ));}, fit: BoxFit.fitWidth,)),
                ),
              ),
            ),
            Expanded(
              flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children:
                  [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 25, 0, 5),
                      child: Text(model.title.toString(), style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Theme.of(context).colorScheme.secondary), overflow: TextOverflow.ellipsis, maxLines: 1,),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      child: Text("${model.price.toString()} \$", style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary),),
                    ),

                  ],)),
            const SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 30, 0),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                  decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children:
                  [
                    CircleAvatar(backgroundColor:Theme.of(context).colorScheme.secondary,
                      child: IconButton(onPressed: ()
                      {
                        ShopCubit.of(context).increaseProductQuan(index);
                      },
                          icon: FaIcon(FontAwesomeIcons.plus, color: Theme.of(context).colorScheme.primary,
                              size: 10)),),
                    Text(ShopCubit.of(context).productCounts[index].toString(),
                      style: TextStyle(fontWeight: FontWeight.bold, color:Theme.of(context).colorScheme.secondary),),
                    CircleAvatar(backgroundColor:Theme.of(context).colorScheme.secondary,
                      child: IconButton(onPressed: ()
                      {
                        ShopCubit.of(context).decreaseProductQuan(index);
                      },
                          icon: FaIcon(FontAwesomeIcons.minus, color: Theme.of(context).colorScheme.primary,
                              size: 10)),),

                  ],),
                ),
              ),
            )

          ],),
      ),
    ),
  ),
);

// category item Widget:
Widget categoryItemBuilder(CategoryModel model, BuildContext context) => GestureDetector(
  onTap: (){
    navigate(context, SelectedCategory(receivedCategory: model.id, name: model.name,));
  },
  child:   Padding(
    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
    child:   Container(
      padding: const EdgeInsets.all(5),

      decoration: BoxDecoration(
            boxShadow:[BoxShadow(
              color: Colors.black.withOpacity(0.9),
              spreadRadius: 0,
              blurRadius: 1,
              blurStyle: BlurStyle.outer,
              offset: const Offset(0, 0), // changes position of shadow
            ),]
            ,color: Theme.of(context).colorScheme.primary, borderRadius: BorderRadius.circular(15)),
      child: Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [Colors.black, Colors.transparent.withOpacity(0.1)],
                    ).createShader(Rect.fromLTRB(0, 0, rect.width, 250));
                  },
                  blendMode: BlendMode.darken,
                  child: ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Theme.of(context).colorScheme.secondary, Colors.transparent.withOpacity(1)],
                      ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                    },
                    blendMode: BlendMode.color,
                    child: Image.network(model.image.toString(),
                      fit: BoxFit.cover, width: double.infinity, height: 200,
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                          return const Center(child: Padding(
                            padding: EdgeInsets.all(25),
                            child: Text('Error Loading Image', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                          ));},),
                  ),
                )
            ),
            Positioned(
              top: 145,
              left: 10,
              child: Text("${model.name.toString()}\n${ShopCubit.of(context).getCategoryCount(model.id)} Products",
                style: TextStyle(fontSize: 20,
                    color: Theme.of(context).colorScheme.secondaryContainer, fontWeight: FontWeight.bold, height: 1.1),),
            ),

          ]),
    ),
  ),
);

// favorite item Widget:
Widget favItemBuilder(ProductsModel model, BuildContext context, int index) => Dismissible(
  key: Key(model.id.toString()),
  onDismissed: (i)
  {
    ShopCubit.of(context).dismissFavorite(model.id);

  },
  child:   GestureDetector(
    onTap: ()
    {
      navigate(context, ProductInfo(receivedProduct: model, index: index,));
    },
    child: Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background, borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(15)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(image: NetworkImage(model.images![0]),
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                          return const Center(child: Padding(
                            padding: EdgeInsets.all(25),
                            child: Text('Error Loading Image', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                          ));}, fit: BoxFit.fitWidth,)),
                ),
              ),
            ),
            Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children:
                  [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 25, 0, 5),
                      child: Text(model.title.toString(), style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Theme.of(context).colorScheme.secondary), overflow: TextOverflow.ellipsis, maxLines: 1,),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      child: Text("${model.price.toString()} \$", style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary),),
                    ),

                  ],)),
            const SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 30, 0),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 3),
                  decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary, borderRadius: BorderRadius.circular(25)),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children:
                    [
                      CircleAvatar(backgroundColor:Theme.of(context).colorScheme.primary,
                        child: IconButton(onPressed: ()
                        {
                          ShopCubit.of(context).addProductToCart(model.id);
                        },
                            icon: FaIcon(FontAwesomeIcons.cartShopping, color: Theme.of(context).colorScheme.secondary,
                                size: 12)),),

                    ],),
                ),
              ),
            )

          ],),
      ),
    ),
  ),
);




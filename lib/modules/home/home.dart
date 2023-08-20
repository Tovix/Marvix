import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:marvix/modules/cubit/shopCubit.dart';
import 'package:marvix/modules/cubit/shopCubitStates.dart';
import 'package:marvix/modules/home/homeSearch.dart';
import 'package:marvix/shared/Components/components.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../login/login.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    ScrollController scrollController = ScrollController();
    List<Widget> gifs = [
      Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(boxShadow:[BoxShadow(
          color: Colors.black.withOpacity(0.7),
          spreadRadius: 0,
          blurRadius: 1,
          blurStyle: BlurStyle.outer,
          offset: const Offset(0, 0), // changes position of shadow
        ),],
            borderRadius: BorderRadius.circular(15), color: Theme.of(context).colorScheme.primary),
        child: Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Theme.of(context).colorScheme.primary, Colors.transparent.withOpacity(1)],
                      ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                    },
                    blendMode: BlendMode.color,
                    child: Image.asset("assets/fashion.gif",
                      fit: BoxFit.cover, width: double.infinity, height: 200,
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                        return const Center(child: Padding(
                          padding: EdgeInsets.all(25),
                          child: Text('Error Loading Image',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                        ));},),
                  )
              ),
              Positioned(
                top: 145,
                left: 10,
                child: Text("Browse the most trendy clothes!",
                  style: TextStyle(fontSize: 19,
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold, shadows: [Shadow(offset: const Offset(0, 2), color: Theme.of(context).colorScheme.primary)]),),
              ),

            ]),
      ),

    ),
      Container(padding:
      const EdgeInsets.symmetric(horizontal: 15, vertical: 5), child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(boxShadow:[BoxShadow(
          color: Colors.black.withOpacity(0.7),
          spreadRadius: 0,
          blurRadius: 1,
          blurStyle: BlurStyle.outer,
          offset: const Offset(0, 0), // changes position of shadow
        ),],
            borderRadius: BorderRadius.circular(15), color: Theme.of(context).colorScheme.primary),
        child: Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Theme.of(context).colorScheme.primary, Colors.transparent.withOpacity(1)],
                      ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                    },
                    blendMode: BlendMode.color,
                    child: Image.asset("assets/hair.gif",
                      fit: BoxFit.cover, width: double.infinity, height: 200,
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                        return const Center(child: Padding(
                          padding: EdgeInsets.all(25),
                          child: Text('Error Loading Image', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                        ));},),
                  )
              ),
              Positioned(
                top: 145,
                left: 10,
                child: Text("Explore +1000 Products of various categories",
                  style: TextStyle(fontSize: 17,
                      color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold, shadows: [Shadow(offset: const Offset(0, 2), color: Theme.of(context).colorScheme.primary)]),),
              ),

            ]),
      ),),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(boxShadow:[BoxShadow(
            color: Colors.black.withOpacity(0.7),
            spreadRadius: 0,
            blurRadius: 1,
            blurStyle: BlurStyle.outer,
            offset: const Offset(0, 0), // changes position of shadow
          ),],
              borderRadius: BorderRadius.circular(15), color: Theme.of(context).colorScheme.primary),
          child: Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: ShaderMask(
                      shaderCallback: (rect) {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Theme.of(context).colorScheme.secondary, Colors.transparent.withOpacity(1)],
                        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                      },
                      blendMode: BlendMode.color,
                      child: Image.asset("assets/bot.gif",
                        fit: BoxFit.cover, width: double.infinity, height: 200,
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                          return const Center(child: Padding(
                            padding: EdgeInsets.all(25),
                            child: Text('Error Loading Image', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                          ));},),
                    )
                ),
                Positioned(
                  top: 145,
                  left: 10,
                  child: Text("Delivering Orders globally!",
                    style: TextStyle(fontSize: 18,
                        color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold,
                        shadows: [Shadow(offset: const Offset(0, 3), color: Theme.of(context).colorScheme.primary)]),),
                ),
              ]),
        ),

      ),];

    return BlocConsumer<ShopCubit, ShopCubitStates>
      (builder: (context, state)
    {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ConditionalBuilder(condition: ShopCubit.of(context).products!.isNotEmpty,
          builder: (BuildContext context) {

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
          [
            Expanded(
              flex:0,
              child: GestureDetector(
                onTap: ()
                {
                  ShopCubit.of(context).searchResult!.clear();
                  navigate(context, const HomeSearch());
                },
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Container(
                      decoration: BoxDecoration(boxShadow:[BoxShadow(
                        color: Colors.black.withOpacity(0.7),
                        spreadRadius: 0,
                        blurRadius: 1,
                        blurStyle: BlurStyle.outer,
                        offset: const Offset(0, 0), // changes position of shadow
                      ),], borderRadius: BorderRadius.circular(25)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                        child: TextFormField(
                          enabled: false,

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
                                    Icon(IconBroken.Bag, size: 19, color: Theme.of(context).colorScheme.secondary,),
                                    const SizedBox(width: 5,),
                                    Text('Search for products', style:
                                  TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Theme.of(context).colorScheme.secondary,),),],),),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                                child: Icon(IconBroken.Search, color: Theme.of(context).colorScheme.secondary,),
                              ),
                              suffixIconColor: Colors.black,
                              errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
                                      color: Colors.black,
                                      width: 3)),
                              errorStyle: const TextStyle(color: Color(0xFF2A2D34),
                                  fontWeight: FontWeight.w700), focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 3))),
                          controller: searchController, keyboardType: TextInputType.text, validator: (text){return text;},),
                      ),
                    ),
                  ),
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 2),
                  child: Container(
                    decoration: BoxDecoration(boxShadow:[BoxShadow(
                      color: Colors.black.withOpacity(0.7),
                      spreadRadius: 0,
                      blurRadius: 1,
                      blurStyle: BlurStyle.outer,
                      offset: const Offset(0, 0), // changes position of shadow
                    ),], borderRadius: BorderRadius.circular(25)),
                    child: ToggleSwitch(
                      minWidth:190,
                      initialLabelIndex: 0,
                      totalSwitches: 2,
                      labels: const ['New', 'Trending'],
                      onToggle: (index) {},
                      inactiveBgColor: Theme.of(context).colorScheme.secondary,
                      inactiveFgColor: Theme.of(context).colorScheme.primary,
                      cornerRadius: 25,
                      animate: true,
                      activeBgColor: [Theme.of(context).colorScheme.primary],
                      fontSize: 17,
                      activeFgColor: Theme.of(context).colorScheme.secondary,
                      borderWidth: 2,
                      borderColor: [Theme.of(context).colorScheme.secondary],
                      customTextStyles: const [TextStyle(fontWeight: FontWeight.bold)],
                      icons: const [IconBroken.Arrow___Up_2, IconBroken.Arrow___Up_Square],
                      curve: Curves.linear,

                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex:11,
              child: SingleChildScrollView(
                child: Container(
                  color: Theme.of(context).colorScheme.background,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children:
                    [
                      Flexible(
                          fit: FlexFit.loose,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: CarouselSlider(items: gifs, options: CarouselOptions(
                                height: 190,
                                initialPage: 0,
                                viewportFraction: 1,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: const Duration(seconds: 5),
                                autoPlayAnimationDuration: const Duration(seconds: 1),
                                autoPlayCurve: Curves.fastLinearToSlowEaseIn,
                                scrollDirection: Axis.horizontal
                            )),
                          ),),
                      Flexible(
                        fit: FlexFit.loose,
                        child: GridView.count(physics: const NeverScrollableScrollPhysics(),
                          controller: scrollController,
                          cacheExtent: 1000,
                          crossAxisCount: 2, shrinkWrap: true,
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 0.0,
                          childAspectRatio: 1 / 2,
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                          children: List.generate(ShopCubit.of(context).products!.length, (index) =>
                              productItemBuilder(ShopCubit.of(context).products![index], context, index)),
                        ),
                      ),
                    ],),
                ),),
            )
          ],);},
          fallback: (BuildContext context) {return const Center(child: CircularProgressIndicator());},),
      );
    }, listener: (context, state) {

        if(state is ShopGetUserDataFailState)
        {
          navigateEnd(context, const Login());
        }

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

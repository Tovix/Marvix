import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:marvix/modules/cubit/shopCubit.dart';
import 'package:marvix/modules/cubit/shopCubitStates.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../shared/Components/components.dart';
class Layout extends StatelessWidget {
  const Layout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopCubitStates>(builder: (context, state)
    {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: AppBar(backgroundColor: Theme.of(context).colorScheme.background,
            leading: Padding(
              padding: const EdgeInsets.fromLTRB(25, 20, 0, 10),
              child: Row(children:
              [
                Stack(
                  children: <Widget>[
                    // Stroked text as border.
                    Text(
                      'M a r v i x',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 7
                          ..color = Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    // Solid text as fill.
                    Text(
                      'M a r v i x',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
                ShopCubit.of(context).theme == ThemeMode.light ? Padding(
                  padding: const EdgeInsets.fromLTRB(7, 5, 0, 0),
                  child: Stack(
                    children: <Widget>[
                      Text(
                        'L i g h t',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 3
                            ..color = Colors.black,
                        ),
                      ),
                      const Text(
                        'L i g h t',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: Color(0xFFEEE5E9),
                        ),
                      ),
                    ],
                  ),
                ) :
                Padding(padding:
                const EdgeInsets.fromLTRB(7, 5, 0, 0),
                  child: Stack(
                    children: <Widget>[
                      Text(
                        'D a r k',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 3
                            ..color = Colors.black,
                        ),
                      ),
                      const Text(
                        'D a r k',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                          color: Color(0xFFEEE5E9),
                        ),
                      ),
                    ],
                  ),
                )

              ],),
            ),
            leadingWidth: 250,
            actions: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 17, 0, 5),
                child: Container(
                  decoration: BoxDecoration(boxShadow:[BoxShadow(
                    color: Colors.black.withOpacity(0.7),
                    spreadRadius: 0,
                    blurRadius: 1,
                    blurStyle: BlurStyle.outer,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),], borderRadius: BorderRadius.circular(25)),
                  child: ToggleSwitch(
                    minWidth:35,
                    initialLabelIndex: 0,
                    totalSwitches: 2,
                    onToggle: (index)
                    {
                        ShopCubit.of(context).changeTheme(index!, context);
                    },
                    inactiveBgColor: Theme.of(context).colorScheme.secondary,
                    inactiveFgColor: Theme.of(context).colorScheme.primary,
                    cornerRadius: 25,
                    animate: true,
                    activeBgColor: [Theme.of(context).colorScheme.primary],
                    fontSize: 17,
                    activeFgColor: Theme.of(context).colorScheme.secondary,
                    borderWidth: 3,
                    borderColor: [Theme.of(context).colorScheme.secondary],
                    customTextStyles: const [TextStyle(fontWeight: FontWeight.bold)],
                    icons: const [FontAwesomeIcons.sun, FontAwesomeIcons.moon],
                    curve: Curves.linear,


                  ),
                ),
              ),
              Padding(
              padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
              child: Container(
                decoration: BoxDecoration(boxShadow:[BoxShadow(
                  color: Colors.black.withOpacity(0.7),
                  spreadRadius: 0,
                  blurRadius: 1,
                  blurStyle: BlurStyle.outer,
                  offset: const Offset(0, 0), // changes position of shadow
                ),], borderRadius: BorderRadius.circular(400)),
                child: CircleAvatar(backgroundColor: Theme.of(context).colorScheme.secondary, radius: 18,
                  child: IconButton(onPressed: ()
                {
                  ShopCubit.of(context).viewFavList();
                  showModalBottomSheet<void>(context: context, builder: (BuildContext context) {
                    return SizedBox(
                      height:  double.infinity,
                      child: ConditionalBuilder(condition: ShopCubit.of(context).favoritesItems!.isNotEmpty,
                        builder: (BuildContext context)
                        {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                flex:0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                                  child: Text("Your Wishlist", style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Theme.of(context).colorScheme.secondary),),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: SingleChildScrollView(
                                  child: Container(
                                    color: Theme.of(context).colorScheme.background,
                                    child: Column(
                                      children:
                                      [
                                        ListView.builder(itemBuilder: (context, index)
                                        {
                                          return favItemBuilder(ShopCubit.of(context).favoritesItems![index], context, index);
                                        }, shrinkWrap: true,
                                          itemCount: ShopCubit.of(context).favoritesItems!.length,
                                          physics: const NeverScrollableScrollPhysics(),
                                        )
                                      ],),
                                  ),),
                              ),
                            ],
                          );
                        },
                        fallback: (BuildContext context)
                        {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex:0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                                  child: Text("Your Wishlist", style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 22,
                                      color: Theme.of(context).colorScheme.secondary),),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Center(child: Text("You Have No Items in Your Wishlist",
                                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary),)),
                              ),
                            ],
                          );
                        },)
                    );
                  },
                      backgroundColor: Theme.of(context).colorScheme.background);
                },
                    icon: FaIcon(FontAwesomeIcons.heartCirclePlus, color: Theme.of(context).colorScheme.primary,
                      size: 16,)),),
              ),
            ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 20, 5),
                child: Container(
                  decoration: BoxDecoration(boxShadow:[BoxShadow(
                    color: Colors.black.withOpacity(0.7),
                    spreadRadius: 0,
                    blurRadius: 1,
                    blurStyle: BlurStyle.outer,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),], borderRadius: BorderRadius.circular(400)),
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    radius: 18,
                    child: CircleAvatar(backgroundImage: NetworkImage(ShopCubit.of(context).avatarCon.text),
                      radius: 16, onBackgroundImageError: (object, traceBack)
                      {
                        const Center(child: Text('error loading image'),);
                      },),
                  ),
                ),
              )
            ], surfaceTintColor: Colors.transparent, systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Theme.of(context).colorScheme.primary,
                  statusBarIconBrightness: ShopCubit.of(context).theme == ThemeMode.light ? Brightness.dark : Brightness.light)),
        ),
        extendBody: true,
        backgroundColor: const Color(0xFFF5FBEF),
        body: ShopCubit.of(context).screens[ShopCubit.of(context).screenIndex],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
             decoration: BoxDecoration(
                  boxShadow:[BoxShadow(
                    color: Colors.black.withOpacity(0.9),
                    spreadRadius: 0,
                    blurRadius: 1,
                    blurStyle: BlurStyle.outer,
                    offset: const Offset(0, 0), // changes position of shadow
                  ),]
                  ,color: Colors.black, borderRadius: BorderRadius.circular(30)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: SalomonBottomBar(items:
              [
                SalomonBottomBarItem(icon: iconConditional(context, 0,
                    IconBroken.Home, FontAwesomeIcons.circleDot), title: const Text("Home")),
                SalomonBottomBarItem(icon: iconConditional(context, 1,
                    IconBroken.Chart, FontAwesomeIcons.circleDot) , title: const Text("Explore")),
                SalomonBottomBarItem(icon: iconConditional(context, 2,
                    IconBroken.Bag_2, FontAwesomeIcons.circleDot) , title: const Text("Cart")),
                SalomonBottomBarItem(icon: iconConditional(context, 3,
                    IconBroken.Profile, FontAwesomeIcons.circleDot) , title: const Text("Profile"))

              ], onTap: (int index)
              {
                ShopCubit.of(context).changeScreen(index);
              }, currentIndex: ShopCubit.of(context).screenIndex,
                backgroundColor: Theme.of(context).colorScheme.primary, selectedItemColor: Theme.of(context).colorScheme.secondary,
                unselectedItemColor: Theme.of(context).colorScheme.secondary,
                itemPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15), selectedColorOpacity: 0.3,),
            ),),
        ),
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

ConditionalBuilder iconConditional(BuildContext context, int index,
    IconData originalIcon, IconData replacementIcon) => ConditionalBuilder(
  condition: ShopCubit.of(context).screenIndex == index, builder: (BuildContext context)
{return FaIcon(replacementIcon);}, fallback: (BuildContext context){return FaIcon(originalIcon);},);
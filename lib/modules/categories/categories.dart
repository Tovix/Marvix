import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marvix/modules/cubit/shopCubit.dart';
import 'package:marvix/modules/cubit/shopCubitStates.dart';
import 'package:marvix/shared/Components/components.dart';
class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return BlocConsumer<ShopCubit, ShopCubitStates>(builder: (context, state){
      return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ConditionalBuilder(condition: ShopCubit.of(context).categories!.isNotEmpty,
        builder: (BuildContext context) {

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
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
                  child: TextFormField(
                    cursorColor: Theme.of(context).colorScheme.secondary,
                    style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                    decoration: InputDecoration(
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
                            children: [const SizedBox(width: 5,), Text('Search for Categories', style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Theme.of(context).colorScheme.secondary,),),],),),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                          child: Icon(FontAwesomeIcons.magnifyingGlass, color: Theme.of(context).colorScheme.secondary,),
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
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    color: Theme.of(context).colorScheme.background,
                    child: Column(
                      children:
                      [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          child: Container(
                            padding: const EdgeInsets.all(5),
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
                                            begin: Alignment.bottomCenter,
                                            end: Alignment.center,
                                            colors: [Colors.black, Colors.transparent.withOpacity(0.2)],
                                          ).createShader(Rect.fromLTRB(0, 0, rect.width, 215));
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
                                          child: Image.asset("assets/browse.gif",
                                            fit: BoxFit.fill, width: double.infinity, height: 160,
                                            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                                              return const Center(child: Padding(
                                                padding: EdgeInsets.all(25),
                                                child: Text('Error Loading Image',
                                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                                              ));},),
                                        ),
                                      )
                                  ),
                                  Positioned(
                                    top: 130,
                                    left: 10,
                                    child: Text("Browse various categories of clothes!",
                                      style: TextStyle(fontSize: 18,
                                          color: Theme.of(context).colorScheme.secondaryContainer,
                                          fontWeight: FontWeight.bold),),
                                  ),

                                ]),
                          ),

                        ),
                        ListView.builder(itemBuilder: (context, index)
                        {
                          return categoryItemBuilder(ShopCubit.of(context).categories![index], context);
                        }, shrinkWrap: true,
                          itemCount: 4,
                          physics: const NeverScrollableScrollPhysics(),
                        )
                      ],),
                  ),),
              ),
            ],);},
        fallback: (BuildContext context) {return const Center(child: CircularProgressIndicator());},));
      },
        listener: (context, state){});
  }
}

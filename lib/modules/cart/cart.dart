import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvix/modules/cubit/shopCubit.dart';
import 'package:marvix/modules/cubit/shopCubitStates.dart';
import 'package:marvix/shared/Components/components.dart';
class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopCubitStates>(builder: (context, state)
    {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ConditionalBuilder(condition: ShopCubit.of(context).cart!.isNotEmpty,
          builder: (BuildContext context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Text("Your Cart", style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Theme.of(context).colorScheme.secondary),)),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      color: Theme.of(context).colorScheme.background,
                      child: Column(
                        children:
                        [
                          ListView.builder(itemBuilder: (context, index)
                          {
                            return cartItemBuilder(ShopCubit.of(context).cart![index], context, index);
                          }, shrinkWrap: true,
                            itemCount: ShopCubit.of(context).cart!.length,
                            physics: const NeverScrollableScrollPhysics(),
                          )
                        ],),
                    ),),
                ),
                Container(
                    decoration: BoxDecoration(boxShadow:[BoxShadow(
                      color: Colors.black.withOpacity(0.10),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),], color: Theme.of(context).colorScheme.primary),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 20, 0, 5),
                              child: Text("Subtotal Items ${ShopCubit.of(context).productsDisplayCounter.toString()}:",
                                style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold, color:
                                Theme.of(context).colorScheme.secondary),),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 30, 5),
                              child: Text("${(ShopCubit.of(context).total - 5).toString()} \$",
                                style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold,
                                    color: Theme.of(context).colorScheme.secondary),),
                            ),

                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 5, 0, 5),
                              child: Text("Delivery Fee:",
                                style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary),),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 30, 5),
                              child: Text("5 \$",
                                style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary),),
                            ),

                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(color: Theme.of(context).colorScheme.secondary, thickness: 2,),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(25, 5, 0, 5),
                              child: Text("Total Amount Required:",
                                style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary),),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 5, 30, 5),
                              child: Text("${ShopCubit.of(context).total.toString()} \$",
                                style: TextStyle( fontSize: 15, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary),),
                            ),

                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 15),
                          child: defButton(text: "Go to Payment",
                              onPressed: (){}, color: Theme.of(context).colorScheme.secondary,
                              textColor: Theme.of(context).colorScheme.primary),
                        ),
                        const SizedBox(height: 80,),
                      ],
                    )
                )
              ],);},
          fallback: (BuildContext context) {return Center(child: Text("You Have No Items in Your Cart",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Theme.of(context).colorScheme.secondary),));},),
      );
    }, listener: (context, state){});
  }
}

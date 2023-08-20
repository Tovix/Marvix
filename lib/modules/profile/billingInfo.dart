import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../layout/layout.dart';
import '../../shared/Components/components.dart';
import '../cubit/shopCubit.dart';
import '../cubit/shopCubitStates.dart';
class BillingInfo extends StatelessWidget {
  const BillingInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController creditCard = TextEditingController();

    return BlocConsumer<ShopCubit, ShopCubitStates>(
      builder: (context, state) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          leading: SizedBox(
              child: IconButton(icon: Icon(Icons.highlight_off_outlined, color: Theme.of(context).colorScheme.secondary, size: 24,),
                onPressed: () { navigateEnd(context, const Layout()); },)
          ), elevation: 0, leadingWidth: 50, actions: [IconButton(onPressed: (){}, icon: Icon(Icons.help_outline,
          color: Theme.of(context).colorScheme.secondary, size: 24, ))],),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 20, 10, 10),
              child: Text("Billing Information", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 35,
                  color: Theme.of(context).colorScheme.secondary),),
            ),
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
                              child: Image.asset("assets/card.gif",
                                fit: BoxFit.cover, width: double.infinity, height: 200,
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
                        top: 165,
                        left: 10,
                        child: Text("Add your credit card for online payments",
                          style: TextStyle(fontSize: 18,
                              color: Theme.of(context).colorScheme.secondaryContainer,
                              fontWeight: FontWeight.bold),),
                      ),

                    ]),
              ),

            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
              child: defTextField(teController: creditCard, leadingText: "Credit Card Number", prefixIcon: FontAwesomeIcons.creditCard,
                  type: TextInputType.text, isDisabled: true, context: context),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: defTextField(teController: creditCard, leadingText: "Expiry Date", prefixIcon: FontAwesomeIcons.creditCard,
                  type: TextInputType.text, isDisabled: true, context: context),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: defTextField(teController: creditCard, leadingText: "CVV", prefixIcon: FontAwesomeIcons.creditCard,
                  type: TextInputType.text, isDisabled: true, context: context),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: defButton(text: "Add", onPressed: ()
              {

              }, color: Theme.of(context).colorScheme.secondary,
                  textColor: Theme.of(context).colorScheme.primary),
            ),
            Expanded(
              flex: 3,
              child: Padding(padding: const EdgeInsets.fromLTRB(30, 5, 30, 0),
                child: RichText(text: TextSpan(style: const TextStyle(fontSize: 15, color: Colors.black,
                    fontWeight: FontWeight.w400), children: <TextSpan>
                [
                  TextSpan(text: "By using our app, You agree to our ",
                      style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
                  TextSpan(text: "Terms of Use ", style: TextStyle(fontWeight: FontWeight.w900,
                      color: Theme.of(context).colorScheme.secondary)),
                  TextSpan(text: "and ", style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
                  TextSpan(text: "Privacy Policy.", style: TextStyle(fontWeight: FontWeight.w900,
                      color: Theme.of(context).colorScheme.secondary))
                ]),textAlign: TextAlign.center,),),
            ),



          ],),),
      listener: (context, state)
      {
        if(state is ShopEditUserDataSuccessState)
        {
          final snackBar = defSnackBar("Your data has been updated successfully.",
              Theme.of(context).colorScheme.secondary, context);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

        if(state is ShopEditUserDataFailState)
        {
          final snackBar = defSnackBar("Unknown error has occurred, please try again later.",
              Theme.of(context).colorScheme.secondary, context);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
    );
  }
}


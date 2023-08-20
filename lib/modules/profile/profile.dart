import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marvix/modules/cubit/shopCubitStates.dart';
import 'package:marvix/modules/profile/accountInfo.dart';
import 'package:marvix/modules/profile/billingInfo.dart';
import 'package:marvix/modules/profile/personalInfo.dart';
import 'package:marvix/shared/Components/components.dart';
import 'package:marvix/shared/network/local/cacheHelper.dart';
import '../cubit/shopCubit.dart';
import '../login/login.dart';
class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ShopCubit, ShopCubitStates>(
      builder: (context, state) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Expanded(
                flex: 4,
                child:
                Padding(
                    padding: const EdgeInsets.all(0),
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
                        child: Image.network(ShopCubit.of(context).avatarCon.text,
                            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                              return const Center(child: Padding(
                                padding: EdgeInsets.all(25),
                                child: Text('Error Loading Image', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                              ));},
                            width: double.infinity, height: 325, fit: BoxFit.contain)
                      ),
                    )
                ),

              ),
              Expanded(
                flex: 0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 20, 8, 15),
                  child: Text(ShopCubit.of(context).displayName ?? "",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30, color: Theme.of(context).colorScheme.secondary),),
                ),
              ),
              Expanded(
                flex:0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  child: Text("A loyal and passionate customer of Marvix",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18, color: Theme.of(context).colorScheme.secondary),),
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                        Expanded(
                          child: Text("Purchases \n 0",
                            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15, color: Theme.of(context).colorScheme.secondary), textAlign: TextAlign.center,),
                        ),
                        VerticalDivider(color: Colors.black.withOpacity(0.5), thickness: 3, indent: 0, endIndent: 0, width: 20,),
                        Expanded(
                          child: Text("loyalty Points \n 0",
                            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15, color: Theme.of(context).colorScheme.secondary), textAlign: TextAlign.center,),
                        ),
                        VerticalDivider(color: Colors.black.withOpacity(0.5), thickness: 3, indent: 0, endIndent: 0, width: 20,),
                        Expanded(
                          child: Text("Redeem Cash \n 0",
                            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 15, color: Theme.of(context).colorScheme.secondary), textAlign: TextAlign.center,),
                        ),
                      ],),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                    child: defLabelIconButton("Personal Information", FontAwesomeIcons.user, ()
                    {
                      navigate(context, const PersonalInfo());
                    }, Theme.of(context).colorScheme.secondary)
                ),
              ),
              Expanded(
                flex:1,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                    child: defLabelIconButton("Billing Information", FontAwesomeIcons.creditCard, ()
                    {
                      navigate(context, const BillingInfo());
                    }, Theme.of(context).colorScheme.secondary)
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                    child: defLabelIconButton("Account Information", FontAwesomeIcons.lock, ()
                    {
                      navigate(context, const AccountInfo());
                    },Theme.of(context).colorScheme.secondary)
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: defButton(text: "Sign Out", onPressed: ()
                  {
                    navigateEnd(context, const Login());
                    CacheHelper.removeData("token");
                  }, color: Theme.of(context).colorScheme.secondary,
                      textColor: Theme.of(context).colorScheme.primary),
                ),
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
            ],),
        ),),
      listener: (context, state) {},
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:marvix/layout/layout.dart';
import 'package:marvix/modules/login/loginCubit/loginCubit.dart';
import 'package:marvix/modules/login/loginCubit/loginCubitStates.dart';
import 'package:marvix/modules/onBoardingScreen/onboardingscreen.dart';
import 'package:marvix/modules/register/register.dart';
import 'package:marvix/shared/network/local/cacheHelper.dart';
import '../../shared/Components/components.dart';
import '../../shared/Components/constants.dart';
class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocProvider(create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginCubitStates>(builder: (context, state)=> Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: SizedBox(
            child: IconButton(icon: Icon(IconBroken.Arrow___Down_Circle, color:
            Theme.of(context).textTheme.displayLarge?.color, size: 24,),
              onPressed: () { navigateEnd(context, const OnBoardingScreen()); },)
        ), elevation: 0, leadingWidth: 50, actions: [IconButton(onPressed: ()
      {
        showModalBottomSheet<void>(context: context, builder: (BuildContext context) {
          return SizedBox(
            height:  200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 25, 10, 10),
                    child: Text('- Help regarding logging in Marvix',
                      style: TextStyle(color: Theme.of(context).textTheme.displayLarge!.color!, fontSize: 20,
                          fontWeight: FontWeight.bold),),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    child: Text('In order to login in Marvix you will need to have an account '
                        'registered in our system. For creating an account press the Sign Up Now located at the bottom of '
                        'the screen and follow the steps. When you have created an account successfully '
                        'you can use your email and password to login.',
                      style: TextStyle(color: Theme.of(context).textTheme.displayLarge!.color!, fontSize: 15,),),
                  ),
                ),

              ],
            ),
          );
        },
            backgroundColor: Theme.of(context).colorScheme.background);
      }, icon: Icon(IconBroken.Info_Circle,
        color: Theme.of(context).textTheme.displayLarge?.color, size: 24,))],),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [Expanded(
                flex: 6,
                  child: Image.asset("assets/log3.png", width: double.infinity, fit: BoxFit.contain,height: 325,)
              ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text("Welcome Back !", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35,
                        color: Theme.of(context).textTheme.displayLarge?.color, height: 2),),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 15),
                    child: Text("Sign Into your Account", style: TextStyle(fontSize: 20,
                        color: Theme.of(context).textTheme.displayLarge?.color, height: 0.8),),
                  ),
                ),
                Expanded(
                  child: defTextField(teController: emailController, leadingText: "  Email",
                      prefixIcon: IconBroken.Message, type: TextInputType.emailAddress,
                      validFunction: (text)
                      {
                        if(text.isEmpty)
                        {
                          return "Please enter your email";
                        }
                      }, isDisabled: true, context: context),
                ),
                const Expanded(flex:0, child: SizedBox(height: 10,)),
                Expanded(
                  child: defTextField(teController: passwordController, leadingText: "  Password", prefixIcon: IconBroken.Password,
                      suffixIcon: !LoginCubit.of(context).isOn ? Icons.visibility : Icons.visibility_off,
                      type: TextInputType.visiblePassword, validFunction: (text)
                      {
                        if(text.isEmpty)
                        {
                          return "Please enter your password";
                        }
                      }, isDisabled: true, context: context, isObscure: !LoginCubit.of(context).isOn ? true : false, option: 2),
                ),
                Expanded(
                  flex: 0,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text("Forget Password ?",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12, color: Theme.of(context).textTheme.displayLarge?.color),
                        textAlign: TextAlign.left, ),),
                  ),
                ),
                Expanded(

                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                    child: defButton(text: "Login", onPressed: () {
                      if(formKey.currentState!.validate())
                      {
                        LoginCubit.of(context).login(emailController.text, passwordController.text, context);
                      }
                    },color: Theme.of(context).colorScheme.secondary,
                        textColor: Theme.of(context).colorScheme.primary),
                  ),
                ),
                Expanded(
                  child: Padding(padding: const EdgeInsets.all(10), child: Center(child: TextButton(onPressed: () {  navigateEnd(context, const Register());},
                    child: Padding(padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: RichText(text: TextSpan(style: TextStyle(fontSize: 15, color: Theme.of(context).textTheme.displayLarge?.color, fontWeight: FontWeight.w400), children: const <TextSpan>
                      [
                        TextSpan(text: "Don't Have an Account ? "),
                        TextSpan(text: "Sign Up Now", style: TextStyle(fontWeight: FontWeight.w900)),
                      ]),textAlign: TextAlign.center,),),),),),
                )
              ],),
          )
      )
    ),
        listener: (context, state) {
          if(state is LoginSuccessState)
          {
            CacheHelper.setData("token", token?['access_token']).then((value)
            {
              token?['access_token'] = CacheHelper.getData("token");
              final snackBar = defSnackBar("Logged in Successfully, Welcome Back",
                  Theme.of(context).colorScheme.secondary, context);
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              navigateEnd(context, const Layout());
            });
          }
          if(state is LoginErrorState)
          {
            final snackBar = defSnackBar("Invalid Login, Please check your email & password.",
                Theme.of(context).colorScheme.secondary, context);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },),);
  }
}

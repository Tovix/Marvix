import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:marvix/modules/login/login.dart';
import 'package:marvix/modules/register/registerCubit/registerCubit.dart';
import 'package:marvix/modules/register/registerCubit/registerCubitStates.dart';
import 'package:marvix/shared/Components/components.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    // TextEditingController avatarController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();



    return BlocProvider(create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterCubitStates>(builder: (context, state)=> Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          leading: SizedBox(
            child: TextButton.icon(onPressed: (){navigate(context, const Login());},
              icon: Icon(IconBroken.Arrow___Left_2, color: Theme.of(context).textTheme.displayLarge!.color!, size: 24,), label:
              Text("Back", style: TextStyle(color: Theme.of(context).textTheme.displayLarge!.color!, fontSize: 15,
                  fontWeight: FontWeight.bold),),),
          ), elevation: 0, leadingWidth: 100, actions: [IconButton(onPressed: ()
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
                      child: Text('- Help regarding registering in Marvix',
                        style: TextStyle(color: Theme.of(context).textTheme.displayLarge!.color!, fontSize: 20,
                            fontWeight: FontWeight.bold),),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                      child: Text('In order to register in Marvix you will need to fill up all the fields above in order to be '
                          'registered in our system. you can use your email and password to login in our app through the login screen '
                          'where you will redirected shortly after you complete your registration.',
                        style: TextStyle(color: Theme.of(context).textTheme.displayLarge!.color!, fontSize: 15, height: 1.2),),
                    ),
                  ),

                ],
              ),
            );
          },
              backgroundColor: Theme.of(context).colorScheme.background);
        }, icon: Icon(IconBroken.Info_Circle,
          color: Theme.of(context).textTheme.displayLarge!.color!, size: 24,))],),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Expanded(
                    flex: 4,
                      child: Image.asset("assets/log4.png", width: double.infinity, fit: BoxFit.contain,height: 175,)),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Text("Sign Up", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 29,
                          color: Theme.of(context).textTheme.displayLarge!.color!),),
                    ),
                  ),
                  Expanded(
                    child: Text("Create an account so you can order\nthe most top-tier high quality cloth",
                      style: TextStyle(fontSize: 20,
                        color: Theme.of(context).textTheme.displayLarge!.color!,height: 1.1),),
                  ),
                  Expanded(
                    child: defTextField(teController: usernameController, leadingText: "Name", prefixIcon: IconBroken.Paper,
                        type: TextInputType.text,
                        validFunction: (text)
                        {
                          if(text.isEmpty)
                          {
                            return "Please enter a valid name";
                          }
                        }, isDisabled: true, context: context),
                  ),
                  const Expanded(flex:0, child: SizedBox(height: 5,)),
                  Expanded(
                    child: defTextField(teController: emailController, leadingText: "Email", prefixIcon: IconBroken.Message,
                        type: TextInputType.emailAddress,
                        validFunction: (text)
                        {
                          if(text.isEmpty)
                          {
                            return "Please enter a valid email";
                          }
                        }, isDisabled: true, context: context),
                  ),
                  const Expanded(flex:0, child: SizedBox(height: 5,)),
                  Expanded(
                    child:
                    defTextField(teController: passwordController, leadingText: "Password", prefixIcon: IconBroken.Lock,
                        suffixIcon: !RegisterCubit.of(context).isOn ? Icons.visibility : Icons.visibility_off,
                        type: TextInputType.visiblePassword,
                        validFunction: (text)
                        {
                          if(text.isEmpty)
                          {
                            return "Please enter a valid password";
                          }
                        }, isDisabled: true, context: context, isObscure: !RegisterCubit.of(context).isOn ? true : false, option: 1)
                  ),
                  const Expanded(flex:0, child: SizedBox(height: 5,)),
                  Expanded(
                    flex: 0,
                    child: Padding(padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
                      child: RichText(text: TextSpan(style: TextStyle(fontSize: 15,
                          color: Theme.of(context).textTheme.displayLarge!.color!,
                          fontWeight: FontWeight.w400), children: const <TextSpan>
                      [
                        TextSpan(text: "By signing up, You agree to our "),
                        TextSpan(text: "Terms of Use ", style: TextStyle(fontWeight: FontWeight.w900)),
                        TextSpan(text: "and "),
                        TextSpan(text: "Privacy Policy.", style: TextStyle(fontWeight: FontWeight.w900))
                      ]),textAlign: TextAlign.center,),),
                  ),
                  Expanded(
                    flex: 0,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                      child: defButton(text: "Create An Account", onPressed: ()
                      {
                        if(formKey.currentState!.validate())
                        {
                          RegisterCubit.of(context).register(usernameController.text, emailController.text,
                              passwordController.text, "https://www.woolha.com/media/2020/03/flutter-circleavatar-minradius-maxradius.jpg");
                        }
                      }, color: Theme.of(context).colorScheme.secondary, textColor:
                      Theme.of(context).colorScheme.primary),
                    ),
                  ),
                  Expanded(
                    child: Padding(padding: const EdgeInsets.all(10), child: Center(child: TextButton(onPressed: () { navigate(context, const Login()); },
                      child: Padding(padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                        child: RichText(text: TextSpan(style: TextStyle(fontSize: 15, color: Theme.of(context).textTheme.displayLarge!.color!, fontWeight: FontWeight.w400),
                            children: <TextSpan>
                            [
                              const TextSpan(text: "Already Have an Account ? "),
                              TextSpan(text: "Login Now", style: TextStyle(fontWeight: FontWeight.w900,
                                  color: Theme.of(context).textTheme.displayLarge!.color!)),
                            ]),textAlign: TextAlign.center,),),),),),
                  )
                ],),
            )
        ),
      ),
        listener: (context, state)
        {
          if(state is RegisterSuccessState)
          {
            final snackBar = defSnackBar("Registered Successfully!",
                Theme.of(context).colorScheme.secondary, context);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            navigateEnd(context, const Login());
          }
          if(state is RegisterErrorState)
          {
            final snackBar = defSnackBar("Unknown Error has Occurred Try Again Later.",
                Theme.of(context).colorScheme.secondary, context);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }

        },),);
  }
}

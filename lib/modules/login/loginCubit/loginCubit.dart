import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvix/modules/login/loginCubit/loginCubitStates.dart';
import 'package:marvix/shared/network/remote/dioHelper.dart';
import '../../../shared/Components/constants.dart';
import '../../../shared/network/remote/endpoints.dart';

class LoginCubit extends Cubit<LoginCubitStates>
{
  LoginCubit() : super(LoginInitialState());
  static LoginCubit of(context) => BlocProvider.of(context);

  bool isOn = false;


  void login(String email, String password, BuildContext context)
  {
    emit(LoginLoadingState());
    Map<String, dynamic> query = {"email": email,
      "password": password};
    DioHelper.postData(url: LOGIN, query: query, data: {}).then((value)
    {
      token = value?.data;
      emit(LoginSuccessState());

    }).catchError((error)
    {
      emit(LoginErrorState());
    });
  }

  void toggleShowPassword()
  {
    if(isOn == false)
    {
      isOn = true;
    }
    else if (isOn == true)
    {
      isOn = false;
    }
    emit(TogglePassSuccessState());
  }


}
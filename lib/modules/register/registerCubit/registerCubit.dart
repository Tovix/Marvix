import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvix/modules/register/registerCubit/registerCubitStates.dart';
import 'package:marvix/shared/network/remote/dioHelper.dart';

import '../../../shared/network/remote/endpoints.dart';

class RegisterCubit extends Cubit<RegisterCubitStates>
{
  RegisterCubit(): super(RegisterInitialState());
  static RegisterCubit of(context) => BlocProvider.of(context);

  bool isOn = false;

  void register(String name, String email, String password, String avatar)
  {
    emit(RegisterLoadingState());
    DioHelper.postData(url: REGISTER, query: {}, data: {"name":name, "email":email,
      "password":password, "avatar":avatar}).then((value)
    {
      emit(RegisterSuccessState());
    }).catchError((error)
    {
      emit(RegisterErrorState());
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
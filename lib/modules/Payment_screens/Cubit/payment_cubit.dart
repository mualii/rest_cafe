import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rest_cafe/shared/Model/PaymentModel.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  static PaymentCubit getObject(context) => BlocProvider.of<PaymentCubit>(context);

  List<PaymentModel> listPaymentModel = [
    PaymentModel(
        title: "سداد",
        image: "assets/images/pay (1).png",
        id: "1111",
        isSelect: false),
    PaymentModel(
        title: "Paypal",
        image: "assets/images/pay (2).png",
        id: "2222",
        isSelect: false),
    PaymentModel(
        title: "فيزا 5689****",
        image: "assets/images/pay (1).png",
        id: "3333",
        isSelect: false)
  ];

  void changeSelect({required int index}){
    listPaymentModel[index].isSelect = !  listPaymentModel[index].isSelect;


    for(int i=0 ; i<listPaymentModel.length ; i++){
      if(i ==index){
      }
      else{
        listPaymentModel[i].isSelect = false;
      }

    }

    emit(PaymentChangeSelect());
  }


}

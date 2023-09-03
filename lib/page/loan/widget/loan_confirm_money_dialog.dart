import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rapicredito/utils/string_ext.dart';
import 'package:rapicredito/widget/custom_button.dart';
import 'package:rapicredito/widget/custom_click_view.dart';

class LoanConfirmMoneyDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoanConfirmMoneyDialogState();
  final Function clickConfirm;
  final String? amountInHand;
  final String? loanAmount;
  final String? repaymentDate;

  const LoanConfirmMoneyDialog(
      {Key? key,
      required this.clickConfirm,
      this.amountInHand,
      this.loanAmount,
      this.repaymentDate})
      : super(key: key);
}

class _LoanConfirmMoneyDialogState extends State<LoanConfirmMoneyDialog> {
  final TextEditingController ctr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: double.infinity,
        height: 330.0,
        margin: const EdgeInsets.only(top: 150.0, left: 10.0, right: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [Expanded(child: _buildDialog()), _buildCancelView()],
        ),
      ),
    );
  }

  Widget _buildDialog() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      height: 279.0,
      padding: const EdgeInsets.only(top: 20.0, left: 16.0, right: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Detalle',
            style: TextStyle(
                fontSize: 18.0,
                color: Color(0xff333333),
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: _buildItemView(
                'Cantidad a recibir', '${widget.amountInHand}\$'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child:
                _buildItemView('Monto de devolución', '${widget.loanAmount}\$'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: _buildItemView(
                'Fecha de pago de tu crédito', '${widget.repaymentDate}'),
          ),
          _buildSelectView(),
          _buildBottomButtonView(),
        ],
      ),
    );
  }

  Widget _buildItemView(String title, String content) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: const TextStyle(fontSize: 14.0, color: Color(0xff666666)),
          ),
        ),
        Text(
          content,
          textAlign: TextAlign.right,
          style: const TextStyle(fontSize: 14.0, color: Color(0xff666666)),
        )
      ],
    );
  }

  Widget _buildSelectView() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: 23.0,
          height: 23.0,
          margin: const EdgeInsets.only(top: 15.0, right: 5.0, bottom: 19.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              border: Border.all(color: const Color(0xff666666), width: 1.0)),
        ),
        Expanded(
            child: RichText(
                text: TextSpan(
                    text: Strings.autoLineString('He leído '),
                    style: const TextStyle(
                        fontSize: 14.0, color: Color(0xff666666)),
                    children: <TextSpan>[
              TextSpan(
                  text: Strings.autoLineString('Contrato de crédito'),
                  style:
                      const TextStyle(fontSize: 14.0, color: Color(0xff0A9BAE)),
                  recognizer: TapGestureRecognizer()..onTap = () {}),
              TextSpan(
                  text: Strings.autoLineString(' detenidamente'),
                  style: const TextStyle(
                      fontSize: 14.0, color: Color(0xff666666))),
            ])))
      ],
    );
  }

  Widget _buildBottomButtonView() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
            child: CustomButton(
          onPressed: Get.back,
          minWidth: 152.0,
          minHeight: 46.0,
          backgroundColor: Colors.white,
          disabledBackgroundColor: Colors.white,
          fontSize: 15.0,
          radius: 8.0,
          text: 'Cancelar',
          textColor: const Color(0xff333333),
          fontWeight: FontWeight.bold,
          side: const BorderSide(color: Color(0xff333333), width: 1.0),
        )),
        const SizedBox(
          width: 20.0,
        ),
        Expanded(
            child: CustomButton(
          onPressed: () {
            Get.back();
            widget.clickConfirm();
          },
          minWidth: 152.0,
          minHeight: 46.0,
          backgroundColor: const Color(0xffB8EF17),
          disabledBackgroundColor: const Color(0xffB8EF17),
          fontSize: 15.0,
          radius: 8.0,
          text: 'Confirmar',
          textColor: const Color(0xff333333),
          fontWeight: FontWeight.bold,
        ))
      ],
    );
  }

  Widget _buildCancelView() {
    return CustomClickView(
        onTap: Get.back,
        child: Container(
          height: 46.0,
          color: Colors.transparent,
          margin: const EdgeInsets.only(top: 10.0),
          child: Container(
            alignment: Alignment.center,
            width: 36.0,
            height: 36.0,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.white),
            child: const Text(
              'X',
              style: TextStyle(color: Color(0xff111111), fontSize: 16.0),
            ),
          ),
        ));
  }
}

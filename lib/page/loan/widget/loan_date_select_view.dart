import 'package:flutter/material.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class LoanDateTopView extends StatefulWidget {
  const LoanDateTopView({
    Key? key,
  }) : super(key: key);

  @override
  LoanDateTopViewState createState() => LoanDateTopViewState();
}

class LoanDateTopViewState extends State<LoanDateTopView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Monto del préstamo',
          style: TextStyle(
              fontSize: 18.0,
              color: Color(0xff333333),
              fontWeight: FontWeight.bold),
        ),
        GridView.builder(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 11,
                mainAxisSpacing: 11,
                childAspectRatio: 2.61),
            itemBuilder: (context, index) {
              return _buildMoneyItemView(index);
            },
            itemCount: 3,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            primary: false),
        const Padding(
            padding: EdgeInsets.only(top: 8.0, left: 7.0),
            child: Text(
              'Obtén un descuento en tu próximo préstamo',
              style: TextStyle(fontSize: 15.0, color: Color(0xffD53535)),
            )),
        const Padding(
            padding: EdgeInsets.only(left: 7.0, bottom: 16.0),
            child: Text(
              '100\$',
              style: TextStyle(
                  fontSize: 15.0,
                  color: Color(0xffD53535),
                  fontWeight: FontWeight.bold),
            )),
        const Text(
          'Por favor, elija la fecha de reembolso',
          style: TextStyle(
              fontSize: 18.0,
              color: Color(0xff333333),
              fontWeight: FontWeight.bold),
        ),
        GridView.builder(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 11,
                mainAxisSpacing: 11,
                childAspectRatio: 2.61),
            itemBuilder: (context, index) {
              return _buildDateItemView(index);
            },
            itemCount: 3,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            primary: false),
      ],
    );
  }

  Widget _buildMoneyItemView(int index) {
    return Container(
        height: 41.0,
        decoration: BoxDecoration(
          color: const Color(0xff333333),
          borderRadius: BorderRadius.circular(8.0),
        ),
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text('300,000',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15.0, color: Colors.white)),
            CustomImageView(
              Resource.assetsImageLoanLock,
              imageType: ImageType.assets,
              width: 21.0,
              height: 25.0,
              fit: BoxFit.contain,
            )
          ],
        ));
  }

  Widget _buildDateItemView(int index) {
    return Container(
        height: 41.0,
        decoration: BoxDecoration(
          color: const Color(0xff333333),
          borderRadius: BorderRadius.circular(8.0),
        ),
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text('300,000',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15.0, color: Colors.white)),
            CustomImageView(
              Resource.assetsImageLoanLock,
              imageType: ImageType.assets,
              width: 21.0,
              height: 25.0,
              fit: BoxFit.contain,
            )
          ],
        ));
  }
}

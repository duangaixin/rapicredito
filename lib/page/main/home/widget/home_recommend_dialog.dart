import 'package:flutter/material.dart';
import 'package:rapicredito/style/index.dart';
import 'package:rapicredito/widget/custom_button.dart';
import 'package:rapicredito/widget/custom_image_view.dart';

class HomeRecommendDialog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeRecommendDialogState();

  const HomeRecommendDialog({
    Key? key,
  }) : super(key: key);
}

class _HomeRecommendDialogState extends State<HomeRecommendDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            height: 521.0,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 68.0, left: 10.0, right: 10.0),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
              Resource.assetsImageHomeRecommendBg,
            ))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 94.0),
                  child: Text(
                    'Hola!',
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff333333),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5.0, bottom: 11.0),
                  child: Text(
                    'Por favor, experimente\n Préstamo gratuito',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xff333333),
                    ),
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: 5,
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 16.0, bottom: 35.0),
                        itemBuilder: (context, index) {
                          return _buildItemView(index);
                        }))
              ],
            )));
  }

  Widget _buildItemView(int index) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                Resource.assetsImageAuthTakeCamera,
                imageType: ImageType.assets,
                width: 40.0,
                height: 40.0,
                margin: EdgeInsets.only(right: 16.0),
              ),
              Text(
                'Coin Wallet',
                style: TextStyle(fontSize: 15.0, color: Color(0xff333333)),
              ),
            ],
          ),
          CustomButton(
            onPressed: () {},
            minWidth: 111.0,
            minHeight: 46.0,
            backgroundColor: const Color(0xffB8EF17),
            disabledBackgroundColor: const Color(0xffB8EF17),
            fontSize: 15.0,
            radius: 8.0,
            text: 'Pagar',
            textColor: const Color(0xff333333),
            fontWeight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_app/model/models/hotel_functions_model.dart';
import 'package:hotel_app/view/consts/styles.dart';

class HotelFunctionWidget extends StatelessWidget {
  const HotelFunctionWidget({
    super.key,
    required this.index,
    required this.hotelFunctionsLength,
    required this.hotelFunction,
  });

  final HotelFunction hotelFunction;
  final int index;
  final int hotelFunctionsLength;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        splashColor: Colors.transparent,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(index == 0 ? 15.0 : 0.0),
          topLeft: Radius.circular(index == 0 ? 15.0 : 0.0),
          bottomRight: Radius.circular(index == hotelFunctionsLength - 1 ? 15.0 : 0.0),
          bottomLeft: Radius.circular(index == hotelFunctionsLength - 1 ? 15.0 : 0.0),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 15.0,
            right: 15.0,
            top: index == 0 ? 15.0 : 0.0,
            bottom: index == hotelFunctionsLength - 1 ? 15.0 : 0.0,
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/${hotelFunction.icon}',
                width: 24.0,
                height: 24.0,
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hotelFunction.title,
                      style: MainStyles.kBlackColor2W500(16.0),
                    ),
                    Text(
                      hotelFunction.description,
                      style: MainStyles.kGreyColorW500(14.0),
                    ),
                  ],
                ),
              ),
              SvgPicture.asset('assets/icons/right_array.svg'),
            ],
          ),
        ),
      ),
    );
  }
}

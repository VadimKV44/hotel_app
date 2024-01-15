import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/model/models/booking_model/booking_model.dart';
import 'package:hotel_app/presenter/cubits/booking_cubit/booking_cubit.dart';
import 'package:hotel_app/presenter/utils/money_formatter.dart';
import 'package:hotel_app/view/consts/colors.dart';
import 'package:hotel_app/view/consts/strings.dart';
import 'package:hotel_app/view/screens/paid_screen.dart';
import 'package:hotel_app/view/widgets/add_tourist_widget.dart';
import 'package:hotel_app/view/widgets/block_with_booking_data_widget.dart';
import 'package:hotel_app/view/widgets/block_with_hotel_widget.dart';
import 'package:hotel_app/view/widgets/bottom_bar_widget.dart';
import 'package:hotel_app/view/widgets/custom_appbar_widget.dart';
import 'package:hotel_app/view/widgets/custom_error_widget.dart';
import 'package:hotel_app/view/widgets/custom_loading_animation_widget.dart';
import 'package:hotel_app/view/widgets/information_about_buyer_widget.dart';
import 'package:hotel_app/view/widgets/price_block_widget.dart';
import 'package:hotel_app/view/widgets/tourist_item_widget.dart';

class BookingHotelRoomScreen extends StatefulWidget {
  const BookingHotelRoomScreen({super.key});

  @override
  State<BookingHotelRoomScreen> createState() => _BookingHotelRoomScreenState();
}

class _BookingHotelRoomScreenState extends State<BookingHotelRoomScreen> {
  final GlobalKey<AnimatedListState> _touristsKey = GlobalKey<AnimatedListState>(debugLabel: 'tourists_key');
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    BlocProvider.of<BookingCubit>(context).booking();
    super.initState();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _mailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            backgroundColor: MainColors.kLightGreyColor,
            appBar: const CustomAppBarWidget(title: Strings.booking),
            body: getBookingHotelRoomScreenWidget(state),
          ),
        );
      },
    );
  }

  Widget getBookingHotelRoomScreenWidget(BookingState state) {
    Widget bookingHotelRoomScreenWidget = const SizedBox();
    if (state is Success) {
      BookingCubit bookingCubit = BlocProvider.of<BookingCubit>(context);
      BookingModel bookingModel = BlocProvider.of<BookingCubit>(context).bookingModel;
      bookingHotelRoomScreenWidget = FadeInUp(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 8.0),
                      BlockWithHotelWidget(
                        ratingName: bookingModel.ratingName ?? '',
                        rating: bookingModel.horating ?? 0,
                        hotelName: bookingModel.hotelName ?? '',
                        hotelAddress: bookingModel.hotelAddress ?? '',
                      ),
                      const SizedBox(height: 8.0),
                      BlockWithBookingDataWidget(bookingModel: bookingModel),
                      const SizedBox(height: 8.0),
                      InformationAboutBuyerWidget(
                        phoneNumberController: _phoneNumberController,
                        mailController: _mailController,
                      ),
                      const SizedBox(height: 4.0),
                      AnimatedList(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        key: _touristsKey,
                        physics: const NeverScrollableScrollPhysics(),
                        initialItemCount: bookingCubit.touristItems.length,
                        itemBuilder: (context, index, animation) {
                          return SizeTransition(
                            sizeFactor: animation,
                            child: TouristItemWidget(index: index),
                          );
                        },
                      ),
                      const SizedBox(height: 4.0),
                      AddTouristWidget(onTap: () => _addTourist(bookingCubit)),
                      const SizedBox(height: 8.0),
                      PriceBlockWidget(
                        tourPrice: (bookingModel.tourPrice ?? '').toString(),
                        fuelCharge: (bookingModel.fuelCharge ?? '').toString(),
                        serviceCharge: (bookingModel.serviceCharge ?? '').toString(),
                        fullPrice: bookingCubit.calculationFullPrice([
                          bookingModel.tourPrice ?? 0,
                          bookingModel.fuelCharge ?? 0,
                          bookingModel.serviceCharge ?? 0,
                        ]).toString(),
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ),
              ),
              BottomBarWidget(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PaidScreen()));
                  }
                },
                buttonText: '${Strings.toPay} ${moneyFormatter(
                  double.parse(
                    bookingCubit.calculationFullPrice([
                      bookingModel.tourPrice ?? 0,
                      bookingModel.fuelCharge ?? 0,
                      bookingModel.serviceCharge ?? 0,
                    ]).toString(),
                  ),
                )} ₽',
              ),
            ],
          ),
        ),
      );
    } else if (state is Loading) {
      bookingHotelRoomScreenWidget = const CustomLoadingAnimationWidget();
    } else if (state is Error) {
      bookingHotelRoomScreenWidget = CustomErrorWidget(
        error: BlocProvider.of<BookingCubit>(context).bookingModel.error ?? 'Error',
        refresh: () {
          BlocProvider.of<BookingCubit>(context).booking();
        },
      );
    }
    return bookingHotelRoomScreenWidget;
  }

  void _addTourist(BookingCubit bookingCubit) {
    _touristsKey.currentState?.insertItem(bookingCubit.touristItems.length);
    bookingCubit.addTourist(bookingCubit.touristItems.length);
  }
}

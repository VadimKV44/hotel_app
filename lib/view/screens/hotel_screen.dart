import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/model/models/hotel_functions_model.dart';
import 'package:hotel_app/presenter/cubits/hotel_cubit/hotel_cubit.dart';
import 'package:hotel_app/presenter/utils/money_formatter.dart';
import 'package:hotel_app/view/consts/colors.dart';
import 'package:hotel_app/view/consts/strings.dart';
import 'package:hotel_app/view/consts/styles.dart';
import 'package:hotel_app/view/screens/hotel_rooms_screen.dart';
import 'package:hotel_app/view/widgets/about_hotel_widget.dart';
import 'package:hotel_app/view/widgets/bottom_bar_widget.dart';
import 'package:hotel_app/view/widgets/custom_error_widget.dart';
import 'package:hotel_app/view/widgets/estimation_widget.dart';
import 'package:hotel_app/view/widgets/image_item_widget.dart';
import 'package:hotel_app/view/widgets/image_view_widget.dart';
import 'package:hotel_app/view/widgets/custom_loading_animation_widget.dart';

class HotelScreen extends StatefulWidget {
  const HotelScreen({super.key});

  @override
  State<HotelScreen> createState() => _HotelScreenState();
}

class _HotelScreenState extends State<HotelScreen> {
  List<HotelFunction> hotelFunctions = [
    HotelFunction(title: 'Удобства', description: 'Самое необходимое', icon: 'emoji_happy.svg'),
    HotelFunction(title: 'Что включено', description: 'Самое необходимое', icon: 'tick_square.svg'),
    HotelFunction(title: 'Что не включено', description: 'Самое необходимое', icon: 'close_square.svg'),
  ];

  @override
  void initState() {
    BlocProvider.of<HotelCubit>(context).getHotel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HotelCubit, HotelState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: MainColors.kLightGreyColor,
          body: getHotelScreenWidget(state),
        );
      },
    );
  }

  Widget getHotelScreenWidget(HotelState state) {
    Widget hotelScreenWidget = const SizedBox();
    if (state is Success) {
      hotelScreenWidget = FadeInUp(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: MainColors.kWhiteColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.0),
                              bottomRight: Radius.circular(12.0),
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: MediaQuery.of(context).viewPadding.top + 19.0),
                              Text(
                                Strings.hotel,
                                style: MainStyles.kBlackColorW500(18.0),
                              ),
                              const SizedBox(height: 16.0),
                              ImageViewWidget(
                                itemCount: state.hotel?.imageUrls != null ? state.hotel!.imageUrls!.length : 0,
                                itemBuilder: (context, index) {
                                  return ImageItemWidget(image: state.hotel!.imageUrls![index]);
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    EstimationWidget(
                                      rating: (state.hotel?.rating ?? '').toString(),
                                      ratingName: state.hotel?.ratingName ?? '',
                                    ),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      state.hotel?.name ?? '',
                                      style: MainStyles.kBlackColorW500(22.0),
                                    ),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      state.hotel?.address ?? '',
                                      style: MainStyles.kBlueColorW500(14.0),
                                    ),
                                    const SizedBox(height: 16.0),
                                    Row(
                                      children: [
                                        Text(
                                          'от ${moneyFormatter(double.parse((state.hotel?.minimalPrice ?? 0).toString()),)} ₽',
                                          style: MainStyles.kBlackColorW600(30.0),
                                        ),
                                        const SizedBox(width: 8.0),
                                        Text(
                                          (state.hotel?.priceForIt ?? '').toLowerCase(),
                                          style: MainStyles.kGreyColorW400(16.0),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        AboutHotelWidget(
                          hotelFunctions: hotelFunctions,
                          peculiarities: state.hotel?.aboutTheHotelModel?.peculiarities ?? [],
                          description: state.hotel?.aboutTheHotelModel?.description ?? '',
                        ),
                      ],
                    ),
                  ),
                ),
                BottomBarWidget(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HotelRoomsScreen(name: state.hotel?.name ?? '')));
                  },
                  buttonText: Strings.toChooseRoom,
                ),
              ],
            ),
          );
    } else if (state is Loading) {
      hotelScreenWidget = const CustomLoadingAnimationWidget();
    } else if (state is Error) {
      hotelScreenWidget = CustomErrorWidget(
        error: state.hotel?.error ?? 'Error',
        refresh: () {
          BlocProvider.of<HotelCubit>(context).getHotel();
        },
      );
    }
    return hotelScreenWidget;
  }
}

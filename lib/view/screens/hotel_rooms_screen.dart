import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/presenter/cubits/rooms_cubit/rooms_cubit.dart';
import 'package:hotel_app/view/consts/colors.dart';
import 'package:hotel_app/view/screens/booking_hotel_room_screen.dart';
import 'package:hotel_app/view/widgets/custom_appbar_widget.dart';
import 'package:hotel_app/view/widgets/custom_error_widget.dart';
import 'package:hotel_app/view/widgets/custom_loading_animation_widget.dart';
import 'package:hotel_app/view/widgets/hotel_room_item_widget.dart';

class HotelRoomsScreen extends StatefulWidget {
  const HotelRoomsScreen({
    super.key,
    required this.name,
  });

  final String name;

  @override
  State<HotelRoomsScreen> createState() => _HotelRoomsScreenState();
}

class _HotelRoomsScreenState extends State<HotelRoomsScreen> {

  @override
  void initState() {
    BlocProvider.of<RoomsCubit>(context).getRooms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoomsCubit, RoomsState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: MainColors.kLightGreyColor,
          appBar: CustomAppBarWidget(title: widget.name),
          body: getHotelRoomScreenWidget(state),
        );
      },
    );
  }

  Widget getHotelRoomScreenWidget(RoomsState state) {
    Widget hotelRoomScreenWidget = const SizedBox();

    if (state is Success) {
      hotelRoomScreenWidget = FadeInUp(
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 4.0, bottom: 40.0),
          itemCount: state.rooms?.rooms?.length ?? 0,
          itemBuilder: (context, index) {
            return HotelRoomItemWidget(
              room: state.rooms!.rooms![index],
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const BookingHotelRoomScreen()));
              },
            );
          },
        ),
      );
    } else if (state is Loading) {
      hotelRoomScreenWidget = const CustomLoadingAnimationWidget();
    } else if (state is Error) {
      hotelRoomScreenWidget = CustomErrorWidget(
        error: state.rooms?.error ?? 'Error',
        refresh: () {
          BlocProvider.of<RoomsCubit>(context).getRooms();
        },
      );
    }

    return hotelRoomScreenWidget;
  }
}

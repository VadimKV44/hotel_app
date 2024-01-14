import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/presenter/cubits/booking_cubit/booking_cubit.dart';
import 'package:hotel_app/presenter/cubits/hotel_cubit/hotel_cubit.dart';
import 'package:hotel_app/presenter/cubits/rooms_cubit/rooms_cubit.dart';
import 'package:hotel_app/view/screens/hotel_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HotelCubit>(create: (context) => HotelCubit()),
        BlocProvider<RoomsCubit>(create: (context) => RoomsCubit()),
        BlocProvider<BookingCubit>(create: (context) => BookingCubit()),
      ],
      child: const MaterialApp(
        home: HotelScreen(),
      ),
    );
  }
}

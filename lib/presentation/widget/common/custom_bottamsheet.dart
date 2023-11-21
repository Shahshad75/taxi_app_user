import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app_user/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:taxi_app_user/presentation/widget/common/button.dart';
import 'package:taxi_app_user/presentation/widget/common/dropdown_button.dart';
import 'package:taxi_app_user/presentation/widget/common/textfield.dart';
import 'package:taxi_app_user/service/drivers_model.dart';
import 'package:taxi_app_user/utils/app_text_styles.dart';

class BottomSheetContent extends StatelessWidget {
  BottomSheetContent({super.key});
  final List<String> seats = ["4 Seats", "5 Seates", "6 Seats"];
  final List<String> type = [
    "Sedan",
    "SUV (Sport Utility Vehicle)",
    "Hatchback"
  ];
  // final WebSocketService _webSocketService = WebSocketService();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is VehicleTypeSetState) {
          return chooseCares(context, state.drivers);
        } else if (state is SelectCarState) {
          return driverInfo(state.driver, context);
        }
        return settinVehicletype(context);
      },
    );
  }

  Widget chooseCares(BuildContext context, List drivers) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Select your Vehicle',
            style: TextStyle(
                color: Color.fromARGB(255, 90, 90, 90),
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
                fontFamily: 'Urbanist'),
          ),
          const Divider(
            thickness: 1,
            height: 30,
            color: Colors.grey,
          ),
          Expanded(
            child: SizedBox(
                child: ListView.builder(
              itemCount: drivers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    context.read<HomeBloc>().add(SelectCarEvent(
                        driver: Driver.fromJson(drivers[index])));
                  },
                  leading: CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: Image(
                      image: AssetImage(
                        index % 2 == 0
                            ? 'asset/image/suv.png'
                            : 'asset/image/hatcback.png',
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  title: Text(
                    drivers[index]['Name'],
                    style: CustomTextStyle.buttonTextStyle,
                  ),
                  subtitle: Text(drivers[index]['VehicleType']),
                  trailing: const Text(
                    "\$ 344",
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                );
              },
            )),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          //   child: CustomButton(
          //     text: "Continue",
          //     onTap: () {
          //
          //     },
          //   ),
          // )
        ],
      ),
    );
  }

  Widget driverInfo(Driver driver, BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'The picup point for Kochi Marriott Hotel',
            style: TextStyle(
                color: Color.fromARGB(255, 90, 90, 90),
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
                fontFamily: 'Urbanist'),
          ),
          const Divider(
            thickness: 1,
            height: 30,
            color: Colors.grey,
          ),
          Expanded(
            child: SizedBox(
                child: ListView(children: [
              ListTile(
                leading: const CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('asset/image/sedan.png'),
                ),
                title: Text(
                  driver.vehicleBrand,
                  style: CustomTextStyle.buttonTextStyle,
                ),
                subtitle: Text(driver.vehicleNumber),
                trailing: const SizedBox(
                  width: 70,
                  height: 30,
                  child: Row(
                    children: [
                      Text(
                        '4.5 ',
                        style: TextStyle(fontSize: 18),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    driver.driverImg,
                  ),
                  radius: 34,
                ),
                title: Text(
                  driver.name,
                  style: CustomTextStyle.buttonTextStyle,
                ),
                subtitle: Text(driver.gender),
                trailing:
                    IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 10),
                child: ListTile(
                  title: Text(
                    'The picup point for Kochi Marriott Hotel',
                    style: CustomTextStyle.buttonTextStyle,
                  ),
                  trailing: Text(
                    '\$491.77',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 41, 121, 44)),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 10),
                child: ListTile(
                  title: Text(
                    '9:47pm . 3 min away',
                    style: CustomTextStyle.buttonTextStyle,
                  ),
                  subtitle: Text('Affordable, compact ride'),
                  trailing: Text(
                    '\$491.77',
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 121, 60, 41)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 10),
                child: ListTile(
                    title: const Text(
                      'Payment Methods',
                      style: CustomTextStyle.buttonTextStyle,
                    ),
                    subtitle: const Text('Cash,Card..all are available'),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_right_outlined))),
              ),
            ])),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: CustomButton(
              text: "Continue",
              onTap: () {
                // print('hie');
                // _webSocketService.connect();
                // _webSocketService.send('Ride Booked');
                context.read<HomeBloc>().add(ConfirmDriveEvent(driver: driver));
              },
            ),
          )
        ],
      ),
    );
  }

  Widget settinVehicletype(BuildContext context) {
    final selectVehicleTypeController = TextEditingController();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Set Vehicle Types',
            style: TextStyle(
                color: Color.fromARGB(255, 90, 90, 90),
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
                fontFamily: 'Urbanist'),
          ),
          const Divider(
            thickness: 1,
            height: 30,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const ListTile(
                  leading: Icon(CupertinoIcons.location),
                  title: Text(
                    "Kochi Airport Bus Terminal",
                    style: CustomTextStyle.buttonTextStyle,
                  ),
                  subtitle: Text('Drop-off'),
                ),
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state is SelectVehicleTypeState) {
                      selectVehicleTypeController.text = state.vehicleType;
                    }
                    return CustomTextfield(
                        controller: selectVehicleTypeController,
                        hintText: 'Vehicle type',
                        readOnly: true,
                        suffixIcon: CustomDropDownButton(
                          item: type,
                          onChanged: (String? value) {
                            context.read<HomeBloc>().add(
                                SelectVehicleTypeEvent(vehicleType: value!));
                          },
                        ));
                  },
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: CustomButton(
                    text: "Continue",
                    onTap: () {
                      // context.read<HomeBloc>().add(VehicleTypeSetEvnet());
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

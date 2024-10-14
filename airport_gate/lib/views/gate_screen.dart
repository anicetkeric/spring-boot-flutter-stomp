import 'dart:async';
import 'package:airport_gate/core/colors.dart';
import 'package:airport_gate/cubit/gate/gate_info_cubit.dart';
import 'package:airport_gate/data/model/gate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'components/gate_destination.dart';
import 'components/marquee_builder.dart';

const marqueeString =
    "Passengers should be fully informed of their rights in the event of denied boarding and of cancellation or long delay of flights, so that they can effectively exercise their rights.";

class GateScreen extends StatefulWidget {
  const GateScreen({super.key});

  @override
  State<GateScreen> createState() => _GateScreenState();
}

class _GateScreenState extends State<GateScreen> {
  DateTime currentDateTime = DateTime.now();

  _getDateTime() {
    setState(() {
      currentDateTime = DateTime.now();
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GateInfoCubit>(context).connect();
    Timer.periodic(const Duration(seconds: 1), (_) => _getDateTime());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        margin: const EdgeInsets.only(top: 24, right: 12, left: 12),
        padding: const EdgeInsets.only(top: 12, right: 12, left: 12),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          color: primaryLightColor,
        ),
        child: BlocBuilder<GateInfoCubit, GateInfoState>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            if (state is GateInfoSuccess) {
              final info = state.response;
              return InfoData(currentDateTime: currentDateTime, gate: info,);
            } else {
              return NoData(currentDateTime: currentDateTime);
            }
          },
        ),
      ),
    );
  }
}

class InfoData extends StatelessWidget {
  const InfoData({
    super.key,
    required this.currentDateTime,
    required this.gate,
  });

  final DateTime currentDateTime;
  final Gate gate;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Text(DateFormat('HH:mm:ss').format(currentDateTime),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: nightBlueColor,
                    fontWeight: FontWeight.bold,
                  )),
        ),
        const SizedBox(height: 15.0),
        GateDestination(
          number: gate.gateNumber,
          destination: gate.destination!,
        ),
        const SizedBox(height: 25.0),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Flight No: ${gate.flightNumber}",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: whiteColor,
                      )),
              Text("Scheduled time: ${DateFormat('HH:mm').format(DateTime.parse(gate.scheduledDate)) }",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: whiteColor,
                      )),
            ],
          ),
        ),
        const SizedBox(height: 15.0),
        Center(
          child: Container(
            decoration: BoxDecoration(color: getStatusColor(gate.status)),
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
            child: Text(getStatusTitle(gate.status),
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: whiteColor,
                    )),
          ),
        ),
        const SizedBox(height: 20.0),
        const MarqueeBuilder(
          marqueeText: marqueeString,
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
  String getStatusTitle(String status){
    switch (status) {
      case "ON_TIME":
        return "On Time";
      case "BOARDING":
        return "Boarding";
      case "DELAYED":
        return "Delayed";
      case "LAST_CALL":
        return "Last call";
      default:
        return status;
    }
  }
  Color getStatusColor(String status){
    switch (status) {
      case "ON_TIME":
        return Colors.lightBlueAccent;
      case "BOARDING":
        return Colors.green;
      case "DELAYED":
        return Colors.orange;
      case "LAST_CALL":
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}



class NoData extends StatelessWidget {
  const NoData({
    super.key,
    required this.currentDateTime,
  });

  final DateTime currentDateTime;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: Text(DateFormat('HH:mm:ss').format(currentDateTime),
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: nightBlueColor,
                    fontWeight: FontWeight.bold,
                  )),
        ),
        const SizedBox(height: 15.0),
        Text("Waiting For Data",
            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Theme.of(context).colorScheme.error,
                  fontWeight: FontWeight.bold,
                  fontSize: 100,
                )),
        const Spacer(),
        const MarqueeBuilder(
          marqueeText: marqueeString,
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}

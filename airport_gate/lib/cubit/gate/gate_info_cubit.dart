import 'dart:convert';
import 'dart:developer';

import 'package:airport_gate/data/model/gate.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';

part 'gate_info_state.dart';

class GateInfoCubit extends Cubit<GateInfoState> {
  GateInfoCubit() : super(GateInfoInitial());


  late StompClient client;
  static const baseSocketUrl = "http://localhost:8069/ws";
  static const gateId = '66fc36919a4d628f3792a700';
  static const audioDir = 'assets/audio';

  static String getAudio(audioName) => '$audioDir/$audioName.mp3';

  dynamic connect() {
    client = StompClient(
      config: StompConfig(
        useSockJS: true,
        url: baseSocketUrl,
        beforeConnect: () async {
          log('Waiting to connect...');
          await Future.delayed(const Duration(milliseconds: 200));
          log('Connecting...');
        },
        onStompError: onStompError,
        onWebSocketError: onWebSocketError,
        onConnect: onConnect
      ),
    );

    client.activate();
  }

  void onStompError(StompFrame e) {
    if (!isClosed) emit(GateInfoError(message: e.body!));
  }

  void onWebSocketError(dynamic e) {
    if (!isClosed) emit(GateInfoError(message: e.body!));
  }

  void onConnect(StompFrame frame) {
    client.subscribe(
      destination: '/topic/gate-info/$gateId',
      callback: callback,
    );
  }

  void callback(StompFrame event) {
    if (event.body != null) {
      log('socket body: ${event.body}');
      Map<String, dynamic> data = json.decode(event.body!);

     // playAudioByAssetName('gate');
      if (!isClosed) emit(GateInfoSuccess(response: Gate.fromJson(data)));
    }
  }

  Future<void> playAudioByAssetName(audioName) async {
    final player = AudioPlayer();
    AudioCache.instance = AudioCache(prefix: '');
    final audioPath = getAudio(audioName);
    await player.play(AssetSource(audioPath));
  }

  @override
  Future<void> close() {
    client.deactivate();
    return super.close();
  }
}

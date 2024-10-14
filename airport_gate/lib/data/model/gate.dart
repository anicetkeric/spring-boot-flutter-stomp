class Gate {
  String gateId;
  String gateNumber;
  String? airline;
  String flightNumber;
  String? destination;
  String scheduledDate;
  String status;

  Gate(
      {required this.gateId,
      required this.gateNumber,
      this.airline,
      required this.flightNumber,
      this.destination,
      required this.scheduledDate,
      required this.status});

  factory Gate.fromJson(Map<String, dynamic> json) {
    return Gate(
        gateId: json['gateId'],
        gateNumber: json['gateNumber'],
        airline: json['airline'],
        flightNumber: json['flightNumber'],
        destination: json['destination'],
        scheduledDate: json['scheduledDate'],
        status: json['status']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gateId'] = gateId;
    data['gateNumber'] = gateNumber;
    data['airline'] = airline;
    data['flightNumber'] = flightNumber;
    data['destination'] = destination;
    data['scheduledDate'] = scheduledDate;
    data['status'] = status;

    return data;
  }
}

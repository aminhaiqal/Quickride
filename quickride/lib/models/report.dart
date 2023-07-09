class Report {
  String? id;
  String? userId;
  String? driverId;
  String? rideId;
  String? reportType;
  String? reportDescription;
  String? reportDate;
  String? reportTime;
  String? reportStatus;

  Report({
    this.id,
    this.userId,
    this.driverId,
    this.rideId,
    this.reportType,
    this.reportDescription,
    this.reportDate,
    this.reportTime,
    this.reportStatus,
  });

  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      id: json['id'],
      userId: json['user_id'],
      driverId: json['driver_id'],
      rideId: json['ride_id'],
      reportType: json['report_type'],
      reportDescription: json['report_description'],
      reportDate: json['report_date'],
      reportTime: json['report_time'],
      reportStatus: json['report_status'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'driver_id': driverId,
    'ride_id': rideId,
    'report_type': reportType,
    'report_description': reportDescription,
    'report_date': reportDate,
    'report_time': reportTime,
    'report_status': reportStatus,
  };
}
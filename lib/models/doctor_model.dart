class Doctor {
  String name;
  String qualifications;
  String specialization;
  String clinicAddress;
  String appointmentFee;
  String clinicTime;

  Doctor({
    required this.name,
    required this.qualifications,
    required this.specialization,
    required this.clinicAddress,
    required this.appointmentFee,
    required this.clinicTime,
  });
}
/*
  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'],
      qualifications: json['qualifications'],
      specialization: json['specialization'],
      clinicAddress: json['clinicAddress'],
      appointmentFee: json['appointmentFee'],
      clinicTime: json['clinicTime'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'qualifications': qualifications,
      'specialization': specialization,
      'clinicAddress': clinicAddress,
      'appointmentFee': appointmentFee,
      'clinicTime': clinicTime,
    };
  }
}
*/
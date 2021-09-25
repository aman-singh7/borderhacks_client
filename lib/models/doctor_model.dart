class Doctor {
  String appointmentFee;
  String clinicAddress;
  String clinicTime;
  String name;
  String qualifications;
  String specialization;

  Doctor({
    required this.appointmentFee,
    required this.clinicAddress,
    required this.clinicTime,
    required this.name,
    required this.qualifications,
    required this.specialization,
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
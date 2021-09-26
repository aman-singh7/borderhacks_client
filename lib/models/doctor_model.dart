class Doctor {
  int appointmentFee;
  String clinicAddress, clinicTime, name, qualifications, specialization, id;

  Doctor({
    required this.id,
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
      appointmentFee: json['appointmentFee'],
      clinicAddress: json['clinicAddress'],
      clinicTime: json['clinicTime'],
      name: json['name'],
      qualifications: json['qualifications'],
      specialization: json['specialization'], 
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'appointmentFee': appointmentFee,
      'clinicAddress': clinicAddress,
      'clinicTime': clinicTime,
      'name': name,
      'qualifications': qualifications,
      'specialization': specialization,
    };
  }
}
*/

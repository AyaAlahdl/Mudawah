class UpdateAppointmentState {
  var appointmentId;
  var stateId;
  UpdateAppointmentState({
    required this.appointmentId,
    required this.stateId,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appointment_id'] = appointmentId;
    data['state_id'] = stateId;
    return data;
  }
}

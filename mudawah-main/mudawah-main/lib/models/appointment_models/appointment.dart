import 'package:flutter/cupertino.dart';
import 'package:mudawah/models/User.dart';
import 'package:mudawah/models/appointment_models/state.dart';
import 'package:mudawah/models/appointment_models/test.dart';

import '../facibility_models/clinic.dart';
import '../user_models/doctor.dart';

class Appointment {
  var id;
  var patientName;
  var patientAge;
  var patientPhone;
  var isFirstTime;
  var note;
  var price;
  var time;
  var date;
  var doctorId;
  var clinicId;
  var stateId;
  var workday_period_id;
  var doctor;
  var clinic;
  var user;
  var state;

  Appointment(
      {this.id,
      this.patientName,
      this.patientAge,
      this.patientPhone,
      this.isFirstTime,
      this.note,
      this.price,
      this.time,
      this.doctor,
      this.clinic,
      this.date,
      this.doctorId,
      this.clinicId,
      this.stateId,
      this.state});

  Appointment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientName = json['patient_name'];
    patientAge = json['patient_age'];
    patientPhone = json['patient_phone'];
    isFirstTime = json['is_first_time'];
    note = json['note'];
    price = json['price'];
    time = json['time'];
    date = json['date'];
    doctor =
        json['doctor'] != null ? new Doctorr.fromJson(json['doctor']) : null;
    clinic =
        json['clinic'] != null ? new Clinics.fromJson(json['clinic']) : null;
    state =
        user = json['user'] != null ? new User.fromJson(json['user']) : null;
    state =
        json['state'] != null ? AppointmentState.fromJson(json['state']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['patient_name'] = this.patientName;
    data['age'] = this.patientAge;
    data['patient_phone'] = this.patientPhone;
    data['is_first_time'] = this.isFirstTime;
    data['note'] = this.note;
    data['price'] = this.price;
    data['time'] = this.time;
    data['date'] = this.date;
    data['doctor_id'] = this.doctorId;
    data['clinic_id'] = this.clinicId;
    data['state_id'] = this.stateId;
    data['workday_period_id'] = this.workday_period_id;
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.toJson();
    }
    if (this.clinic != null) {
      data['clinic'] = this.clinic!.toJson();
    }
    if (this.clinic != null) {
      data['clinic'] = this.clinic!.toJson();
    }
    if (this.state != null) {
      data['state'] = this.state!.toJson();
    }

    return data;
  }
}

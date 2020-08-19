class Order {
  String id,
      clientId,
      name,
      // ignore: non_constant_identifier_names
      delivery_address,
      email,
      patient,
      contact,
      nic,
      // ignore: non_constant_identifier_names
      ordered_at,
      // ignore: non_constant_identifier_names
      prescription_url;

  // ignore: non_constant_identifier_names
  final int delivery_charges,
      // ignore: non_constant_identifier_names
      full_amount;

  Order({
      this.id,
        this.clientId,
        this.name,
        // ignore: non_constant_identifier_names
        this.delivery_address,
        this.email,
        this.patient,
        this.contact,
        this.nic,
        // ignore: non_constant_identifier_names
        this.ordered_at,
        // ignore: non_constant_identifier_names
        this.delivery_charges,
        // ignore: non_constant_identifier_names
        this.full_amount,
        // ignore: non_constant_identifier_names
        this.prescription_url});

  // factory Order.fromJson(Map<String, dynamic> json) {
  //   return Order(
  //       id: json['nid'],
  //       clientId: json['clientId'],
  //       name: json['name'],
  //       delivery_address: json['delivery_address'],
  //       email: json['email'],
  //       patient: json['patient_name'],
  //       contact: json['contact_number'],
  //       nic: json['nic'],
  //       ordered_at: json['ordered_at'],
  //       delivery_charges: json['delivery_charges'],
  //       full_amount: json['full_amount'],
  //       prescription_url: json['prescription_url']);
  // }
}

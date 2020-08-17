class Order {
  String id,
      clientId,
      name,
      delivery_address,
      email,
      patient,
      contact,
      nic,
      ordered_at,
      prescription_url;

  final int delivery_charges,
      full_amount;

  Order(
      this.id,
        this.clientId,
        this.name,
        this.delivery_address,
        this.email,
        this.patient,
        this.contact,
        this.nic,
        this.ordered_at,
        this.delivery_charges,
        this.full_amount,
        this.prescription_url);

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

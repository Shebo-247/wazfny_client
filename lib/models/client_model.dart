class Client {
  String id, firstName, lastName, address, image;

  Client({
    this.id,
    this.firstName,
    this.lastName,
    this.address,
    this.image,
  });

  toJson() {
    return {
      "id": this.id,
      "firstName": this.firstName,
      "lastName": this.lastName,
      "address": this.address,
      "image": this.image,
    };
  }

  factory Client.fromJson(Map<dynamic, dynamic> json) {
    return Client(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      address: json['address'],
      image: json['image'],
    );
  }
}

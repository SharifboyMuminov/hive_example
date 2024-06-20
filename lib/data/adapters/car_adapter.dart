// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_example/data/models/car/car_model.dart';
//
// class CarAdapter extends TypeAdapter<CarModel> {
//   @override
//   final int typeId = 0;
//
//   @override
//   CarModel read(BinaryReader reader) {
//     final String name = reader.read() as String? ?? "";
//     final String companyName = reader.read() as String? ?? "";
//     final num price = reader.read() as num? ?? 0;
//     final Color color = Color(reader.readUint32());
//
//     return CarModel(
//       name: name,
//       price: price,
//       companyName: companyName,
//       color: color,
//     );
//   }
//
//   @override
//   void write(BinaryWriter writer, CarModel obj) {
//     writer.write(obj.name);
//     writer.write(obj.companyName);
//     writer.write(obj.price);
//     writer.writeUint32(obj.color.value);
//   }
// }

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oquvchi.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OquvchiAdapter extends TypeAdapter<Oquvchi> {
  @override
  final int typeId = 0;

  @override
  Oquvchi read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Oquvchi(
      ism: fields[0] as String,
      familiya: fields[1] as String,
      yosh: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Oquvchi obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.ism)
      ..writeByte(1)
      ..write(obj.familiya)
      ..writeByte(2)
      ..write(obj.yosh);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OquvchiAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

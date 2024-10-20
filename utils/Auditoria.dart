class Auditoria {
  int? id;
  String accion;

  Auditoria({this.id, required this.accion});

  // Convierte un objeto Auditoria a un mapa
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'accion': accion,
    };
  }

  // Convierte un mapa en un objeto Auditoria
  factory Auditoria.fromMap(Map<String, dynamic> map) {
    return Auditoria(
      id: map['id'],
      accion: map['accion'],
    );
  }
}
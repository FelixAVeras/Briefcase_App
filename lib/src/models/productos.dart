class ProductoModel {
  int id;
  String nombre;
  int precioUnitario;
  int costoUnitario;
  String categoria;
  String descripcion;

  int get prodId => id;
  String get prodNombre => nombre;
  int get prodPrice => precioUnitario;
  int get prodCosto => costoUnitario;
  String get prodCategoria => categoria;
  String get prodDescr => descripcion;

  ProductoModel({this.id, this.nombre, this.precioUnitario, this.costoUnitario, this.categoria, this.descripcion});

  ProductoModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nombre = map['nombre'];
    precioUnitario = map['precioUnitario'];
    costoUnitario = map['costoUnitario'];
    categoria = map['categoria'];
    descripcion = map['descripcion'];
  }

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{'id': id, 'nombre': nombre, 'precioUnitario': precioUnitario, 'costoUnitario': costoUnitario, 'categoria': categoria, 'descripcion': descripcion};
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}
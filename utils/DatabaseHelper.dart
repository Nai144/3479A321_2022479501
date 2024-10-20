import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'auditoria.dart';

class DatabaseHelper {
  // Singleton DatabaseHelper
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Inicializa la base de datos
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'auditoria.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  // Crea la tabla auditoría
  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE auditoria(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        accion TEXT
      )
    ''');
  }

  // Inserta una acción en la tabla auditoría
  Future<int> insertAccion(Auditoria auditoria) async {
    Database db = await database;
    return await db.insert('auditoria', auditoria.toMap());
  }

  // Obtiene todas las acciones de la tabla auditoría
  Future<List<Auditoria>> getAcciones() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('auditoria');
    
    return List.generate(maps.length, (i) {
      return Auditoria.fromMap(maps[i]);
    });
  }
}
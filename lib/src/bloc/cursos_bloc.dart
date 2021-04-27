
import 'package:matricula/src/Models/model_cursos.dart';
import 'package:matricula/src/providers/cursos_provider.dart';
import 'package:rxdart/rxdart.dart';

class CursosBloc {

  final _cursosController = BehaviorSubject<List<CursosModel>>();

  final _cursosProvider = new CursosProvider();

  Stream<List<CursosModel>> get carrerasStream => _cursosController.stream;
  //Stream<bool> get cargando => _cargardoController.stream;

  //Recuperar los datos del Stream
  void cargarCarreras(String codigoCarrera) async{
    final cursos = await _cursosProvider.getCursosxCarreras(codigoCarrera);
    _cursosController.sink.add(cursos);
  }

  //Cerrar los Stream
  dispose(){
    _cursosController?.close();
  }

}


import 'package:matricula/src/Models/model_grupos.dart';
import 'package:matricula/src/providers/grupos_provider.dart';
import 'package:rxdart/rxdart.dart';

class GruposBloc {

  final _gruposController = BehaviorSubject<List<GruposModel>>();

  final _gruposProvider = new GruposProvider();

  Stream<List<GruposModel>> get carrerasStream => _gruposController.stream;
  //Stream<bool> get cargando => _cargardoController.stream;

  //Recuperar los datos del Stream
  void cargarGrupos(String nombreCurso) async{
    final cursos = await _gruposProvider.getCursosxCarreras(nombreCurso);
    _gruposController.sink.add(cursos);
  }

  //Cerrar los Stream
  dispose(){
    _gruposController?.close();
  }

}
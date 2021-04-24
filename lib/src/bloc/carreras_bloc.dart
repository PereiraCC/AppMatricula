

import 'package:matricula/src/Models/model_carreras.dart';
import 'package:matricula/src/providers/carreras_provider.dart';
import 'package:rxdart/rxdart.dart';

class CarrerasBloc {

  final _carreraController = BehaviorSubject<List<CarrerasModel>>();

  final _carrerasProvider = new CarrerasProvider();

  Stream<List<CarrerasModel>> get carrerasStream => _carreraController.stream;
  //Stream<bool> get cargando => _cargardoController.stream;

  //Recuperar los datos del Stream
  void cargarCarreras() async{

    final carreras = await _carrerasProvider.getCarreras();
    _carreraController.sink.add(carreras);

  }


  //Cerrar los Stream
  dispose(){
    _carreraController?.close();
  }

}
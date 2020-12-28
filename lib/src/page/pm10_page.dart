import 'package:flutter/material.dart';

class MaterialPm10 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AírBogotá'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Divider(),
              SafeArea(
                child: Center(
                  child: Text('Material Particulado Inferior a 10 Micrómetros ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          fontStyle: FontStyle.italic)),
                ),
              ),
              Divider(),
              createDescription(),
            ],
          ),
        ),
      ),
    );
  }

  SafeArea createDescription() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Text(
                  'Se denomina PM10 a pequeñas partículas sólidas o líquidas de polvo, cenizas, hollín, partículas metálicas, cemento ó polen, dispersas en la atmósfera, y cuyo diámetro varía entre 2,5 y 10 µm (1 micrómetro corresponde la milésima parte de 1 milímetro). Están formadas principalmente por compuestos inorgánicos como silicatos y aluminatos, metales pesados entre otros, y material orgánico asociado a partículas de carbono (hollín).',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15.0,
                      fontStyle: FontStyle.normal)),
              Text(
                  'Las PM10 al ser inhaladas y al penetrar con facilidad al sistema respiratorio humano, causan efectos adversos a la salud de las personas específicamente a la salud respiratoria. Por viajar más profundamente en los pulmones y por estar compuesta de elementos que son más tóxicos (como metales pesados y compuestos orgánicos que causan cáncer). El exponerse a partículas conduce al incremento de uso de medicamentos y más visitas al doctor o a la sala de emergencias.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 15.0,
                      fontStyle: FontStyle.normal)),
              Image(
                  image: NetworkImage(
                      'https://image.slidesharecdn.com/presentacionseminario2-120220155706-phpapp02/95/material-particulado-menor-o-igual-a-10-micras-11-728.jpg?cb=1329753670')),
            ],
          ),
        ),
      ),
    );
  }
}

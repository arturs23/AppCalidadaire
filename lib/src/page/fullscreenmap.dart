import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:mapbox_mapas/src/bloc/provider.dart';
// import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';

class FullScreenMap extends StatefulWidget {
  @override
  _FullScreenMapState createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  MapboxMapController mapController;
  final center = LatLng(4.592227, -74.165328);
  final pm10Style = 'mapbox://styles/sergiolarra06/ckgvk1hed04yo19se5sv1fsql';
  final pm25Style = 'mapbox://styles/sergiolarra06/ckgpyr7me1axw19n18eefu6jo';
  Position currentLocation;
  LatLng _centerPos;

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
  }

  Future<Position> locateUser() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  }

  void _getUserLocation() async {
    currentLocation = await locateUser();
    setState(() {
      _centerPos = LatLng(currentLocation.latitude, currentLocation.longitude);
    });
    print(_centerPos);
    mapController.animateCamera(CameraUpdate.newLatLng(_centerPos));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'PM 2.5',
              ),
              Tab(
                text: 'PM 10',
              ),
            ],
          ),
          title: Text('AírBogotá'),
          backgroundColor: Colors.blue,
        ),
        drawer: MenuLateral(),
        body: TabBarView(
          children: [
            crearMapa(),
            crearMapa2(),
          ],
        ),
        floatingActionButton: botonesFlotantes(),
      ),
    );
  }

  Column botonesFlotantes() {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        //Colors
        Container(
          padding: EdgeInsets.only(top: 180.0),
          child: new FloatingActionButton(
            heroTag: "btn0",
            child: Icon(Icons.dehaze),
            onPressed: () {
              nivelPolucion();
            },
          ),
        ),
        SizedBox(height: 5),
        //Zoom In
        Container(
          padding: EdgeInsets.only(top: 1.0),
          child: new FloatingActionButton(
            heroTag: "btn1",
            child: Icon(Icons.zoom_in),
            onPressed: () {
              mapController.animateCamera(CameraUpdate.zoomIn());
            },
          ),
        ),
        SizedBox(height: 5),
        //Zoom out
        Container(
          padding: EdgeInsets.only(top: 1.0),
          child: new FloatingActionButton(
            heroTag: "btn2",
            child: Icon(Icons.zoom_out),
            onPressed: () {
              mapController.animateCamera(CameraUpdate.zoomOut());
            },
          ),
        ),
        SizedBox(height: 350),
        new FloatingActionButton(
          heroTag: "btn3",
          child: Icon(Icons.add_location),
          onPressed: _getUserLocation,
        ),
      ],
    );
  }

  Future<void> nivelPolucion() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Nivel de polución:'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ClipRect(
                      child: Image(
                        image: NetworkImage(
                            'https://www.colorbook.io/imagecreator.php?hex=0aff02&width=400&height=300&text=%20400x300'),
                        width: 50.0,
                        height: 20.0,
                      ),
                    ),
                    Text(
                      'Favorable',
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Row(
                  children: <Widget>[
                    ClipRect(
                      child: Image(
                        image: NetworkImage(
                            'https://www.colorbook.io/imagecreator.php?hex=97ff02&width=400&height=300&text=%20400x300'),
                        width: 50.0,
                        height: 20.0,
                      ),
                    ),
                    Text(
                      'Moderada',
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Row(
                  children: <Widget>[
                    ClipRect(
                      child: Image(
                        image: NetworkImage(
                            'https://www.colorbook.io/imagecreator.php?hex=f0ff04&width=400&height=300&text=%20400x300'),
                        width: 50.0,
                        height: 20.0,
                      ),
                    ),
                    Text(
                      'Regular',
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Row(
                  children: <Widget>[
                    ClipRect(
                      child: Image(
                        image: NetworkImage(
                            'https://www.colorbook.io/imagecreator.php?hex=ffc204&width=400&height=300&text=%20400x300'),
                        width: 50.0,
                        height: 20.0,
                      ),
                    ),
                    Text(
                      'Insano para grupos sensibles',
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Row(
                  children: <Widget>[
                    ClipRect(
                      child: Image(
                        image: NetworkImage(
                            'https://www.colorbook.io/imagecreator.php?hex=f04500&width=400&height=300&text=%20400x300'),
                        width: 50.0,
                        height: 20.0,
                      ),
                    ),
                    Text(
                      'Insano',
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Row(
                  children: <Widget>[
                    ClipRect(
                      child: Image(
                        image: NetworkImage(
                            'https://www.colorbook.io/imagecreator.php?hex=f04500&width=400&height=300&text=%20400x300'),
                        width: 50.0,
                        height: 20.0,
                      ),
                    ),
                    Text(
                      'Muy insano',
                    ),
                  ],
                ),
                SizedBox(height: 5.0),
                Row(
                  children: <Widget>[
                    ClipRect(
                      child: Image(
                        image: NetworkImage(
                            'https://www.colorbook.io/imagecreator.php?hex=ff0202&width=400&height=300&text=%20400x300'),
                        width: 50.0,
                        height: 20.0,
                      ),
                    ),
                    Text(
                      'Peligroso',
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            BackButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  MapboxMap crearMapa() {
    return MapboxMap(
      myLocationEnabled: true,
      styleString: pm25Style,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(target: center, zoom: 14),
    );
  }

  MapboxMap crearMapa2() {
    return MapboxMap(
      myLocationEnabled: true,
      styleString: pm10Style,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(target: center, zoom: 14),
    );
  }
}

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
              accountName: Text('${bloc.email}'),
              accountEmail: null,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/AirBogota.png')))),
          ListTile(
            title: Text('¿Qué es el PM 2.5?'),
            onTap: () {
              Navigator.pushNamed(context, 'pm25');
            },
          ),
          Divider(
            height: 10.0,
          ),
          ListTile(
            title: Text('¿Qué es el PM 10?'),
            onTap: () {
              Navigator.pushNamed(context, 'pm10');
            },
          ),
          FloatingActionButton(
            child: Icon(Icons.exit_to_app),
            backgroundColor: Colors.black,
            onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
          ),
        ],
      ),
    );
  }
}

class MenuLateralColors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return new Drawer(
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
              accountName: Text('${bloc.email}'),
              accountEmail: null,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/AirBogota.png')))),
          ListTile(
            title: Text('¿Qué es el PM 2.5?'),
            onTap: () {
              Navigator.pushNamed(context, 'pm25');
            },
          ),
          Divider(
            height: 10.0,
          ),
          ListTile(
            title: Text('¿Qué es el PM 10?'),
            onTap: () {
              Navigator.pushNamed(context, 'pm10');
            },
          ),
          FloatingActionButton(
            child: Icon(Icons.exit_to_app),
            backgroundColor: Colors.black,
            onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
          ),
        ],
      ),
    );
  }
}

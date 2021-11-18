// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }

  double zoomVal = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading:
              IconButton(icon: const Icon(Icons.arrow_left), onPressed: () {}),
          title: Text("Parcial 4 Maps TeLoLlevoSV"),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: const Icon(Icons.search))
          ]),
      body: Stack(
        children: <Widget>[
          _googlemaps(context),
          //_zoomminusfunction(),
          //_zoomplusfunction(),
          _buildContainer(),
        ],
      ),
    );
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(
              width: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                "https://www.dccreditunion.coop/files/Accesso-Office_24-555x370.jpg",
                13.337215,
                -88.441706,
                "Sucursal Usulutan Centro",
              ),
            ),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                "https://www.valleystrong.com/sites/www.valleystrong.com/files/media/artisan_front.jpg",
                13.473357,
                -88.172305,
                "Sucursal San Miguel",
              ),
            ),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                "https://www.valleystrong.com/sites/www.valleystrong.com/files/media/panama_longfront.jpg",
                13.477576,
                -88.193230,
                "Sucursal San Miguel 2",
              ),
            ),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                "https://www.valleystrong.com/sites/www.valleystrong.com/files/media/river_run_front.jpg",
                13.692486,
                -88.103046,
                "Sucursal Morazan Centro",
              ),
            ),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                "https://cdn.businessyab.com/assets/uploads/f65ce186b0a8004b25303d266329a22c_-united-states-california-kern-county-bakersfield-mount-vernon-avenue-3901-valley-strong-credit-union-661-833-7900.jpg",
                13.696455,
                -88.105495,
                "title: 'Sucursal Morazan'",
              ),
            ),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                "https://www.valleystrong.com/sites/www.valleystrong.com/files/media/tc_front.jpg",
                13.337827,
                -87.850912,
                "Sucursal La Union Centro",
              ),
            ),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                "https://www.valleystrong.com/sites/www.valleystrong.com/files/tulare-back-side.jpg",
                13.331822,
                -87.835770,
                "Sucursal La Union La vida",
              ),
            ),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                "https://www.valleystrong.com/sites/www.valleystrong.com/files/media/admin_-_11500_bolthouse_drive.jpg",
                13.337215,
                -88.441706,
                "Sucursal La Union El Palmo",
              ),
            ),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                "https://www.valleystrong.com/sites/www.valleystrong.com/files/media/ming_south_front.jpg",
                13.339796,
                -88.432986,
                "Sucursal Usulutan Luigi",
              ),
            ),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                "https://www.valleystrong.com/sites/www.valleystrong.com/files/media/delano_front.jpg",
                13.488512,
                -88.168979,
                "Sucursal San Miguel Santa Fe",
              ),
            ),
            SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                "https://maxmoneydeals.com/wp-content/uploads/2021/06/valley-strong-credit-union.jpg",
                13.337215,
                -88.441706,
                "Sucursal Usulutan Centro",
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat, double long, String name) {
    return GestureDetector(
      onTap: () {
        _gotoLocation(lat, long);
      },
      child: Container(
        // ignore: unnecessary_new
        child: new FittedBox(
          child: Material(
            color: Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(24.0),
            shadowColor: Color(0x802196F3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 180,
                  height: 200,
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(24.0),
                    child: Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(_image),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer(name)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _googlemaps(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition:
              CameraPosition(target: LatLng(13.509654, -88.285019), zoom: 9),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: {
            sucursal1,
            sucursal2,
            sucursal3,
            sucursal4,
            sucursal5,
            sucursal6,
            sucursal7,
            sucursal8,
            sucursal9,
            sucursal10
          },
        ));
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(lat, long), zoom: 15, tilt: 50, bearing: 40)));
  }
}

Widget myDetailsContainer(String name) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
            child: Text(
              name,
              style: TextStyle(
                  color: Color(0xff6200ee),
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
          )),
      SizedBox(height: 5.0),
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Text("4.1",
                  style: TextStyle(color: Colors.black54, fontSize: 18.0)),
            ),
            Container(
              child: Icon(
                Icons.star,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                Icons.star,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                Icons.star,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                Icons.star,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
              child: Icon(
                Icons.star_half,
                color: Colors.amber,
                size: 15.0,
              ),
            ),
            Container(
                child: Text(
              "(946)",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            ))
          ],
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Container(
          child: Text("TeLoLlevoSV",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
              ))),
      SizedBox(
        height: 5,
      ),
      Container(
        child: Text("Abierto de 8:30 am a 4:00 pm",
            style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
      )
    ],
  );
}

Marker sucursal1 = Marker(
    markerId: MarkerId('sucursal1'),
    position: LatLng(13.337215, -88.441706),
    infoWindow: InfoWindow(title: 'Sucursal Usulutan'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueGreen,
    ));

Marker sucursal2 = Marker(
    markerId: MarkerId('sucursal2'),
    position: LatLng(13.473357, -88.172305),
    infoWindow: InfoWindow(title: 'Sucursal San Miguel'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueGreen,
    ));

Marker sucursal3 = Marker(
    markerId: MarkerId('sucursal3'),
    position: LatLng(13.477576, -88.193230),
    infoWindow: InfoWindow(title: 'Sucursal San Miguel 2'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueGreen,
    ));

Marker sucursal4 = Marker(
    markerId: MarkerId('sucursal4'),
    position: LatLng(13.692486, -88.103046),
    infoWindow: InfoWindow(title: 'Sucursal Morazan "Centro'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueGreen,
    ));

Marker sucursal5 = Marker(
    markerId: MarkerId('sucursal5'),
    position: LatLng(13.696455, -88.105495),
    infoWindow: InfoWindow(title: 'Sucursal Morazan'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueGreen,
    ));

Marker sucursal6 = Marker(
    markerId: MarkerId('sucursal6'),
    position: LatLng(13.337827, -87.850912),
    infoWindow: InfoWindow(title: 'Sucursal La Union Centro'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueGreen,
    ));

Marker sucursal7 = Marker(
    markerId: MarkerId('sucursal7'),
    position: LatLng(13.331822, -87.835770),
    infoWindow: InfoWindow(title: 'Sucursal La Union La vida'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueGreen,
    ));

Marker sucursal8 = Marker(
    markerId: MarkerId('sucursal8'),
    position: LatLng(13.337215, -88.441706),
    infoWindow: InfoWindow(title: 'Sucursal La Union El Palmo'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueGreen,
    ));

Marker sucursal9 = Marker(
    markerId: MarkerId('sucursal9'),
    position: LatLng(13.339796, -88.432986),
    infoWindow: InfoWindow(title: 'Sucursal Usulutan Luigi'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueGreen,
    ));

Marker sucursal10 = Marker(
    markerId: MarkerId('sucursal10'),
    position: LatLng(13.488512, -88.168979),
    infoWindow: InfoWindow(title: 'Sucursal San Miguel Santa Fe'),
    icon: BitmapDescriptor.defaultMarkerWithHue(
      BitmapDescriptor.hueGreen,
    ));

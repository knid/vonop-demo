import 'package:flutter/material.dart';
import '../../../core/constants/map/map_constants.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

Widget map({required double latitude, required double longitude, double zoom = 8.0, bool ignoreTouch = true, bool enableMark = false}) =>
    IgnorePointer(
      ignoring: ignoreTouch,
      child: FlutterMap(
        options: MapOptions(
          center: LatLng(latitude, longitude),
          zoom: zoom,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: MapSettings.LIGHT_TEMPLATE,
            additionalOptions: {
              //'accessToken': MapSettings.TOKEN,
              //'id': MapSettings.TILESET_ID
            },
            attributionBuilder: (_) {
              return GestureDetector(
                onTap: () async => await launch("https://www.mapbox.com/"),
                child: Text(
                  MapSettings.ATTRIBUTION,
                  style: GoogleFonts.montserrat(),
                ),
              );
            },
          ),
          if (enableMark)
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 0,
                  height: 0,
                  point: LatLng(latitude, longitude),
                  builder: (ctx) => const FaIcon(
                    FontAwesomeIcons.mapMarkerAlt,
                    size: 10,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
        ],
      ),
    );

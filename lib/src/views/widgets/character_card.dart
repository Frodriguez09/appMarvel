import 'package:flutter/material.dart';
import 'package:marvel_app/src/models/personajes_model.dart';

class CharacterCard extends StatelessWidget {
  final CharacterModel hero;
  CharacterCard({
    @required this.hero,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -5.0,
          ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.multiply,
          ),
          image: NetworkImage(hero.images),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, 'detalle', arguments: hero)),
          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Text(
                hero.name,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            alignment: Alignment.center,
          ),
          Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 7),
                      Text('Comics: '),
                      Text(
                        hero.totalComics.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 7),
                      Text('Series: '),
                      Text(
                        hero.totalSeries.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            alignment: Alignment.bottomLeft,
          ),
        ],
      ),
    );
  }
}

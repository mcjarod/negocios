import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Categorias extends StatefulWidget {
  const Categorias({Key? key}) : super(key: key);

  @override
  State<Categorias> createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  int activeIndex=0;
  final urlimages=[
    "images/tienda.jpg",
    "images/farmacia.jpg",
    "images/tienda.jpg",
    "images/farmacia.jpg",
    "images/tienda.jpg",
    "images/farmacia.jpg",
    "images/tienda.jpg",
    "images/farmacia.jpg",
    "images/tienda.jpg",
    "images/farmacia.jpg",
  ];


  @override
  Widget build(BuildContext context) {

    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: urlimages.length,
              itemBuilder: (context,index,realindex){
                final urlimage=urlimages[index];
                return buildImage(urlimage,index);
              },
              options: CarouselOptions(
                // viewportFraction: 1, //para mostrar una sola imagen en pantalla
                enlargeCenterPage: true, //agranda la imagen del medio
                //enlargeStrategy: CenterPageEnlargeStrategy.height, //anima la imagen del medio solo la altura
                height: 150,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 4),
                onPageChanged: (index, reason)=>
                    setState(()=>activeIndex = index),
              ),
            ),
            const SizedBox(height: 10,),//crea un espacio entre las imagenes y los botones
            buildIndicador(), //para crear los botones de transición de las imagenes
          ],
        ),
      );
  }

  Widget buildImage(String urlimage, int index) => GestureDetector(
    onTap: (){
      print(index);
    },
    child: Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      width: 400,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        image: DecorationImage(
          image: AssetImage(urlimage),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );

  Widget buildIndicador() => AnimatedSmoothIndicator(
    effect: JumpingDotEffect(
      dotWidth: 10,
      dotHeight: 10,
      //dotColor: Colors.red //pone color de fondo del indicador
    ),
    activeIndex: activeIndex,
    count: urlimages.length,
  );
}

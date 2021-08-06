class CatalogueItem {
  final int id;
  final String name, desc, colour, img;
  final num price;

  CatalogueItem({required this.id, required this.name, required this.desc, required this.colour, required this.img, required this.price});
}

final List<CatalogueItem> products = [
  CatalogueItem(id: 1, name: 'JioPhone', desc: 'Cheap powerful phone', colour: '#33505a', img: 'https://www.jio.com/1-compact-design.jpg', price: 999)
];
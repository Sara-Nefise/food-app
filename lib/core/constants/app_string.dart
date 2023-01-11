import 'package:foodapp/src/recipe_managment/domain/recipe.dart';
import 'package:foodapp/src/tips/domain/tips.dart';

import '../../src/refrigerator_managment/domain/refrigerator.dart';

List<Refrigerator> refrigeratorList = [
  Refrigerator(
    category: 'Greceries',
    expirationD: '12-10-2023',
    id: 'id123',
    marketName: 'Bim',
    name: 'Tomato',
    purchaseD: '12-01-2023',
    quantity: 2,
    unit: 'kg',
  ),
  Refrigerator(
    category: 'Greceries',
    expirationD: '02-10-2023',
    id: 'id1234',
    marketName: 'Bim',
    name: 'Cucamber',
    purchaseD: '12-01-2023',
    quantity: 3,
    unit: 'kg',
  ),
  Refrigerator(
    category: 'Meat products',
    expirationD: '12-10-2023',
    id: 'id123456',
    marketName: 'A101',
    name: 'Meat',
    purchaseD: '12-04-2023',
    quantity: 3,
    unit: 'kg',
  ),
  Refrigerator(
    category: 'Daily products',
    expirationD: '04-10-2023',
    id: 'id12345',
    marketName: 'Bim',
    name: 'Bardak',
    purchaseD: '12-01-2023',
    quantity: 2,
    unit: 'kg',
  ),
  Refrigerator(
    category: 'Daily products',
    expirationD: '04-10-2023',
    id: 'id12345',
    marketName: 'Bim',
    name: 'Bardak',
    purchaseD: '12-01-2023',
    quantity: 2,
    unit: 'kg',
  ),
  Refrigerator(
    category: 'Daily products',
    expirationD: '04-10-2023',
    id: 'id12345',
    marketName: 'Bim',
    name: 'Bardak',
    purchaseD: '12-01-2023',
    quantity: 2,
    unit: 'kg',
  ),
  Refrigerator(
    category: 'Daily products',
    expirationD: '04-10-2023',
    id: 'id12345',
    marketName: 'Bim',
    name: 'Bardak',
    purchaseD: '12-01-2023',
    quantity: 2,
    unit: 'kg',
  ),
  Refrigerator(
    category: 'Daily products',
    expirationD: '04-10-2023',
    id: 'id12345',
    marketName: 'Bim',
    name: 'Bardak',
    purchaseD: '12-01-2023',
    quantity: 2,
    unit: 'kg',
  ),
];
List<Recipe> recipes = [
  Recipe(
      image: '',
      id: 'id12',
      category: 'Pastries',
      name: 'Caesar Salad',
      details:
          'A Caesar salad is a green salad of romaine lettuce and croutons dressed with lemon juice, olive oil, egg, Worcestershire sauce, anchovies, garlic, Dijon mustard, Parmesan cheese, and black pepper. In its original form, this salad was prepared and served',
      ingredients: [
        'Tomato',
        'Corn',
        'Pepper',
      ]),
  Recipe(
      image: '',
      id: 'id12',
      category: 'Pastries',
      name: 'Caesar Salad',
      details:
          'A Caesar salad is a green salad of romaine lettuce and croutons dressed with lemon juice, olive oil, egg, Worcestershire sauce, anchovies, garlic, Dijon mustard, Parmesan cheese, and black pepper. In its original form, this salad was prepared and served',
      ingredients: [
        'Tomato',
        'Corn',
        'Pepper',
      ]),
  Recipe(
      image: '',
      id: 'id12',
      category: 'Soups',
      name: 'maet soup',
      details:
          'A Caesar salad is a green salad of romaine lettuce and croutons dressed with lemon juice, olive oil, egg, Worcestershire sauce, anchovies, garlic, Dijon mustard, Parmesan cheese, and black pepper. In its original form, this salad was prepared and served',
      ingredients: [
        'Tomato',
        'Corn',
        'Pepper',
      ]),
  Recipe(
      image: '',
      id: 'id12',
      category: 'Grills',
      name: 'Meat',
      details:
          'A Caesar salad is a green salad of romaine lettuce and croutons dressed with lemon juice, olive oil, egg, Worcestershire sauce, anchovies, garlic, Dijon mustard, Parmesan cheese, and black pepper. In its original form, this salad was prepared and served',
      ingredients: [
        'meat',
        'Pepper',
      ]),
];
List<Tips> tips = [
  Tips(
      id: '1',
      name: 'Tomatoe',
      detail:
          'Levy recommends storing ripe tomatoes upside down (stem-side down) on paper towels in an open container such as Tupperware, a shoe box, or a cardboard flat.',
      category: 'Groceries'),
  Tips(
      id: '1',
      name: 'Potato',
      detail:
          'As a rule of thumb, the best place to store potatoes is in a cool, dry area of your kitchen, with good ventilation and out of direct sunlight. A kitchen cupboard or closet, even the basement or garage, can all the good choices.',
      category: 'Groceries')
];

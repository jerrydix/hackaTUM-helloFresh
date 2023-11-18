import { Prisma } from "#/index";
import Decimal = Prisma.Decimal;

export default [
  {
    title: 'Fried Eggs',
    imgUrl: 'url_to_image_of_fried_eggs.jpg',
    description: 'Simple and classic fried eggs.',
    instructions: [
      'Heat the Pan: Place a non-stick skillet on the stove over medium heat.',
      'Add Oil or Butter: Once the pan is warm, add a teaspoon of oil or butter to coat the bottom of the pan.',
      'Crack the Egg: Crack an egg into a small bowl.',
      'Cook the Egg: Gently slide the egg from the bowl into the pan.',
      'Season the Egg: Sprinkle a pinch of salt and pepper over the egg.',
      'Fry the Egg: Allow the egg to cook until the whites are set but the yolk is still runny, about 3-4 minutes.',
      'Serve: Carefully slide the egg onto a plate and serve immediately.'
    ].join('\n'),
    caloriesPerUnit: 92,
    proteinsPerUnit: 6.27,
    carbsPerUnit: 0.4,
    fatsPerUnit: 7.04,
    fiberPerUnit: 0,
    vitamins: {
      A: 91,
    },
    minerals: {
      Calcium: 27,
      Iron: 0.91,
      Potassium: 68,
    },
    allergyBits: Buffer.from([0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0]),
    ingredients: {
      create: [
        { ingredientType: 'egg', quantity: 2, unit: 'piece', price: new Decimal(0.6), },
        { ingredientType: 'salt', quantity: 5, unit: 'gram', price: new Decimal(0.01) },
        { ingredientType: 'pepper', quantity: 5, unit: 'gram', price: new Decimal(0.01) }
      ],
    },
  },
  {
    title: 'Grilled Chicken Salad',
    imgUrl: 'url_to_image_of_grilled_chicken_salad.jpg',
    description: 'A healthy mix of grilled chicken, fresh vegetables, and a light dressing.',
    instructions: [
      'Prepare the Chicken: Season the chicken breasts with salt, pepper, and a bit of olive oil.',
      'Grill the Chicken: Preheat the grill or a grill pan over medium-high heat and grill the chicken for about 6-7 minutes per side, until fully cooked.',
      'Rest the Chicken: Let the chicken rest for a few minutes, then slice it into strips.',
      'Wash the Vegetables: Rinse the lettuce, tomatoes, and cucumber under cold water.',
      'Chop the Vegetables: Chop the lettuce, slice the tomatoes and cucumber.',
      'Make the Dressing: In a small bowl, whisk together olive oil and vinegar, add salt and pepper to taste.',
      'Toss the Salad: In a large bowl, combine the lettuce, tomatoes, cucumber, and grilled chicken.',
      'Dress the Salad: Drizzle the dressing over the salad and toss gently to coat.',
      'Serve: Serve the salad fresh, optionally garnished with herbs or croutons.'
    ].join('\n'),
    caloriesPerUnit: 318,
    proteinsPerUnit: 34.81,
    carbsPerUnit: 17.55,
    fatsPerUnit: 11.86,
    fiberPerUnit: 3,
    vitamins: {
      A: 119,
      C: 13.8
    },
    minerals: {
      Calcium: 30,
      Iron: 2.12,
      Potassium: 599,
    },
    allergyBits: Buffer.from([/* appropriate allergy bits */]),
    ingredients: {
      create: [
        { ingredientType: 'chicken breast', quantity: 200, unit: 'gram', price: new Decimal(0.8) },
        { ingredientType: 'lettuce', quantity: 100, unit: 'gram', price: new Decimal(0.5) },
        { ingredientType: 'tomato', quantity: 50, unit: 'gram', price: new Decimal(0.2) },
        { ingredientType: 'cucumber', quantity: 50, unit: 'gram', price: new Decimal(0.4) },
        { ingredientType: 'olive oil', quantity: 10, unit: 'milliliter', price: new Decimal(0.02) },
        { ingredientType: 'vinegar', quantity: 5, unit: 'milliliter', price: new Decimal(0.01) },
        { ingredientType: 'salt', quantity: 5, unit: 'gram', price: new Decimal(0.01) },
        { ingredientType: 'pepper', quantity: 5, unit: 'gram', price: new Decimal(0.01) }
      ]
    }
  }
];

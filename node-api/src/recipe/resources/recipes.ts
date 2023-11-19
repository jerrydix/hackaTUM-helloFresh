import { $Enums, Prisma } from "#/index";
import Decimal = Prisma.Decimal;
import Difficulty = $Enums.Difficulty;

// noinspection SpellCheckingInspection
export default [
  {
    title: 'Colorfully Filled Wrap with Falafel Balls',
    imgUrl:
      'https://img.hellofresh.com/c_fill,f_auto,fl_lossy,h_531,q_auto,w_944/hellofresh_s3/image/bunt-gefullter-wrap-mit-falafelballchen-7663096a-503717b5.jpg',
    duration: 50,
    difficulty: Difficulty.MEDIUM,
    description:
      'A wholesome and vibrant wrap filled with crispy falafel balls, fresh vegetables, and a tangy yogurt sauce.',
    instructions: [
      'Prepare Falafel Balls: Blend chickpeas, garlic, parsley, cumin, and coriander in a food processor. Form mixture into balls and fry until golden.',
      'Prepare Vegetables: Slice lettuce, red bell pepper, cucumber, and red onion.',
      'Make Yogurt Sauce: Combine Greek yogurt, tahini, lemon juice, salt, and pepper.',
      'Assemble Wrap: Lay out the whole wheat wrap, add falafel balls, vegetables, and drizzle with yogurt sauce. Roll up the wrap.',
    ].join('\n'),
    caloriesPerUnit: 450,
    proteinsPerUnit: 18,
    carbsPerUnit: 56,
    fatsPerUnit: 18,
    fiberPerUnit: 9,
    vitamins: {
      A: '20% of RDA',
      C: '35% of RDA',
    },
    minerals: {
      Calcium: '15% of RDA',
      Iron: '20% of RDA',
    },
    allergyBits: 0,
    ingredients: {
      create: [
        {
          ingredientType: 'chickpea',
          quantity: 200,
          unit: 'gram',
          price: new Decimal(1.0),
        },
        {
          ingredientType: 'whole wheat wrap',
          quantity: 1,
          unit: 'piece',
          price: new Decimal(0.5),
        },
        {
          ingredientType: 'lettuce',
          quantity: 50,
          unit: 'gram',
          price: new Decimal(0.3),
        },
        {
          ingredientType: 'red bell pepper',
          quantity: 50,
          unit: 'gram',
          price: new Decimal(0.4),
        },
        {
          ingredientType: 'cucumber',
          quantity: 50,
          unit: 'gram',
          price: new Decimal(0.3),
        },
        {
          ingredientType: 'red onion',
          quantity: 30,
          unit: 'gram',
          price: new Decimal(0.2),
        },
        {
          ingredientType: 'greek yogurt',
          quantity: 30,
          unit: 'gram',
          price: new Decimal(0.4),
        },
        {
          ingredientType: 'tahini',
          quantity: 10,
          unit: 'gram',
          price: new Decimal(0.5),
        },
        {
          ingredientType: 'lemon juice',
          quantity: 5,
          unit: 'ml',
          price: new Decimal(0.1),
        },
        {
          ingredientType: 'garlic',
          quantity: 5,
          unit: 'gram',
          price: new Decimal(0.1),
        },
        {
          ingredientType: 'cumin',
          quantity: 1,
          unit: 'gram',
          price: new Decimal(0.1),
        },
        {
          ingredientType: 'coriander',
          quantity: 1,
          unit: 'gram',
          price: new Decimal(0.1),
        },
        {
          ingredientType: 'parsley',
          quantity: 5,
          unit: 'gram',
          price: new Decimal(0.2),
        },
        {
          ingredientType: 'olive oil',
          quantity: 15,
          unit: 'ml',
          price: new Decimal(0.2),
        },
        {
          ingredientType: 'salt',
          quantity: 1,
          unit: 'gram',
          price: new Decimal(0.01),
        },
        {
          ingredientType: 'pepper',
          quantity: 1,
          unit: 'gram',
          price: new Decimal(0.02),
        },
      ],
    },
    utensils: {
      connect: [
        { name: 'mixing bowl' },
        { name: 'frying pan' },
        { name: 'knife' },
        { name: 'cutting board' },
        { name: 'food processor' },
      ],
    },
  },
  {
    title: 'Rigatoni in Spicy Vegetable Sauce & Kalamata Olives',
    imgUrl:
      'https://img.hellofresh.com/c_fill,f_auto,fl_lossy,h_531,q_auto,w_944/hellofresh_s3/image/rigatoni-in-pikanter-gemusesauce-kalamata-oliven-81e4fabd-01be3b70.jpg',
    duration: 25,
    difficulty: Difficulty.EASY,
    description:
      'Hearty rigatoni pasta in a rich, spicy vegetable sauce, complemented with the distinctive flavor of Kalamata olives.',
    instructions: [
      'Cook Pasta: Boil rigatoni until al dente, then drain.',
      'Prepare Sauce: Sauté garlic, onion, bell pepper, zucchini, and eggplant in olive oil. Add tomatoes, basil, oregano, chili flakes, salt, and pepper.',
      'Combine: Mix the cooked pasta with the vegetable sauce.',
      'Serve: Garnish with Kalamata olives and grated Parmesan cheese.',
    ].join('\n'),
    caloriesPerUnit: 600,
    proteinsPerUnit: 20,
    carbsPerUnit: 85,
    fatsPerUnit: 20,
    fiberPerUnit: 12,
    vitamins: {
      A: '25% of RDA',
      C: '40% of RDA',
    },
    minerals: {
      Calcium: '20% of RDA',
      Iron: '25% of RDA',
    },
    allergyBits: 0,
    ingredients: {
      create: [
        {
          ingredientType: 'rigatoni pasta',
          quantity: 200,
          unit: 'gram',
          price: new Decimal(1.5),
        },
        {
          ingredientType: 'tomato',
          quantity: 100,
          unit: 'gram',
          price: new Decimal(0.6),
        },
        {
          ingredientType: 'bell pepper',
          quantity: 50,
          unit: 'gram',
          price: new Decimal(0.5),
        },
        {
          ingredientType: 'zucchini',
          quantity: 50,
          unit: 'gram',
          price: new Decimal(0.4),
        },
        {
          ingredientType: 'eggplant',
          quantity: 50,
          unit: 'gram',
          price: new Decimal(0.4),
        },
        {
          ingredientType: 'garlic',
          quantity: 5,
          unit: 'gram',
          price: new Decimal(0.1),
        },
        {
          ingredientType: 'onion',
          quantity: 50,
          unit: 'gram',
          price: new Decimal(0.2),
        },
        {
          ingredientType: 'olive oil',
          quantity: 15,
          unit: 'ml',
          price: new Decimal(0.2),
        },
        {
          ingredientType: 'basil',
          quantity: 5,
          unit: 'gram',
          price: new Decimal(0.2),
        },
        {
          ingredientType: 'oregano',
          quantity: 1,
          unit: 'gram',
          price: new Decimal(0.05),
        },
        {
          ingredientType: 'chili flakes',
          quantity: 1,
          unit: 'gram',
          price: new Decimal(0.05),
        },
        {
          ingredientType: 'salt',
          quantity: 1,
          unit: 'gram',
          price: new Decimal(0.01),
        },
        {
          ingredientType: 'pepper',
          quantity: 1,
          unit: 'gram',
          price: new Decimal(0.02),
        },
        {
          ingredientType: 'kalamata olives',
          quantity: 30,
          unit: 'gram',
          price: new Decimal(0.7),
        },
        {
          ingredientType: 'parmesan cheese',
          quantity: 20,
          unit: 'gram',
          price: new Decimal(0.8),
        },
      ],
    },
    utensils: {
      connect: [
        { name: 'large pot' },
        { name: 'frying pan' },
        { name: 'colander' },
        { name: 'knife' },
        { name: 'cutting board' },
        { name: 'cheese grater' },
      ],
    },
  },
  {
    title: "Tikka Masala Curry with Sweet Potato",
    imgUrl: "https://img.hellofresh.com/c_fill,f_auto,fl_lossy,h_531,q_auto,w_944/hellofresh_s3/image/tikka-masala-curry-80b817d9-97a11a1e.jpg",
    duration: 90,
    difficulty: Difficulty.HARD,
    description: "A flavorful Tikka Masala Curry featuring tender sweet potatoes and chicken, infused with a blend of aromatic spices.",
    instructions: [
      "Prepare Ingredients: Dice sweet potatoes, chop onions, and mince garlic and ginger.",
      "Cook Chicken: In a pan, cook chicken until browned. Set aside.",
      "Make Curry: In the same pan, sauté onions, garlic, and ginger. Add sweet potatoes, spices, and tomato. Cook until the sweet potatoes are tender.",
      "Combine: Add chicken back to the pan with Greek yogurt. Simmer until everything is well combined.",
      "Serve: Garnish with cilantro and serve over basmati rice."
    ].join('\n'),
    caloriesPerUnit: 550,
    proteinsPerUnit: 30,
    carbsPerUnit: 65,
    fatsPerUnit: 20,
    fiberPerUnit: 8,
    vitamins: {
      A: "30% of RDA",
      C: "50% of RDA"
    },
    minerals: {
      Calcium: "15% of RDA",
      Iron: "20% of RDA"
    },
    allergyBits: 0,
    ingredients: {
      create: [
        { ingredientType: "chicken breast", quantity: 200, unit: "gram", price: new Decimal(3.0) },
        { ingredientType: "sweet potato", quantity: 200, unit: "gram", price: new Decimal(1.0) },
        { ingredientType: "onion", quantity: 100, unit: "gram", price: new Decimal(0.5) },
        { ingredientType: "garlic", quantity: 5, unit: "gram", price: new Decimal(0.2) },
        { ingredientType: "ginger", quantity: 5, unit: "gram", price: new Decimal(0.2) },
        { ingredientType: "tomato", quantity: 100, unit: "gram", price: new Decimal(0.6) },
        { ingredientType: "greek yogurt", quantity: 50, unit: "gram", price: new Decimal(0.5) },
        { ingredientType: "basmati rice", quantity: 100, unit: "gram", price: new Decimal(1.2) },
        { ingredientType: "cumin", quantity: 1, unit: "gram", price: new Decimal(0.1) },
        { ingredientType: "coriander", quantity: 1, unit: "gram", price: new Decimal(0.1) },
        { ingredientType: "turmeric", quantity: 1, unit: "gram", price: new Decimal(0.1) },
        { ingredientType: "garam masala", quantity: 1, unit: "gram", price: new Decimal(0.2) },
        { ingredientType: "paprika", quantity: 1, unit: "gram", price: new Decimal(0.1) },
        { ingredientType: "cilantro", quantity: 10, unit: "gram", price: new Decimal(0.3) },
        { ingredientType: "vegetable oil", quantity: 15, unit: "ml", price: new Decimal(0.1) },
        { ingredientType: "salt", quantity: 1, unit: "gram", price: new Decimal(0.01) },
        { ingredientType: "pepper", quantity: 1, unit: "gram", price: new Decimal(0.02) }
      ]
    },
    utensils: {
      connect: [
        { name: "large pot" },
        { name: "frying pan" },
        { name: "knife" },
        { name: "cutting board" },
        { name: "measuring spoons" },
        { name: "spatula" }
      ]
    }
  },
  {
    title: "Breaded Portobello with Sweet Chili Ketchup",
    imgUrl: "https://img.hellofresh.com/c_fill,f_auto,fl_lossy,h_531,q_auto,w_944/hellofresh_s3/image/HF_Y23_R25_W31_DE_R3649-7_Main__3_low-c01d9208.jpg",
    duration: 15,
    difficulty: Difficulty.MEDIUM,
    description: "A succulent, breaded Portobello mushroom paired with a tangy sweet chili ketchup, creating a delightful blend of flavors and textures.",
    instructions: [
      "Prepare Portobello: Clean and stem the Portobello mushroom.",
      "Breading: Dip the mushroom first in flour, then beaten egg, and finally breadcrumbs mixed with paprika and garlic powder.",
      "Fry Mushroom: Heat vegetable oil in a pan and fry the breaded mushroom until golden and crispy.",
      "Make Sweet Chili Ketchup: Mix sweet chili sauce with ketchup.",
      "Serve: Place the fried Portobello on a plate and serve with the sweet chili ketchup."
    ].join('\n'),
    caloriesPerUnit: 350,
    proteinsPerUnit: 10,
    carbsPerUnit: 45,
    fatsPerUnit: 15,
    fiberPerUnit: 5,
    vitamins: {
      A: "10% of RDA",
      C: "5% of RDA"
    },
    minerals: {
      Calcium: "5% of RDA",
      Iron: "10% of RDA"
    },
    allergyBits: 0,
    ingredients: {
      create: [
        { ingredientType: "portobello mushroom", quantity: 1, unit: "piece", price: new Decimal(1.0) },
        { ingredientType: "egg", quantity: 1, unit: "piece", price: new Decimal(0.3) },
        { ingredientType: "breadcrumbs", quantity: 50, unit: "gram", price: new Decimal(0.5) },
        { ingredientType: "paprika", quantity: 1, unit: "gram", price: new Decimal(0.1) },
        { ingredientType: "garlic powder", quantity: 1, unit: "gram", price: new Decimal(0.1) },
        { ingredientType: "flour", quantity: 30, unit: "gram", price: new Decimal(0.1) },
        { ingredientType: "vegetable oil", quantity: 30, unit: "ml", price: new Decimal(0.2) },
        { ingredientType: "sweet chili sauce", quantity: 30, unit: "ml", price: new Decimal(0.5) },
        { ingredientType: "ketchup", quantity: 30, unit: "ml", price: new Decimal(0.3) },
        { ingredientType: "salt", quantity: 1, unit: "gram", price: new Decimal(0.01) },
        { ingredientType: "pepper", quantity: 1, unit: "gram", price: new Decimal(0.02) }
      ]
    },
    utensils: {
      connect: [
        { name: "frying pan" },
        { name: "shallow dishes" },
        { name: "knife" },
        { name: "cutting board" },
        { name: "whisk" },
        { name: "tongs" }
      ]
    }
  },
  {
    title: "Stir Fry! Pan Vegetables with Peanut-Chili Sauce",
    imgUrl: "https://img.hellofresh.com/c_fill,f_auto,fl_lossy,h_531,q_auto,w_944/hellofresh_s3/image/stir-fry-bratpfannengemuse-mit-erdnuss-peperoncini-sauce-c186ce6e-f141eb2b.jpg",
    duration: 40,
    difficulty: Difficulty.MEDIUM,
    description: "A vibrant and flavorful stir-fry featuring fresh vegetables and a rich peanut-chili sauce.",
    instructions: [
      "Prepare Vegetables: Chop broccoli, bell pepper, carrot, and snap peas.",
      "Cook Vegetables: In a wok, heat vegetable oil and stir-fry the vegetables until tender.",
      "Make Peanut-Chili Sauce: Whisk together peanut butter, soy sauce, honey, chili flakes, garlic, and a bit of water.",
      "Combine: Toss the cooked vegetables with the peanut-chili sauce.",
      "Serve: Drizzle sesame oil over the top and serve."
    ].join('\n'),
    caloriesPerUnit: 400,
    proteinsPerUnit: 12,
    carbsPerUnit: 35,
    fatsPerUnit: 22,
    fiberPerUnit: 6,
    vitamins: {
      A: "35% of RDA",
      C: "60% of RDA"
    },
    minerals: {
      Calcium: "10% of RDA",
      Iron: "15% of RDA"
    },
    allergyBits: 0,
    ingredients: {
      create: [
        { ingredientType: "broccoli", quantity: 100, unit: "gram", price: new Decimal(1.0) },
        { ingredientType: "bell pepper", quantity: 100, unit: "gram", price: new Decimal(0.7) },
        { ingredientType: "carrot", quantity: 50, unit: "gram", price: new Decimal(0.3) },
        { ingredientType: "snap peas", quantity: 50, unit: "gram", price: new Decimal(0.5) },
        { ingredientType: "peanut butter", quantity: 30, unit: "gram", price: new Decimal(0.4) },
        { ingredientType: "soy sauce", quantity: 15, unit: "ml", price: new Decimal(0.2) },
        { ingredientType: "honey", quantity: 10, unit: "gram", price: new Decimal(0.2) },
        { ingredientType: "chili flakes", quantity: 1, unit: "gram", price: new Decimal(0.05) },
        { ingredientType: "garlic", quantity: 5, unit: "gram", price: new Decimal(0.1) },
        { ingredientType: "sesame oil", quantity: 5, unit: "ml", price: new Decimal(0.2) },
        { ingredientType: "vegetable oil", quantity: 15, unit: "ml", price: new Decimal(0.1) },
        { ingredientType: "salt", quantity: 1, unit: "gram", price: new Decimal(0.01) },
        { ingredientType: "pepper", quantity: 1, unit: "gram", price: new Decimal(0.02) }
      ]
    },
    utensils: {
      connect: [
        { name: "wok" },
        { name: "knife" },
        { name: "cutting board" },
        { name: "mixing bowl" },
        { name: "whisk" }
      ]
    }
  },
  {
    title: "Loaded Smashed Potatoes",
    imgUrl: "https://img.hellofresh.com/c_fill,f_auto,fl_lossy,h_531,q_auto,w_944/hellofresh_s3/image/loaded-smashed-potatoes-1a652803-6bbca072.jpg",
    description: "Crispy smashed potatoes topped with melted cheese, crispy bacon bits, and fresh chives for a savory and indulgent treat.",
    instructions: [
      "Boil Potatoes: Boil potatoes until tender, then drain.",
      "Smash and Bake: Place potatoes on a baking sheet, gently smash, drizzle with olive oil, salt, and pepper, and bake until crispy.",
      "Add Toppings: Sprinkle with cheddar cheese and bacon, then bake until cheese melts.",
      "Garnish: Top with fresh chives and serve."
    ].join('\n'),
    duration: 16,
    difficulty: Difficulty.EASY,
    caloriesPerUnit: 350,
    proteinsPerUnit: 15,
    carbsPerUnit: 30,
    fatsPerUnit: 18,
    fiberPerUnit: 3,
    vitamins: {
      A: "10% of RDA",
      C: "15% of RDA"
    },
    minerals: {
      Calcium: "10% of RDA",
      Iron: "8% of RDA"
    },
    allergyBits: 0,
    ingredients: {
      create: [
        { ingredientType: "potato", quantity: 500, unit: "gram", price: new Decimal(1.0) },
        { ingredientType: "cheddar cheese", quantity: 50, unit: "gram", price: new Decimal(0.7) },
        { ingredientType: "bacon", quantity: 30, unit: "gram", price: new Decimal(0.8) },
        { ingredientType: "chives", quantity: 10, unit: "gram", price: new Decimal(0.3) },
        { ingredientType: "olive oil", quantity: 20, unit: "ml", price: new Decimal(0.2) },
        { ingredientType: "salt", quantity: 1, unit: "gram", price: new Decimal(0.01) },
        { ingredientType: "pepper", quantity: 1, unit: "gram", price: new Decimal(0.02) }
      ]
    },
    utensils: {
      connect: [
        { name: "oven" },
        { name: "baking sheet" },
        { name: "potato masher" },
        { name: "knife" },
        { name: "cutting board" }
      ]
    }
  },
  {
    title: "Conchiglie in Vegetable Fresh Cream Sauce",
    imgUrl: "https://img.hellofresh.com/c_fill,f_auto,fl_lossy,h_531,q_auto,w_944/hellofresh_s3/image/HF_Y23_R27_W47_DE_EXP3493-6_Main__2low-9d3fc97c.jpg",
    description: "Conchiglie pasta tossed in a light and creamy vegetable sauce, featuring fresh zucchini, carrot, and bell pepper.",
    instructions: [
      "Cook Pasta: Boil conchiglie pasta until al dente, then drain.",
      "Prepare Vegetables: Slice zucchini, carrot, and bell pepper.",
      "Make Sauce: In a pan, cook vegetables, then add flour and heavy cream to form a creamy sauce.",
      "Combine: Toss the cooked pasta with the vegetable cream sauce.",
      "Serve: Garnish with grated Parmesan cheese and fresh basil."
    ].join('\n'),
    duration: 45,
    difficulty: Difficulty.MEDIUM,
    caloriesPerUnit: 480,
    proteinsPerUnit: 15,
    carbsPerUnit: 65,
    fatsPerUnit: 20,
    fiberPerUnit: 4,
    vitamins: {
      A: "25% of RDA",
      C: "30% of RDA"
    },
    minerals: {
      Calcium: "15% of RDA",
      Iron: "10% of RDA"
    },
    allergyBits: 0,
    ingredients: {
      create: [
        { ingredientType: "conchiglie pasta", quantity: 200, unit: "gram", price: new Decimal(1.2) },
        { ingredientType: "zucchini", quantity: 100, unit: "gram", price: new Decimal(0.7) },
        { ingredientType: "carrot", quantity: 50, unit: "gram", price: new Decimal(0.3) },
        { ingredientType: "bell pepper", quantity: 50, unit: "gram", price: new Decimal(0.5) },
        { ingredientType: "heavy cream", quantity: 100, unit: "ml", price: new Decimal(0.8) },
        { ingredientType: "parmesan cheese", quantity: 30, unit: "gram", price: new Decimal(1.0) },
        { ingredientType: "basil", quantity: 5, unit: "gram", price: new Decimal(0.2) },
        { ingredientType: "flour", quantity: 15, unit: "gram", price: new Decimal(0.1) },
        { ingredientType: "olive oil", quantity: 10, unit: "ml", price: new Decimal(0.1) },
        { ingredientType: "salt", quantity: 1, unit: "gram", price: new Decimal(0.01) },
        { ingredientType: "pepper", quantity: 1, unit: "gram", price: new Decimal(0.02) }
      ]
    },
    utensils: {
      connect: [
        { name: "pot" },
        { name: "frying pan" },
        { name: "colander" },
        { name: "whisk" },
        { name: "knife" },
        { name: "cutting board" }
      ]
    }
  },
  {
    title: "Winter Potato Pan with Cauliflower",
    imgUrl: "https://img.hellofresh.com/c_fill,f_auto,fl_lossy,h_531,q_auto,w_944/hellofresh_s3/image/HF_Y23_R29_W47_DE_EXP4283-2_Main__5low-1fd25d6f.jpg",
    description: "A hearty and comforting winter dish featuring a savory blend of potatoes, cauliflower, and carrots, seasoned with rosemary and thyme.",
    instructions: [
      "Prepare Vegetables: Chop potatoes, cauliflower, carrots, and onions.",
      "Cook Vegetables: In a large pan, heat olive oil and butter, add all vegetables, and cook until tender.",
      "Season: Add rosemary, thyme, salt, and pepper, and stir well.",
      "Serve: Serve hot, garnished with fresh herbs if desired."
    ].join('\n'),
    duration: 40,
    difficulty: Difficulty.EASY,
    caloriesPerUnit: 300,
    proteinsPerUnit: 8,
    carbsPerUnit: 45,
    fatsPerUnit: 10,
    fiberPerUnit: 7,
    vitamins: {
      A: "20% of RDA",
      C: "70% of RDA"
    },
    minerals: {
      Calcium: "6% of RDA",
      Iron: "12% of RDA"
    },
    allergyBits: 0,
    ingredients: {
      create: [
        { ingredientType: "potato", quantity: 200, unit: "gram", price: new Decimal(0.8) },
        { ingredientType: "cauliflower", quantity: 200, unit: "gram", price: new Decimal(1.0) },
        { ingredientType: "carrot", quantity: 100, unit: "gram", price: new Decimal(0.5) },
        { ingredientType: "onion", quantity: 50, unit: "gram", price: new Decimal(0.2) },
        { ingredientType: "butter", quantity: 20, unit: "gram", price: new Decimal(0.3) },
        { ingredientType: "rosemary", quantity: 2, unit: "gram", price: new Decimal(0.1) },
        { ingredientType: "thyme", quantity: 2, unit: "gram", price: new Decimal(0.1) },
        { ingredientType: "olive oil", quantity: 10, unit: "ml", price: new Decimal(0.1) },
        { ingredientType: "salt", quantity: 1, unit: "gram", price: new Decimal(0.01) },
        { ingredientType: "pepper", quantity: 1, unit: "gram", price: new Decimal(0.02) }
      ]
    },
    utensils: {
      connect: [
        { name: "wok" },
        { name: "knife" },
        { name: "cutting board" },
        { name: "pot" }
      ]
    }
  },
  {
    title: "Warm Potato Salad with Mozzarella, Baby Spinach, and Pumpkin Seed Oil",
    imgUrl: "https://img.hellofresh.com/c_fill,f_auto,fl_lossy,h_531,q_auto,w_944/hellofresh_s3/image/warmer-kartoffelsalat-mit-mozzarella-und-kurbiskernol-thermomix-55f46985-11a2b356.jpg",
    description: "A delightful warm potato salad with soft mozzarella, fresh baby spinach, and a drizzle of rich pumpkin seed oil.",
    instructions: [
      "Boil Potatoes: Cook potatoes until tender, then slice them.",
      "Assemble Salad: In a salad bowl, combine sliced potatoes, baby spinach, and mozzarella.",
      "Dress and Season: Drizzle with pumpkin seed oil, olive oil, vinegar, salt, and pepper.",
      "Serve: Toss gently and serve warm."
    ].join('\n'),
    duration: 30,
    difficulty: Difficulty.EASY,
    caloriesPerUnit: 320,
    proteinsPerUnit: 12,
    carbsPerUnit: 38,
    fatsPerUnit: 14,
    fiberPerUnit: 4,
    vitamins: {
      A: "15% of RDA",
      C: "25% of RDA"
    },
    minerals: {
      Calcium: "10% of RDA",
      Iron: "8% of RDA"
    },
    allergyBits: 0,
    ingredients: {
      create: [
        { ingredientType: "potato", quantity: 300, unit: "gram", price: new Decimal(1.0) },
        { ingredientType: "mozzarella", quantity: 100, unit: "gram", price: new Decimal(1.2) },
        { ingredientType: "baby spinach", quantity: 50, unit: "gram", price: new Decimal(0.8) },
        { ingredientType: "pumpkin seed oil", quantity: 10, unit: "ml", price: new Decimal(0.7) },
        { ingredientType: "olive oil", quantity: 10, unit: "ml", price: new Decimal(0.1) },
        { ingredientType: "vinegar", quantity: 5, unit: "ml", price: new Decimal(0.05) },
        { ingredientType: "salt", quantity: 1, unit: "gram", price: new Decimal(0.01) },
        { ingredientType: "pepper", quantity: 1, unit: "gram", price: new Decimal(0.02) },
        { ingredientType: "pumpkin seed", quantity: 10, unit: "gram", price: new Decimal(0.5) }
      ]
    },
    utensils: {
      connect: [
        { name: "pot" },
        { name: "salad bowl" },
        { name: "knife" },
        { name: "cutting board" }
      ]
    }
  },
  {
    title: "Spaghetti with Bell Pepper Cream Sauce & Pine Nuts",
    imgUrl: "https://img.hellofresh.com/c_fill,f_auto,fl_lossy,h_531,q_auto,w_944/hellofresh_s3/image/spaghetti-mit-peperonicremesauce-thermomix-7a1ae671-a63c81e5.jpg",
    description: "A luscious spaghetti dish featuring a smooth bell pepper cream sauce, topped with toasted pine nuts.",
    instructions: [
      "Cook Spaghetti: Boil spaghetti until al dente, then drain.",
      "Prepare Sauce: Sauté onion and garlic, add bell pepper, and cook until soft. Blend with heavy cream to create a creamy sauce.",
      "Toast Pine Nuts: In a dry pan, lightly toast pine nuts until golden.",
      "Combine: Toss the cooked spaghetti with the bell pepper cream sauce.",
      "Serve: Top with toasted pine nuts and fresh basil."
    ].join('\n'),
    duration: 30,
    difficulty: Difficulty.MEDIUM,
    caloriesPerUnit: 520,
    proteinsPerUnit: 15,
    carbsPerUnit: 70,
    fatsPerUnit: 22,
    fiberPerUnit: 6,
    vitamins: {
      A: "20% of RDA",
      C: "50% of RDA"
    },
    minerals: {
      Calcium: "8% of RDA",
      Iron: "15% of RDA"
    },
    allergyBits: 0,
    ingredients: {
      create: [
        { ingredientType: "spaghetti", quantity: 200, unit: "gram", price: new Decimal(1.2) },
        { ingredientType: "bell pepper", quantity: 150, unit: "gram", price: new Decimal(1.0) },
        { ingredientType: "onion", quantity: 50, unit: "gram", price: new Decimal(0.2) },
        { ingredientType: "garlic", quantity: 5, unit: "gram", price: new Decimal(0.1) },
        { ingredientType: "heavy cream", quantity: 100, unit: "ml", price: new Decimal(0.9) },
        { ingredientType: "pine nut", quantity: 20, unit: "gram", price: new Decimal(1.5) },
        { ingredientType: "basil", quantity: 5, unit: "gram", price: new Decimal(0.2) },
        { ingredientType: "olive oil", quantity: 10, unit: "ml", price: new Decimal(0.1) },
        { ingredientType: "salt", quantity: 1, unit: "gram", price: new Decimal(0.01) },
        { ingredientType: "pepper", quantity: 1, unit: "gram", price: new Decimal(0.02) }
      ]
    },
    utensils: {
      connect: [
        { name: "pot" },
        { name: "frying pan" },
        { name: "blender" },
        { name: "colander" },
        { name: "knife" },
        { name: "cutting board" }
      ]
    }
  },
  {
    title: "Quick Lentil Pan with Camembert",
    imgUrl: "https://img.hellofresh.com/c_fill,f_auto,fl_lossy,h_531,q_auto,w_944/hellofresh_s3/image/HF_Y23_A_R04_W44_DE_L4855-1_Main_low-310f1478.jpg",
    description: "A warm and satisfying lentil dish enriched with creamy Camembert, complemented by aromatic onions, garlic, and tomatoes.",
    instructions: [
      "Prepare Ingredients: Dice onions and tomatoes, mince garlic.",
      "Cook Lentils: In a pan, cook lentils with onions and garlic until lentils are tender.",
      "Add Camembert: Stir in slices of Camembert until melted and combined.",
      "Serve: Garnish with thyme, salt, and pepper."
    ].join('\n'),
    duration: 25,
    difficulty: Difficulty.EASY,
    caloriesPerUnit: 420,
    proteinsPerUnit: 18,
    carbsPerUnit: 40,
    fatsPerUnit: 20,
    fiberPerUnit: 9,
    vitamins: {
      A: "10% of RDA",
      C: "15% of RDA"
    },
    minerals: {
      Calcium: "20% of RDA",
      Iron: "25% of RDA"
    },
    allergyBits: 0,
    ingredients: {
      create: [
        { ingredientType: "lentil", quantity: 150, unit: "gram", price: new Decimal(1.0) },
        { ingredientType: "camembert", quantity: 100, unit: "gram", price: new Decimal(2.0) },
        { ingredientType: "onion", quantity: 50, unit: "gram", price: new Decimal(0.2) },
        { ingredientType: "garlic", quantity: 5, unit: "gram", price: new Decimal(0.1) },
        { ingredientType: "tomato", quantity: 100, unit: "gram", price: new Decimal(0.5) },
        { ingredientType: "thyme", quantity: 2, unit: "gram", price: new Decimal(0.1) },
        { ingredientType: "olive oil", quantity: 10, unit: "ml", price: new Decimal(0.1) },
        { ingredientType: "salt", quantity: 1, unit: "gram", price: new Decimal(0.01) },
        { ingredientType: "pepper", quantity: 1, unit: "gram", price: new Decimal(0.02) }
      ]
    },
    utensils: {
      connect: [
        { name: "frying pan" },
        { name: "knife" },
        { name: "cutting board" },
        { name: "colander" }
      ]
    }
  },
  {
    title: "Fresh Sourdough Pinsa with Eggplant & Bell Pepper",
    imgUrl: "https://img.hellofresh.com/c_fill,f_auto,fl_lossy,h_531,q_auto,w_944/hellofresh_s3/image/frische-sauerteig-pinsa-mit-aubergine-9914a1de-b1f065d8.jpg",
    description: "A delicious sourdough pinsa topped with roasted eggplant, bell pepper, and melted mozzarella, seasoned with oregano.",
    instructions: [
      "Prepare Toppings: Slice eggplant and bell pepper, and chop tomatoes.",
      "Roast Vegetables: Drizzle eggplant and bell pepper with olive oil, season with salt and pepper, and roast until tender.",
      "Assemble Pinsa: Place sourdough pinsa base on a baking tray, top with roasted vegetables, tomatoes, and slices of mozzarella.",
      "Bake: Bake in the oven until the crust is crispy and the cheese is melted.",
      "Serve: Garnish with oregano and serve hot."
    ].join('\n'),
    duration: 40,
    difficulty: Difficulty.MEDIUM,
    caloriesPerUnit: 480,
    proteinsPerUnit: 18,
    carbsPerUnit: 65,
    fatsPerUnit: 20,
    fiberPerUnit: 5,
    vitamins: {
      A: "15% of RDA",
      C: "30% of RDA"
    },
    minerals: {
      Calcium: "20% of RDA",
      Iron: "10% of RDA"
    },
    allergyBits: 0,
    ingredients: {
      create: [
        { ingredientType: "sourdough pinsa base", quantity: 1, unit: "piece", price: new Decimal(2.0) },
        { ingredientType: "eggplant", quantity: 150, unit: "gram", price: new Decimal(1.0) },
        { ingredientType: "bell pepper", quantity: 100, unit: "gram", price: new Decimal(0.7) },
        { ingredientType: "tomato", quantity: 50, unit: "gram", price: new Decimal(0.3) },
        { ingredientType: "mozzarella", quantity: 100, unit: "gram", price: new Decimal(1.2) },
        { ingredientType: "oregano", quantity: 2, unit: "gram", price: new Decimal(0.1) },
        { ingredientType: "olive oil", quantity: 10, unit: "ml", price: new Decimal(0.1) },
        { ingredientType: "salt", quantity: 1, unit: "gram", price: new Decimal(0.01) },
        { ingredientType: "pepper", quantity: 1, unit: "gram", price: new Decimal(0.02) }
      ]
    },
    utensils: {
      connect: [
        { name: "oven" },
        { name: "baking tray" },
        { name: "knife" },
        { name: "cutting board" }
      ]
    }
  },
  {
    title: "Indian Chickpea Coconut Soup",
    imgUrl: "https://img.hellofresh.com/c_fill,f_auto,fl_lossy,h_531,q_auto,w_944/hellofresh_s3/image/indische-kichererbsen-kokos-suppe-209cf4f0-22aa709f.jpg",
    description: "A creamy and flavorful Indian-inspired soup with chickpeas, coconut milk, and a blend of aromatic spices.",
    instructions: [
      "Sauté Aromatics: In a pot, heat coconut oil and sauté onion, garlic, and ginger.",
      "Add Spices: Stir in cumin, coriander, turmeric, and garam masala.",
      "Cook Soup: Add chickpeas, carrots, tomatoes, coconut milk, and vegetable broth. Simmer until vegetables are tender.",
      "Blend (Optional): For a smoother texture, blend part of the soup.",
      "Season: Finish with lemon juice, salt, and pepper."
    ].join('\n'),
    duration: 35,
    difficulty: Difficulty.EASY,
    caloriesPerUnit: 360,
    proteinsPerUnit: 10,
    carbsPerUnit: 45,
    fatsPerUnit: 18,
    fiberPerUnit: 8,
    vitamins: {
      A: "30% of RDA",
      C: "40% of RDA"
    },
    minerals: {
      Calcium: "10% of RDA",
      Iron: "20% of RDA"
    },
    allergyBits: 0,
    ingredients: {
      create: [
        { ingredientType: "onion", quantity: 50, unit: "gram", price: new Decimal(0.2) },
        { ingredientType: "garlic", quantity: 5, unit: "gram", price: new Decimal(0.1) },
        { ingredientType: "ginger", quantity: 5, unit: "gram", price: new Decimal(0.1) },
        { ingredientType: "carrot", quantity: 100, unit: "gram", price: new Decimal(0.3) },
        { ingredientType: "tomato", quantity: 100, unit: "gram", price: new Decimal(0.5) },
        { ingredientType: "chickpea", quantity: 200, unit: "gram", price: new Decimal(1.0) },
        { ingredientType: "coconut milk", quantity: 200, unit: "ml", price: new Decimal(1.5) },
        { ingredientType: "vegetable broth", quantity: 500, unit: "ml", price: new Decimal(1.0) },
        { ingredientType: "cumin", quantity: 1, unit: "gram", price: new Decimal(0.1) },
        { ingredientType: "coriander", quantity: 1, unit: "gram", price: new Decimal(0.1) },
        { ingredientType: "turmeric", quantity: 1, unit: "gram", price: new Decimal(0.1) },
        { ingredientType: "garam masala", quantity: 1, unit: "gram", price: new Decimal(0.2) },
        { ingredientType: "coconut oil", quantity: 10, unit: "ml", price: new Decimal(0.1) },
        { ingredientType: "lemon juice", quantity: 5, unit: "ml", price: new Decimal(0.05) },
        { ingredientType: "salt", quantity: 1, unit: "gram", price: new Decimal(0.01) },
        { ingredientType: "pepper", quantity: 1, unit: "gram", price: new Decimal(0.02) }
      ]
    },
    utensils: {
      connect: [
        { name: "large pot" },
        { name: "knife" },
        { name: "cutting board" },
        { name: "blender" }
      ]
    }
  },
  {
    title: "Hake in Teriyaki Sauce with Spicy Zucchini",
    imgUrl: "https://img.hellofresh.com/c_fill,f_auto,fl_lossy,h_531,q_auto,w_944/hellofresh_s3/image/seehecht-in-teriyakisauce-mit-scharfer-zucchetti-7b6f7a5b-3ea2ba19.jpg",
    description: "Delicious hake fillets served with a rich teriyaki sauce and spicy zucchini, accompanied by fluffy rice.",
    instructions: [
      "Cook Rice: Boil rice according to package instructions.",
      "Prepare Zucchini: Slice zucchini and sauté with chili flakes and a bit of oil.",
      "Cook Hake: In a separate pan, cook hake fillets until golden and cooked through.",
      "Make Teriyaki Sauce: In a small bowl, mix teriyaki sauce with soy sauce and vinegar.",
      "Serve: Plate the hake and zucchini, drizzle with teriyaki sauce, and sprinkle with sesame seeds."
    ].join('\n'),
    duration: 30,
    difficulty: Difficulty.MEDIUM,
    caloriesPerUnit: 500,
    proteinsPerUnit: 35,
    carbsPerUnit: 50,
    fatsPerUnit: 15,
    fiberPerUnit: 3,
    vitamins: {
      A: "5% of RDA",
      C: "20% of RDA"
    },
    minerals: {
      Calcium: "10% of RDA",
      Iron: "15% of RDA"
    },
    allergyBits: 0,
    ingredients: {
      create: [
        { ingredientType: "hake", quantity: 200, unit: "gram", price: new Decimal(4.0) },
        { ingredientType: "zucchini", quantity: 150, unit: "gram", price: new Decimal(1.0) },
        { ingredientType: "rice", quantity: 100, unit: "gram", price: new Decimal(0.8) },
        { ingredientType: "teriyaki sauce", quantity: 30, unit: "ml", price: new Decimal(0.7) },
        { ingredientType: "soy sauce", quantity: 10, unit: "ml", price: new Decimal(0.1) },
        { ingredientType: "vinegar", quantity: 5, unit: "ml", price: new Decimal(0.05) },
        { ingredientType: "sesame oil", quantity: 5, unit: "ml", price: new Decimal(0.1) },
        { ingredientType: "vegetable oil", quantity: 10, unit: "ml", price: new Decimal(0.1) },
        { ingredientType: "chili flakes", quantity: 1, unit: "gram", price: new Decimal(0.05) },
        { ingredientType: "sesame seeds", quantity: 5, unit: "gram", price: new Decimal(0.2) },
        { ingredientType: "salt", quantity: 1, unit: "gram", price: new Decimal(0.01) },
        { ingredientType: "pepper", quantity: 1, unit: "gram", price: new Decimal(0.02) }
      ]
    },
    utensils: {
      connect: [
        { name: "frying pan" },
        { name: "saucepan" },
        { name: "knife" },
        { name: "cutting board" },
        { name: "colander" },
        { name: "small bowl" }
      ]
    }
  },
  {
    title: "Thuringian Fried Potato Pan",
    imgUrl: "https://img.hellofresh.com/c_fill,f_auto,fl_lossy,h_531,q_auto,w_944/hellofresh_s3/image/HF_Y23_A_R02_W12_DE_L4547-1_Main_low-a98312f6.jpg",
    description: "A traditional Thuringian dish featuring crispy fried potatoes and savory sausage, garnished with fresh parsley.",
    instructions: [
      "Boil Potatoes: Cook potatoes until slightly tender, then slice them.",
      "Cook Sausage: In a frying pan, cook the sausage until browned and set aside.",
      "Fry Potatoes: In the same pan, fry the sliced potatoes until golden and crispy.",
      "Combine: Add the sausage back to the pan with the potatoes.",
      "Serve: Garnish with chopped parsley, salt, and pepper."
    ].join('\n'),
    duration: 12,
    difficulty: Difficulty.EASY,
    caloriesPerUnit: 600,
    proteinsPerUnit: 25,
    carbsPerUnit: 45,
    fatsPerUnit: 35,
    fiberPerUnit: 5,
    vitamins: {
      A: "0% of RDA",
      C: "10% of RDA"
    },
    minerals: {
      Calcium: "5% of RDA",
      Iron: "15% of RDA"
    },
    allergyBits: 0,
    ingredients: {
      create: [
        { ingredientType: "potato", quantity: 500, unit: "gram", price: new Decimal(1.0) },
        { ingredientType: "sausage", quantity: 200, unit: "gram", price: new Decimal(3.0) },
        { ingredientType: "onion", quantity: 50, unit: "gram", price: new Decimal(0.2) },
        { ingredientType: "parsley", quantity: 10, unit: "gram", price: new Decimal(0.3) },
        { ingredientType: "vegetable oil", quantity: 20, unit: "ml", price: new Decimal(0.1) },
        { ingredientType: "salt", quantity: 1, unit: "gram", price: new Decimal(0.01) },
        { ingredientType: "pepper", quantity: 1, unit: "gram", price: new Decimal(0.02) }
      ]
    },
    utensils: {
      connect: [
        { name: "frying pan" },
        { name: "pot" },
        { name: "knife" },
        { name: "cutting board" },
        { name: "colander" }
      ]
    }
  },
  {
    title: "Ham & Cheese Burrito",
    imgUrl: "https://img.hellofresh.com/c_fill,f_auto,fl_lossy,h_531,q_auto,w_944/hellofresh_s3/image/HF_Y23_R13_W47_DE_L4852-1_Main_f1_high-4889c478.jpg",
    description: "A classic burrito filled with savory ham, melted cheese, and a mix of bell pepper and onion, served with salsa and sour cream.",
    instructions: [
      "Prepare Fillings: Dice ham, bell pepper, and onion.",
      "Cook Fillings: Sauté bell pepper and onion in a pan, then add ham and cook until heated through.",
      "Assemble Burritos: Lay out flour tortillas, fill with the ham mixture, and top with cheese. Roll up tightly.",
      "Serve: Serve the burritos with salsa and sour cream on the side."
    ].join('\n'),
    duration: 20,
    difficulty: Difficulty.EASY,
    caloriesPerUnit: 550,
    proteinsPerUnit: 25,
    carbsPerUnit: 45,
    fatsPerUnit: 30,
    fiberPerUnit: 3,
    vitamins: {
      A: "10% of RDA",
      C: "20% of RDA"
    },
    minerals: {
      Calcium: "15% of RDA",
      Iron: "10% of RDA"
    },
    allergyBits: 0,
    ingredients: {
      create: [
        { ingredientType: "ham", quantity: 150, unit: "gram", price: new Decimal(2.0) },
        { ingredientType: "cheese", quantity: 100, unit: "gram", price: new Decimal(1.5) },
        { ingredientType: "bell pepper", quantity: 50, unit: "gram", price: new Decimal(0.5) },
        { ingredientType: "onion", quantity: 50, unit: "gram", price: new Decimal(0.2) },
        { ingredientType: "flour tortilla", quantity: 2, unit: "piece", price: new Decimal(1.0) },
        { ingredientType: "salsa", quantity: 30, unit: "ml", price: new Decimal(0.5) },
        { ingredientType: "sour cream", quantity: 30, unit: "ml", price: new Decimal(0.5) },
        { ingredientType: "vegetable oil", quantity: 10, unit: "ml", price: new Decimal(0.1) },
        { ingredientType: "salt", quantity: 1, unit: "gram", price: new Decimal(0.01) },
        { ingredientType: "pepper", quantity: 1, unit: "gram", price: new Decimal(0.02) }
      ]
    },
    utensils: {
      connect: [
        { name: "frying pan" },
        { name: "knife" },
        { name: "cutting board" }
      ]
    }
  },
  {
    title: "Fresh Linguine with Shrimp",
    imgUrl: "https://img.hellofresh.com/c_fill,f_auto,fl_lossy,h_531,q_auto,w_944/hellofresh_s3/image/HF200422_R15_W26_DE_EXP2704-1_MB_Main_low-4bccafb5.jpg",
    description: "A delightful pasta dish featuring fresh linguine, succulent shrimp, cherry tomatoes, and a squeeze of lemon, garnished with Parmesan and parsley.",
    instructions: [
      "Cook Linguine: Boil linguine in salted water until al dente, then drain.",
      "Prepare Shrimp: In a pan, cook shrimp with garlic and cherry tomatoes in olive oil.",
      "Combine: Toss the cooked linguine with the shrimp mixture. Add lemon juice and zest.",
      "Serve: Garnish with grated Parmesan cheese and chopped parsley."
    ].join('\n'),
    duration: 30,
    difficulty: Difficulty.MEDIUM,
    caloriesPerUnit: 550,
    proteinsPerUnit: 25,
    carbsPerUnit: 70,
    fatsPerUnit: 20,
    fiberPerUnit: 4,
    vitamins: {
      A: "15% of RDA",
      C: "25% of RDA"
    },
    minerals: {
      Calcium: "10% of RDA",
      Iron: "18% of RDA"
    },
    allergyBits: 0,
    ingredients: {
      create: [
        { ingredientType: "shrimp", quantity: 200, unit: "gram", price: new Decimal(3.0) },
        { ingredientType: "linguine", quantity: 200, unit: "gram", price: new Decimal(1.0) },
        { ingredientType: "garlic", quantity: 5, unit: "gram", price: new Decimal(0.1) },
        { ingredientType: "cherry tomato", quantity: 100, unit: "gram", price: new Decimal(1.0) },
        { ingredientType: "lemon", quantity: 1, unit: "piece", price: new Decimal(0.5) },
        { ingredientType: "parmesan cheese", quantity: 30, unit: "gram", price: new Decimal(1.2) },
        { ingredientType: "parsley", quantity: 5, unit: "gram", price: new Decimal(0.2) },
        { ingredientType: "olive oil", quantity: 20, unit: "ml", price: new Decimal(0.2) },
        { ingredientType: "salt", quantity: 1, unit: "gram", price: new Decimal(0.01) },
        { ingredientType: "pepper", quantity: 1, unit: "gram", price: new Decimal(0.02) }
      ]
    },
    utensils: {
      connect: [
        { name: "pot" },
        { name: "frying pan" },
        { name: "colander" },
        { name: "knife" },
        { name: "cutting board" },
        { name: "cheese grater" },
        { name: "small bowl" }
      ]
    }
  },
  {
    title: "Honey Salmon Fillet on Ginger-Miso Sweet Potato Puree",
    imgUrl: "https://img.hellofresh.com/c_fill,f_auto,fl_lossy,h_531,q_auto,w_944/hellofresh_s3/image/HF220622_R31_W33_DE_PM3731-6_MB_Main_low-f320e5ba.jpg",
    description: "A succulent salmon fillet glazed with honey, served over a smooth and flavorful ginger-miso sweet potato puree.",
    instructions: [
      "Prepare Sweet Potato Puree: Boil sweet potatoes until tender. Blend with butter, miso paste, and ginger to form a smooth puree.",
      "Cook Salmon: Place salmon fillets on a baking tray, glaze with honey and olive oil, and bake until cooked through.",
      "Serve: Plate the salmon over the sweet potato puree. Drizzle with extra honey if desired."
    ].join('\n'),
    duration: 40,
    difficulty: Difficulty.MEDIUM,
    caloriesPerUnit: 650,
    proteinsPerUnit: 35,
    carbsPerUnit: 55,
    fatsPerUnit: 30,
    fiberPerUnit: 6,
    vitamins: {
      A: "25% of RDA",
      C: "30% of RDA"
    },
    minerals: {
      Calcium: "8% of RDA",
      Iron: "15% of RDA"
    },
    allergyBits: 0,
    ingredients: {
      create: [
        { ingredientType: "salmon fillet", quantity: 200, unit: "gram", price: new Decimal(5.0) },
        { ingredientType: "sweet potato", quantity: 300, unit: "gram", price: new Decimal(1.0) },
        { ingredientType: "ginger", quantity: 10, unit: "gram", price: new Decimal(0.2) },
        { ingredientType: "miso paste", quantity: 20, unit: "gram", price: new Decimal(0.5) },
        { ingredientType: "butter", quantity: 20, unit: "gram", price: new Decimal(0.3) },
        { ingredientType: "honey", quantity: 30, unit: "ml", price: new Decimal(0.4) },
        { ingredientType: "olive oil", quantity: 10, unit: "ml", price: new Decimal(0.1) },
        { ingredientType: "salt", quantity: 1, unit: "gram", price: new Decimal(0.01) },
        { ingredientType: "pepper", quantity: 1, unit: "gram", price: new Decimal(0.02) }
      ]
    },
    utensils: {
      connect: [
        { name: "oven" },
        { name: "baking tray" },
        { name: "pot" },
        { name: "food processor" },
        { name: "knife" },
        { name: "cutting board" },
        { name: "small bowl" }
      ]
    }
  },
  {
    title: "Fine Rump Steak with Cowboy Butter Sauce",
    imgUrl: "https://img.hellofresh.com/c_fill,f_auto,fl_lossy,h_531,q_auto,w_944/hellofresh_s3/image/HF220721_R20_W37_DE_VP4181-1_MB_Main_low-0e9d124a.jpg",
    description: "A perfectly cooked rump steak served with a rich and flavorful cowboy butter sauce, infused with garlic, parsley, and a hint of lemon.",
    instructions: [
      "Prepare Cowboy Butter Sauce: Mix softened butter with minced garlic, chopped parsley, lemon zest, chili flakes, salt, and pepper.",
      "Cook Steak: Season the steak and cook in a frying pan to your desired doneness.",
      "Serve: Top the steak with the cowboy butter sauce and let it melt over the warm steak."
    ].join('\n'),
    duration: 30,
    difficulty: Difficulty.MEDIUM,
    caloriesPerUnit: 700,
    proteinsPerUnit: 40,
    carbsPerUnit: 2,
    fatsPerUnit: 60,
    fiberPerUnit: 1,
    vitamins: {
      A: "10% of RDA",
      C: "15% of RDA"
    },
    minerals: {
      Calcium: "2% of RDA",
      Iron: "25% of RDA"
    },
    allergyBits: 0,
    ingredients: {
      create: [
        { ingredientType: "rump steak", quantity: 200, unit: "gram", price: new Decimal(5.0) },
        { ingredientType: "butter", quantity: 50, unit: "gram", price: new Decimal(0.5) },
        { ingredientType: "garlic", quantity: 5, unit: "gram", price: new Decimal(0.1) },
        { ingredientType: "parsley", quantity: 10, unit: "gram", price: new Decimal(0.2) },
        { ingredientType: "lemon", quantity: 1, unit: "piece", price: new Decimal(0.5) },
        { ingredientType: "chili flakes", quantity: 1, unit: "gram", price: new Decimal(0.1) },
        { ingredientType: "olive oil", quantity: 10, unit: "ml", price: new Decimal(0.1) },
        { ingredientType: "salt", quantity: 1, unit: "gram", price: new Decimal(0.01) },
        { ingredientType: "pepper", quantity: 1, unit: "gram", price: new Decimal(0.02) }
      ]
    },
    utensils: {
      connect: [
        { name: "frying pan" },
        { name: "knife" },
        { name: "cutting board" },
        { name: "cheese grater" }
      ]
    }
  },
  {
    title: "Chicken Saltimbocca with Eggplant au Gratin",
    imgUrl: "https://img.hellofresh.com/c_fill,f_auto,fl_lossy,h_531,q_auto,w_944/hellofresh_s3/image/HF_Y23_R41_W38_DE_PM4717-1_Main__2low-79833e45.jpg",
    description: "Tender chicken breast wrapped in prosciutto and sage, served alongside a rich and cheesy eggplant au gratin.",
    instructions: [
      "Prepare Eggplant au Gratin: Slice eggplant, layer in a baking dish with garlic and cheese, and bake until golden.",
      "Make Chicken Saltimbocca: Wrap chicken breasts with prosciutto and sage, secure with toothpicks, and pan-fry until cooked.",
      "Serve: Plate the chicken saltimbocca with the eggplant au gratin on the side."
    ].join('\n'),
    duration: 45,
    difficulty: Difficulty.MEDIUM,
    caloriesPerUnit: 650,
    proteinsPerUnit: 40,
    carbsPerUnit: 20,
    fatsPerUnit: 35,
    fiberPerUnit: 5,
    vitamins: {
      A: "10% of RDA",
      C: "15% of RDA"
    },
    minerals: {
      Calcium: "20% of RDA",
      Iron: "12% of RDA"
    },
    allergyBits: 0,
    ingredients: {
      create: [
        { ingredientType: "chicken breast", quantity: 200, unit: "gram", price: new Decimal(3.0) },
        { ingredientType: "prosciutto", quantity: 50, unit: "gram", price: new Decimal(2.0) },
        { ingredientType: "eggplant", quantity: 200, unit: "gram", price: new Decimal(1.0) },
        { ingredientType: "cheese", quantity: 100, unit: "gram", price: new Decimal(1.5) },
        { ingredientType: "garlic", quantity: 5, unit: "gram", price: new Decimal(0.1) },
        { ingredientType: "sage", quantity: 5, unit: "gram", price: new Decimal(0.3) },
        { ingredientType: "olive oil", quantity: 20, unit: "ml", price: new Decimal(0.2) },
        { ingredientType: "salt", quantity: 1, unit: "gram", price: new Decimal(0.01) },
        { ingredientType: "pepper", quantity: 1, unit: "gram", price: new Decimal(0.02) }
      ]
    },
    utensils: {
      connect: [
        { name: "oven" },
        { name: "baking tray" },
        { name: "frying pan" },
        { name: "knife" },
        { name: "cutting board" },
        { name: "toothpicks" }
      ]
    }
  }
];

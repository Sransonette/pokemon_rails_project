Specs:
- [x] Using Ruby on Rails for the project - using rails
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) - Trainer has many belts
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) - Belts belong to Trainer
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) - Trainer has many pokemon through belts and Pokemon has many trainers through belts
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) - Trainer has many pokemon through belts and Pokemon has many trainers through belts
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) - user can add a tiers to the belts join table
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) - validates precense of names and emails
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) - use .order in the belts model to show top 5 belts
- [x] Include signup - yes
- [x] Include login - yes
- [x] Include logout - yes
- [x] Include third party signup/login (how e.g. Devise/OmniAuth) - use google
- [x] Include nested resource show or index (URL e.g. users/2/recipes) - http://localhost:3000/trainers/1/belts/21 one of my show page routes
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) - nested new form creates pokemon at the same time as a belt
- [x] Include form display of validation errors (form URL e.g. /recipes/new) - errors appear when forms are left blank when creating belts

Confirm:
- [x] The application is pretty DRY - yes
- [x] Limited logic in controllers - yes i made quite a few helpers
- [x] Views use helper methods if appropriate - yes
- [x] Views use partials if appropriate - I have partials
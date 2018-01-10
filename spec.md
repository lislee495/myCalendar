# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [X] Include at least one has_many relationship (x has_many y e.g. User has_many Recipes)
    * User has_many Friendships
    * User has_many Categories
- [X] Include at least one belongs_to relationship (x belongs_to y e.g. Post belongs_to User)
    * Category belongs_to User
    * Friendship belongs_to User(s)
- [X] Include at least one has_many through relationship (x has_many y through z e.g. Recipe has_many Items through Ingredients)
    * Event has_many Categories, through EventCategories
    * User has_many Events, through EventUsers
- [ ] The "through" part of the has_many through includes at least one user submittable attribute (attribute_name e.g. ingredients.quantity)
- [ ] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    * Friendships, it's in a helper method => All users that have added the user as a friend (the helper method sorts out if the user hasn't added them back). Appears on /users/friendship/
- [X] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
    * Event accepts nested attributes for Category, /user/event/new for Category
- [X] Include signup (how e.g. Devise)
    * Devise
- [X] Include login (how e.g. Devise)
    * Devise
- [X] Include logout (how e.g. Devise)
    * Devise
- [X] Include third party signup/login (how e.g. Devise/OmniAuth)
    * Devise OmniAuth for Facebook
- [ ] Include nested resource show or index (URL e.g. users/2/recipes)
- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [X] Views use helper methods if appropriate
- [ ] Views use partials if appropriate

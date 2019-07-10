# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project

- [x] Include at least one has_many relationship
    :```board has_many :props```

- [x] Include at least one belongs_to relationship
    :```prop belongs_to :board```

- [x] Include at least two has_many through relationships
    :```prop has_many :users through :user_picks``` and ```user has many :props through :user_picks```

- [x] Include at least one many-to-many relationship
    :many-to-many relationship is through the join table ```:user_picks```

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user
    :user_picks can be ```scored``` by admin (boolean), and ```side_won``` (boolean), both of which are on the join table and can be used to filter picks

- [x] Include reasonable validations for simple model objects
    :```:user``` -validates email and password presence and email uniqueness when signing in
    :```:prop``` -validates presence of nearly every field to not introduce bad data

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g.
    :```"/leaderboard"``` uses the scope method that displays users with the highest streaks
    :there are other scope methods that are used to help display props for the day as well as experimental scope methods that display props by sport

- [x] Include signup
- [x] Include login
- [x] Include logout
- [x] Include third party signup/login
      :```google-oauth2```

- [x] Include nested resource show or index (URL e.g. users/2/recipes)
      :```props#index```
      :```"/boards/3/props"```

- [x] Include nested resource "new" form
    :```"/boards/5/props/new"```

- [x] Include form display of validation errors
    multiple forms show validation errors

Confirm:
- [] The application is pretty DRY
- [] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate

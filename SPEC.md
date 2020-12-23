# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
# installed rails gem
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
# User has_many :gigs
# User has_many :requests

# Gig has_many :gig_instruments
# Gig has_many :requests

# Instrument has_many :gig_instruments
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
# Gig belongs_to :user
# GigInstrument belongs_to :instrument
# GigInstrument belongs_to :gig

# Request belongs_to :gig
# Request belongs_to :user
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
# User has_many :posted_gigs, through: :requests, source: :gigs

# Gig has_many :gig_instruments, through: :gig_instruments
# Gig has_many :users, through: :requests

# Instrument has_many :gigs, through: :gig_instruments
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
# Instrument has_many :gig_instruments
# Instrument has_many :gigs, through: :gig_instruments

# Gig has_many :gig_instruments
# Gig has_many :instruments, through: :gig_instruments

# Gig has_many :requests
# Gig has_many :users, through: :requests

# User has_many :requests
# User has_many :posted_gigs, through: :requests, source: :gigs 
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
# Request has a boolean attribute of "application" where user can choose to submit an application for a requested gig.
- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
# User validates :first_name, :last_name, :email, presence: true
# User validates :email, uniqueness: true

# Request validates :application, acceptance: { message: 'box must be checked to apply' }
# Request validates :gig, :uniqueness => { scope: :user_id, message: 'has already received your application.'}  

# Instrument validates :name, presence: true

# Gig validates :title, :datetime, :description, presence: true
# Gig validates :payment, numericality: {greater_than_or_equal_to: 0}
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
# Gig.most_recent
# User scope :contractor, -> { where(contractor: 'true') }
- [x] Include signup
# Created form and route
- [x] Include login
# Created sessions controller with route to create a session[:user_id] and set it to the user's id. Login form
- [x] Include logout
# create route and path to destry session user id
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
# Install gem 'omniauth', gem 'omniauth-rails_csrf_protection', gem 'omniauth-google-oauth2', gem 'dotenv', create .env file and include in .gitignore. Methods created in sessions controller and user model to instantiate login through 3rd party
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
#   resources :users, only: [:show, :index] do
#      resources :gigs, only: [:index, :show, :new, :create, :edit, :update]
# end
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
# resources :users do 
#    resources :gigs[:new]
- [x] Include form display of validation errors (form URL e.g. /recipes/new)


Confirm:
- [x] The application is pretty DRY
# added helper methods in the application controller to dry my controllers
- [x] Limited logic in controllers
# used created helper methods from application controller and models
- [x] Views use helper methods if appropriate
# helper methods in the helpers folder to dry views
- [x] Views use partials if appropriate
# created partials for users forms and gig forms as well as forms repeated logic/code
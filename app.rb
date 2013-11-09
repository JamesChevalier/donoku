require 'sinatra'
require 'rack/ssl-enforcer'
require 'stripe'
use Rack::SslEnforcer, except_hosts: /127.0.0.1$/, :except_environments => 'test'

set :publishable_key, ENV['STRIPE_PUBLISHABLE_KEY']
set :secret_key, ENV['STRIPE_SECRET_KEY']
Stripe.api_key = settings.secret_key

set :facebook_link, 'http://facebook.com/yourpage'   # Your Facebook URL
set :homepage, 'http://example.com'                  # The URL for your main site, not the Donoku site
set :image_link, 'http://robohash.org/donoku.png'    # The image to use in Stripe's Checkout popup
set :statement, 'You should donate because reasons.' # An optional paragraph to display above the Donation box
set :price1, 5                                       # Donation Price Option
set :price2, 10                                      # Donation Price Option
set :price3, 20                                      # Donation Price Option
set :price1_value, 'runs the server for a week'      # What the donation accomplishes
set :price2_value, 'runs the server for a month'     # What the donation accomplishes
set :price3_value, 'runs the server for a year'      # What the donation accomplishes
set :reason, 'You are awesome'                       # Short reason for people to donate, displayeyd in Donation box
set :site_name, 'Donoku'                             # Your site's name
set :subheader, 'Donate'                             # Subheader for the Donoku site
set :twitter_link, 'http://twitter.com/yourusername' # Your Twitter URL

get '/' do
  erb :index
end

post '/donate' do
  @params  = params
  customer = Stripe::Customer.create(email: params[:stripeEmail],
                                     description: params[:description],
                                     card: params[:stripeToken])
  Stripe::Charge.create(amount: params[:price], description: 'Donoku Charge', currency: 'usd', customer: customer)
  erb :donate
end

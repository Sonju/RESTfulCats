require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql', :database => 'food_banks'
)

# Read list all
 get '/' do
  #  Alternative Succint Code
# @foodbank = Foodbank.create({:name => "Logan Square", :address => "462 Sacremento Ave", :city => "Chicago"})

  @foobank = Foodbank.new
  @foobank.name = "Logan Square"
  @foobank.address = "462 Sacremento Ave"
  @foobank.city = "Chicago"
 end

 # GET: list
 get '/api/foodbanks' do
   Foodbank.all.to_json
 end

 # GET: By Id
 get '/api/foodbanks/:id' do
   puts params
   Foodbank.find(params[:id]).to_json
 end

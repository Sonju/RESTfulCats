require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql', :database => 'food_banks'
)

# Read list all
 get '/' do
   {:message => 'Not allowed. Please try "/api/foodbank"'}

#  Alternative Succint Code
# @foodbank = Foodbank.create({:name => "Logan Square", :address => "462 Sacremento Ave", :city => "Chicago"})
  @foodbank = FoodBank.new
  @foodbank.name = "Logan Square"
  @foodbank.address = "462 Sacremento Ave"
  @foodbank.city = "Chicago"
  @foodbank.save
  @foodbank.to_json
 end

 # GET: list
 get '/api/foodbanks' do
   FoodBank.all.to_json
 end

 # GET: By Id
 get '/api/foodbanks/:id' do
   puts params
   FoodBank.find(params[:id]).to_json
 end

 # CREATE
 # post
 post '/api/foodbanks' do
   puts params
   FoodBank.create({ :name => params[:name], :address => params[:address], :city => params[:city] }).to_json
 end

# UPDATE
# patch
# put
# you should never never ever ever
# update the ID of a model (table row)

patch  '/api/foodbanks/:id' do
  foodbanks_args = { :name =>params[:name], :address => params[:address], :city => params[:city] }

  # this is similar to the following in rails....
  # params.require(:cat).permit(:name, :breed)
  @foodbank = FoodBank.find(params[:id])
  @foodbank.update(foodbanks_args)
  @foodbank.to_json
end

  # duplicate code from above to support older servers that only support 'put'
  put  '/api/foodbanks/:id' do
    foodbanks_args = { :name => params[:name], :address => params[:address], :city => params[:city] }

    @foodbank = FoodBank.find(params[:id])
    @foodbank.update(foodbanks_args)
    @foodbank.to_json
end

# DELETE

delete '/api/foodbanks/:id' do
  FoodBank.destroy(params[:id]).to_json
end

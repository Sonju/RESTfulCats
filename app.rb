require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'restfulcats'
)

get '/' do
   # alternative succint code
 # @cat = Cat.create({ :name => "Lankey", :breed => "special" })

  @cat = Cat.new
  @cat.name = "Lankey"
  @cat.breed = "special"
  @cat.save
  @cat.to_json
end

# OK, we need an API... because the internet needs us

# GET: List
get '/api/cats' do
  Cat.all.to_json
end

# GET: By Id
get '/api/cats/:id' do
  puts params
  Cat.find(params[:id]).to_json

end


post '/api/cats' do
  puts params
  Cat.create({
  :name => params[:name],
  :breed => params[:breed]
  }).to_json
end

# PATCH: Update by ID
# you should never never ever ever
# update the ID of a model (table row)
patch '/api/cats/:id' do
  cat_args = { :name => params[:name], :breed => params[:breed] }

  # this is similar to the following in rails....
  # params.require(:cat).permit(:name, :breed)

  @cat = Cat.find(params[:id])
  @cat.update(cat_args)
  @cat.to_json
end

# duplicate code from above to support older servers that only support 'put'
put '/api/cats/:id' do
  cat_args = { :name => params[:name], :breed => params[:breed] }

  # this is similar to the following in rails....
  # params.require(:cat).permit(:name, :breed)

  @cat = Cat.find(params[:id])
  @cat.update(cat_args)
  @cat.to_json
end

# DELETE
 delete '/api/cats/:id' do
   Cat.destroy(params[:id]).to_json
 end

# yay apis

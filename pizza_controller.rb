require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('models/pizza.rb')


#INDEX
get '/pizzas' do
  @pizzas = Pizza.all 
  erb(:index)
end

#NEW
get '/pizza/new' do
 erb(:new_pizza)
end
#CREATE
post '/pizzas/' do 
  new_pizza = Pizza.new({
    "first_name" => params['first_name'],
    "last_name" =>  params['last_name'],
    "topping" => params['topping'],
    "quantity" =>  params['quantity']
  })
  new_pizza.save
  redirect '/pizzas'
end
#SHOW
get '/pizzas/:id' do
  @users_pizza = Pizza.find(params[:id])
  erb(:show_order)
end
#EDIT

#UPDATE

#DELETE
post '/pizzas/:id/delete' do
  Pizza.delete(params[:id])
  redirect '/pizzas'

end

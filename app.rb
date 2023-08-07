require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  @the_num = params.fetch("user_number").to_f
  @the_result = @the_num ** 2
  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_sq_root_calc)
end

get("/square_root/results") do
  @the_num = params.fetch("user_number").to_f
  @the_result = @the_num ** 0.5
  erb(:sq_root_results)
end

get("/payment/new") do
  erb(:payment)
end

get("/payment/results") do
  @apr = params.fetch("apr").to_f.round(4)
  @num_years = params.fetch("num_years").to_f
  @principal = params.fetch("principal").to_f
  num_periods = @num_years*12
  percent_apr = @apr/100
  r = percent_apr/12
  numerator = r * @principal
  denominator = 1 - ((1 + r) ** -num_periods)
  @payment = (numerator / denominator)

  erb(:payment_results)
end

get("/random/new") do
  erb(:new_random_calc)
end

get("/random/results") do
  @min_num = params.fetch("min_num").to_f
  @max_num = params.fetch("max_num").to_f
  @rand_num = rand(@min_num..@max_num).to_f
  erb(:random_results)
end

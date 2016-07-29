get "/stock/map" do
	erb :'/stock/map'
end

get "/stock/new" do
	@stock = Stock.all
	if request.xhr?
		erb :'/stock/_new', layout: false
	else
		erb :'/stock/new'
	end
end

post "/stock/new" do
	@stock = Stock.create(ticker: params[:ticker])
	if request.xhr?
		erb :'/stock/new', layout: false
	else
		redirect '/stock/view'
	end
end


# post "/stock/new" do
# 	@stock = Stock.create(ticker: params[:ticker])
# 	if request.xhr?
# 		erb :'/stock/_view', layout: false
# 	else
# 		erb :'/stock/view'
# 	end
# end
get "/stock/view" do
	@stock = Stock.all
	erb :'/stock/view'
end	

get '/stock/nyse' do
	if request.xhr?
		erb :'/stock/nyse', layout: false
	else
		erb :'/stock/nyse'
	end
end

get '/stock/dj' do
	if request.xhr?
		erb :'/stock/dj', layout: false
	else
		erb :'/stock/dj'
	end
end

get '/stock/nasdaq' do
	if request.xhr?
		erb :'/stock/nasdaq', layout: false
	else
		erb :'/stock/nasdaq'
	end
end

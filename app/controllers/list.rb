get '/lists' do
  @lists = List.all
  erb :'lists/index'
end

get '/lists/new' do
  erb :'lists/new'
end

get '/lists/:id' do
  @list = List.find(params[:id])
  erb :'lists/show', locals: { list: @list }
end

post '/lists' do
  @list = List.new(params[:list])

  if @list.save
    redirect "/lists/#{@list.id}"
  else
    @errors = @list.errors.full_messages
    erb :'lists/new'
  end
end

get '/lists/:id/edit' do
  @list = List.find(params[:id])

  erb :'lists/edit'
end

put '/lists/:id' do
  @list = List.find(params[:id])

  if @list.update_attributes(params[:list])
    redirect "/lists/#{@list.id}"
  else
    @errors = @list.errors.full_messages
    erb :'lists/edit'
  end
end

delete '/lists/:id' do
  @list = List.find(params[:id])
  @list.destroy

  redirect '/lists'
end
post '/tags' do

  #below works with properly formatted params in HTML form
  @tag = Tag.new(params[:tag]) #create new tag

  if @tag.save #saves new tag or returns false if unsuccessful
    redirect '/tags' #redirect back to tags index page
  else
    erb :'tags/new' # show new tags view again(potentially displaying errors)
  end

end


get '/tags/:id' do

  #gets params from url

  @tag = Tag.find(params[:id]) #define instance variable for view

  erb :'tags/show' #show single tag view

end

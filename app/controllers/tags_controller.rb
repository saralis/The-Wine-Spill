post '/tags' do
  params[:question_id] = params[:question_id].to_i
# binding.pry
  require_same_user(Question.find_by(id: params[:question_id]).user)

  #below works with properly formatted params in HTML form
  found_tag = Tag.find_by(name: params[:tag][:name])
  if found_tag
    @tag = found_tag #create new tag
  else
    @tag = Tag.new(params[:tag]) #create new tag
  end

  @tag.save #saves new tag or returns false if unsuccessful

  question_tag_params = {question_id: params[:question_id], tag_id: @tag.id}
  QuestionTag.create(question_tag_params)

  if request.xhr?
    "<li class=\"tags\"><a href=\"/tags/#{@tag.id}\">#{@tag.name}</a></li>"
  else
    redirect "/questions/#{params[:question_id]}" #redirect back to tags index page
  end

end


get '/tags/:id' do

  #gets params from url

  @tag = Tag.find(params[:id]) #define instance variable for view

  erb :'tags/show' #show single tag view

end

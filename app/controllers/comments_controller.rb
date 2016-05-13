# Questions
post '/questions/:question_id/comments' do
  require_user
  if request.xhr?
    @question = Question.find(params[:question_id])
    params[:comment][:user_id] = current_user.id
    @comment = @question.comments.new(params[:comment])
    @comment.save
    @comment.body
  else
    @question = Question.find(params[:question_id])
    params[:comment][:user_id] = current_user.id
    @comment = @question.comments.new(params[:comment])
    @comment.save
    redirect "/questions/#{@question.id}"
  end
end

# Edit question
# put '/questions/:question_id/comments/:id' do
#   require_same_user(current_user)
#   @question = Question.find(params[:question_id])
#   @comment = @question.comments.find(params[:id])
#   @comment.update_attributes(params[:comment])
#   redirect "/questions/#{@question.id}"
# end

delete '/questions/:question_id/comments/:id' do
  require_same_user(current_user)
  if request.xhr? #checks for ajax request
    @question = Question.find(params[:question_id])
    @comment = @question.comments.find(params[:id])
    @comment.destroy
  else #if JS is turned off
    @question = Question.find(params[:question_id])
    @comment = @question.comments.find(params[:id])
    @comment.destroy
    redirect "/questions/#{@question.id}"
  end
end


# Answers
post '/answers/:answer_id/comments' do
  require_user
  @answer = Answer.find(params[:answer_id])
  params[:comment][:user_id] = current_user.id
  @comment = @answer.comments.new(params[:comment])
  @comment.save
  redirect "/questions/#{@answer.question.id}"
end

# Edit answer
# put '/answers/:answer_id/comments/:id' do
#   require_same_user(current_user)
#   @answer = Answer.find(params[:answer_id])
#   @comment = @answer.comments.find(params[:id])
#   @comment.update_attributes(params[:comment])
#   redirect "/answers/#{@answer.id}"
# end

delete '/answers/:answer_id/comments/:id' do
  require_same_user(current_user)
  @answer = Answer.find(params[:answer_id])
  @comment = @answer.comments.find(params[:id])
  @comment.destroy
  redirect "/questions/#{@question.id}"
end

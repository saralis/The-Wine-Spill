
post '/questions/:question_id/comments' do
  @question = Question.find(params[:question_id])

  @comment = @question.comments.new(params[:comment])

  @comment.save
  redirect "/questions/#{@question.id}"
end
# this will cause view count to increment

put '/questions/:question_id/comments/:id' do
  @question = Question.find(params[:question_id])

  @comment = @question.comments.find(params[:id])

  @comment.update_attributes(params[:comment])
  redirect "/questions/#{@question.id}"
end
# this will cause view count to increment

delete '/questions/:question_id/comments/:id' do
  @question = Question.find(params[:question_id])

  @comment = @question.comments.find(params[:id])

  @comment.destroy

  redirect "/questions/#{@question.id}"
end
# this will cause view count to increment



post '/answers/:answer_id/comments' do
  @answer = Answer.find(params[:answer_id])

  @comment = @answer.comments.new(params[:comment])

  @comment.save
  redirect "/answers/#{@answer.id}"
end
# this will cause view count to increment

put '/answers/:answer_id/comments/:id' do
  @answer = Answer.find(params[:answer_id])

  @comment = @answer.comments.find(params[:id])

  @comment.update_attributes(params[:comment])
  redirect "/answers/#{@answer.id}"
end
# this will cause view count to increment

delete '/answers/:answer_id/comments/:id' do
  @answer = Answer.find(params[:answer_id])

  @comment = @answer.comments.find(params[:id])

  @comment.destroy

  redirect "/answers/#{@answer.id}"
end
# this will cause view count to increment


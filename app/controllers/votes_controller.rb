# post '/questions/:id/up_votes' do
#   @question = Question.find(params[:id])
#   @votes = @question.votes.count
#   @up_vote = @question.votes.new(count: + 1)
#   if @up_vote.save
#   	redirect '/questions/:id'
#   else
#   	erb :'/question/show'
#   end   
# end

# post '/question/:id/down_votes' do
#   @question = Question.find(params[:id])
#   @votes = @question.votes.count
#   @down_vote = @question.votes.new(count: - 1)
#   if @up_vote.save
#   	redirect '/questions/:id'
#   else
#   	erb :'/question/show'
#   end   
# end
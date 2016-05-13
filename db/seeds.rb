#users
User.create(username: 'test', email: 'test@test.com', password: 'test')
User.create(username: 'leo', email: 'leo@awesome.com', password: 'password')
User.create(username: 'adam', email: 'adam@awesome.com', password: 'password')
User.create(username: 'ayaz', email: 'ayaz@awesome.com', password: 'password')
User.create(username: 'saralis', email: 'saralis@awesome.com', password: 'password')

#Question
Question.create(title: "Vertical Tasting" , body: 'What is it?', view_count: 0, user_id: 1)
Question.create(title: 'Sommelier', body: 'What is a sommelier', view_count: 0, user_id: 1)
Question.create(title: 'Largest consumption of wine per capita', body: 'Where could you find the largest consumption of wine per capita in the world? ', view_count: 0, user_id: 1)

#Answer
Answer.create(body: 'Answer1', user_id: 1, question_id: 1)

#comments
Comment.create(body: 'comment1', commentable_id: 1, commentable_type: 'Answer', user_id: 1)

#votes
Vote.create(count: 1, user_id: 1, votable_id: 1, votable_type: 'Question')
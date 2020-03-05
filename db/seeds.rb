# frozen_string_literal: true

# role
admin_role = Role.find_or_create_by(name: 'admin', description: 'The Super admin')
agent_role = Role.find_or_create_by(name: 'agent', description: 'Customer support agent')
user_role = Role.find_or_create_by(name: 'user', description: 'Normal user')

# check if user exists
admin_1_email = 'admin1@example.com'
admin_2_email = 'admin2@example.com'

agent_1_email = 'agent1@example.com'
agent_2_email = 'agent2@example.com'

user_1_email = 'user1@example.com'
user_2_email = 'user2@example.com'

admin_1 = User.find_by(email: admin_1_email)
admin_2 = User.find_by(email: admin_2_email)

agent_1 = User.find_by(email: agent_1_email)
agent_2 = User.find_by(email: agent_2_email)

user_1 = User.find_by(email: user_1_email)
user_2 = User.find_by(email: user_2_email)

unless admin_1
  User.create(name: 'admin_1', email: admin_1_email, password: 'password', role: admin_role)
end
unless admin_2
  User.create(name: 'admin_2', email: admin_2_email, password: 'password', role: admin_role)
end
unless agent_1
  User.create(name: 'agent_1', email: agent_1_email, password: 'password', role: agent_role)
end
unless agent_2
  User.create(name: 'agent_2', email: agent_2_email, password: 'password', role: agent_role)
end
unless user_1
  User.create(name: 'user_1', email: user_1_email, password: 'password')
end
unless user_2
  User.create(name: 'user_2', email: user_2_email, password: 'password')
end

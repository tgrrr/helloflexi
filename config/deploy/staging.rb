# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

role :app, %w{ali@104.131.177.184}
role :web, %w{ali@104.131.177.184}
role :db,  %w{ali@104.131.177.184}


# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

server '104.131.177.184', user: 'ali', roles: %w{web app}, my_property: :my_value

set :rvm_ruby_version, 'ruby-2.1.4@hello-flexi'

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/home/ali/projects/staging/helloflexi'

# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# And/or per server (overrides global)
# ------------------------------------
server '104.131.177.184',
       user: 'ali',
    roles: %w{web app},
    ssh_options: {
    user: 'ali', # overrides user setting above
    keys: %w(/home/ahmirza/.ssh/id_rsa),
    forward_agent: false,
    auth_methods: %w(publickey password)
}
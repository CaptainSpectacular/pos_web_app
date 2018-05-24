# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'app/services/master_service'
require_relative 'app/services/tcg_player_service'
require_relative 'config/environment'
require_relative 'config/application'
task :fetch_cards do
  CARDS = ['Dream Halls', 'Food Chain']
  CARDS.each do |card|
    Card.write_from_query(card)
  end
end

Rails.application.load_tasks

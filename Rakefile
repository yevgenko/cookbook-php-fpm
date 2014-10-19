begin
  require 'kitchen/rake_tasks'
  Kitchen::RakeTasks.new
rescue LoadError
  puts ">>>>> Kitchen gem not loaded, omitting tasks" unless ENV['CI']
end

begin
  require 'stove/rake_task'
  Stove::RakeTask.new
rescue LoadErro
  pust ">>>>> Stove gem not loaded, omitting tasks" unless ENV['CI']
end

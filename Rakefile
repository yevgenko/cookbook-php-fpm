namespace 'sandbox' do
  desc 'Check if Sandbox has been initialized'
  task :check do
    if File.directory?('.sandbox')
      puts 'Checking Sandbox: Available!'
    else
      abort("Please, initialize sandbox: `rake sandbox:init`")
    end
  end

  desc 'Initialize Sandbox'
  task :init, [:force] do |t, args|
    unless File.directory?('.sandbox') and args.force != 'force'
      sh %{ rm -rf .sandbox }
      sh %{ git clone git://github.com/opscode/chef-repo.git .sandbox }
      mkdir('.sandbox/.chef')
      ::File.open('.sandbox/.chef/knife.rb', "w") do |f|
        f.puts <<-EOH
current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
cache_type               'BasicFile'
cache_options( :path => "\#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["\#{current_dir}/../cookbooks"]
EOH
      end
      Rake::Task['sandbox:dependencies'].invoke
    end
  end

  desc 'Copy current cookbook files into Sandbox'
  task :cookbook => ["check"] do
    dest_dir = '.sandbox/cookbooks/php-fpm'
    puts "Copying cookbook to #{dest_dir}:"
    FileUtils.mkdir_p dest_dir
    Dir.new('.').each do |file|
      if file !~ /^\./
        puts " - #{file}"
        FileUtils.cp_r file, '.sandbox/cookbooks/php-fpm'
      end
    end
  end

  desc 'Install Cookbook Dependencies'
  task :dependencies => ["check"] do
    require 'chef/cookbook/metadata'
    md = Chef::Cookbook::Metadata.new
    md.from_file('metadata.rb')
    pwd = Dir.pwd
    Dir.chdir("#{pwd}/.sandbox") # chef repo
    md.dependencies.each do |cookbook, version|
      # Doesn't do versions.. yet
      sh %{ knife cookbook site install #{cookbook} }
    end
    # Install nginx, so we can play with
    sh %{ knife cookbook site install nginx }
    Dir.chdir(pwd)
  end

  desc 'Startup Sandbox'
  task :up => ["cookbook"] do
    begin
      sh %{ vagrant up }
    rescue
      abort "TIP: use `rake sandbox:provision` to continue"
    end
  end

  desc 'Provision Sandbox'
  task :provision => ["cookbook"] do
    sh %{ vagrant provision }
  end

  desc 'Destroy Sandbox'
  task :destroy do
    sh %{ vagrant destroy }
  end

  desc 'SSH to Sandbox instance'
  task :ssh do
    sh %{ vagrant ssh }
  end
end

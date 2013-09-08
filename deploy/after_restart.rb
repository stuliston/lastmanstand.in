# coding: utf-8
Chef::Log.info("Running deploy/after_restart.rb...")

rails_env = new_resource.environment["RAILS_ENV"]
Chef::Log.info("Applying crontab")

execute "whenever -w" do
  command "whenever -w"
end
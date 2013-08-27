
action :create do


  node['watcher']['jobs'] << { 
                                "name" => new_resource.name,
                                "label" => new_resource.label,
                                "path" => new_resource.path,
                                "exclude" => new_resource.exclude,
                                "monitor" => new_resource.monitor,
                                "recursive" => new_resource.recursive,
                                "command" => new_resource.command
                              }

  template "/root/.watcher/jobs.yml" do
    source "jobs.yml.erb"
    notifies :restart, "service[watcher]"
    cookbook "watcher"
  end
  
end

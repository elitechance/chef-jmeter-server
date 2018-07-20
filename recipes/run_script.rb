remote_file '/home/apps/jmeter/jmeter-current.jmx' do
  source node['jmeter']['script']
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

execute 'Run Jmeter Script' do
  command '/home/apps/jmeter/apache-jmeter-4.0/bin/jmeter -n -t /home/apps/jmeter/jmeter-current.jmx -l /home/apps/jmeter/results.log'
  action :run
end

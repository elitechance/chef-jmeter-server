jmeter_path = node['jmeter']['path']

directory jmeter_path do
  recursive true
  action :create
end

remote_file 'Download jMeter 4.0' do
  source node['jmeter']['app']['url']
  path "#{jmeter_path}/jmeter.zip"
  action :create
end

execute 'Remove old jmeter' do
  command "rm -rf #{jmeter_path}/apache-jmeter*"
end

execute 'Extract jMeter' do
  command "cd #{jmeter_path} && unzip ./jmeter.zip"
end

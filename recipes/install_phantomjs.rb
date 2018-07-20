phantomjs_path = node['phantomjs']['path'];
package 'bzip2' do
  action :install
end

directory phantomjs_path do
  recursive true
  action :create
end

remote_file 'Download jMeter 4.0' do
  source 'https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2'
  path "#{phantomjs_path}/phantomjs-2.1.1-linux-x86_64.tar.bz2"
  action :create
end

execute 'Extract PhantomJs' do
  command "cd #{phantomjs_path}/ && tar xjvf phantomjs-2.1.1-linux-x86_64.tar.bz2"
  action :run
end

package 'Install Java 8' do
  package_name 'java-1.8.0-openjdk-devel'
end

execute 'Set Java 8' do
  command 'alternatives --set java /usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/java'
end

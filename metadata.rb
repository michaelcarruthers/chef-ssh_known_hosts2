maintainer        "Erik Hollensbe"
maintainer_email  "erik+chef@hollensbe.org"
license           "Apache 2.0"
description       "backups with hardlink support with rsync and ssh."
long_description  IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version           "0.1.1"

# FIXME add meta for provider

%w{ debian ubuntu }.each do |os|
  supports os
end

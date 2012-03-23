def initialize(*args)
  super
  @action = :modify
end

actions :modify, :delete

attribute :host,      :kind_of => [String, Array],  :name_attribute => true
attribute :key,       :kind_of => String,           :regex => /^ssh-[rd]sa \S+/,          :required => true
attribute :filename,  :kind_of => String,           :default => "/root/.ssh/known_hosts"
attribute :owner,     :kind_of => String,           :default => "root"
attribute :group,     :kind_of => String,           :default => "root"

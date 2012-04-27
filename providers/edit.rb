require 'tempfile'
require 'fileutils'

action :modify do

  updated = false

  @res.host.each do |host|
    @keys[host] = @res.key
    updated = true
  end

  if updated
    write_known_hosts(@res.filename)
    @res.updated_by_last_action(true)
  end

end

action :delete do

  updated = false

  @res.host.each do |host|
    if @keys.delete(host)
      updated = true
    end
  end

  if updated
    write_known_hosts(@res.filename)
    @res.updated_by_last_action(true)
  end

end

def write_known_hosts(filename)
  # Use a tempfile to preserve atomicity for other programs.
  t = Tempfile.new('known_hosts')

  @keys.group_by { |k,v| v }.each do |k,v|
    t.puts [v.map { |x| x[0] }.join(","), k].join(" ")
  end

  t.close

  FileUtils.mv(t.path, filename)
  FileUtils.chown(@res.owner, @res.group, filename)
  FileUtils.chmod(00600, filename)
end

def parse_known_hosts(filename)
  keys = { }

  return keys unless ::File.exist?(filename)

  ::File.read(::File.expand_path(filename)).each_line.with_index do |line, index|
    info, key = line.split(" ", 2)
    hostname, ipaddr = info.split(",", 2)

    if hostname and !hostname.empty?
      keys[hostname] = key
    end

    if ipaddr and !ipaddr.empty?
      keys[ipaddr] = key
    end
  end

  return keys
end

def load_current_resource
  @res = new_resource
  @keys = parse_known_hosts(@res.filename)

  # box host and filename
  @res.host([@res.host]) if @res.host.kind_of?(String)
end

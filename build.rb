require 'yaml'

data = YAML.load_file('versions.yaml')

Dir.mkdir("built") unless Dir.exist?("built")

versions = data['versions']
versions.each do |version|
  `git clone -q --depth 1 -b #{version} https://github.com/mruby/mruby.git mruby-#{version}`
    Dir.chdir("mruby-#{version}") do
        `rake`
        `cp build/host/bin/mruby ../built/mruby-#{version}`
        `cp LICENSE ../built/mruby-#{version}-LICENSE`
        `cp LEGAL ../built/mruby-#{version}-LEGAL`
    end
end

# Standard Ruby tests of ERB rendering and project structure; not a Chef convergence test.
require 'erb'
require 'pathname'
root = Pathname.new(__dir__).parent
attrs = root.join('attributes/default.rb').read
recipe = root.join('recipes/default.rb').read
template_file = root.join('templates/default/settings.conf.erb')
metadata = root.join('metadata.rb').read

def ensure_check(label)
  raise "FAIL: #{label}" unless yield
  puts "PASS: #{label}"
end

@service = 'training-dashboard'
@port = 8080
@enabled = false
output = ERB.new(template_file.read).result(binding)
checks = {
  'cookbook metadata name' => metadata.include?("name 'opencert_lab'"),
  'version declared' => metadata.include?("version '0.1.0'"),
  'Chef version declared' => metadata.include?("chef_version '>= 18.0'"),
  'attribute defaults exist' => attrs.include?("default['opencert_lab']"),
  'default service' => attrs.include?("'training-dashboard'"),
  'default port' => attrs.include?('8080'),
  'default boolean' => attrs.include?('= false'),
  'recipe directory resource' => recipe.include?('directory lab_dir do'),
  'recipe template resource' => recipe.include?('template "#{lab_dir}/settings.conf" do'),
  'recipe template source' => recipe.include?("source 'settings.conf.erb'"),
  'recipe variables hash' => recipe.include?('variables('),
  'recipe service attribute' => recipe.include?("node['opencert_lab']['service']"),
  'recipe port attribute' => recipe.include?("node['opencert_lab']['port']"),
  'recipe enabled attribute' => recipe.include?("node['opencert_lab']['enabled']"),
  'output service line' => output.include?("service=training-dashboard\n"),
  'output port line' => output.include?("port=8080\n"),
  'output enabled line' => output.include?("enabled=false\n"),
  'output exactly four lines' => output.lines.length == 4,
  'template uses instance variables' => template_file.read.scan(/<%=\s*@\w+\s*%>/).length == 3,
  'no production path resource' => !recipe.include?('/etc/') && !recipe.include?('/usr/local')
}
checks.each { |label, result| ensure_check(label) { result } }
puts "#{checks.length} ERB/cookbook structural checks passed (Ruby #{RUBY_VERSION})"

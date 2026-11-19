# Example Chef Infra recipe, use only in a disposable sandbox.
# Running Chef Infra Client can modify local files; do not execute on production systems.
lab_dir = '/tmp/opencert-chef-infra-003'

directory lab_dir do
  mode '0755'
  action :create
end

template "#{lab_dir}/settings.conf" do
  source 'settings.conf.erb'
  mode '0644'
  variables(
    service: node['opencert_lab']['service'],
    port: node['opencert_lab']['port'],
    enabled: node['opencert_lab']['enabled']
  )
  action :create
end

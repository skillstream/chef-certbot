template '/usr/local/sbin/certbot-renew.sh' do
  mode 0755
end

cron_d node['certbot']['cron_name'] do
  command '/usr/local/sbin/certbot-renew.sh'
  user 'root'
  (node['certbot']['cron'] || node['certbot']['default_cron']).each do |key, value|
    send key, value
  end
end

require 'yaml'
require 'optparse'
require 'twitter-ads'
require 'terminal-table'

params = ARGV.getopts('', 'ad_account:', 'audience_id:')
credentials = YAML.load_file(File.dirname(__FILE__) + '/../twitter-credentials.yml')
ad_account_id = params['ad_account'] || credentials['twitter-ad-account-id']
ad_audience_id = params['audience_id']

ad_account = TwitterAds::Client.new(
  credentials['twitter-app-consumer-key'],
  credentials['twitter-app-consumer-secret'],
  credentials['twitter-users-token'],
  credentials['twitter-users-token-secret']
).accounts(ad_account_id)

audiences = ad_audience_id ? [ad_account.tailored_audiences(ad_audience_id)] : ad_account.tailored_audiences
rows = audiences.map do |audience|
  status = audience.status
  [ audience.id,
    audience.name,
    audience.list_type,
    audience.reasons_not_targetable.join("\n"),
    status.reverse.map{ |s| "#{s[:state]}(#{s[:operation]})" }.join("\n")
  ]
end

puts Terminal::Table.new(headings: ['id', 'name', 'list_type', 'reasons', 'statuses'], rows: rows)

require "hover"
require "csv"

username = ENV['HOVER_USER'] or fail "No hover username supplied"
password = ENV['HOVER_PASS'] or fail "No hover password supplied"

api = Hover::Api.new(username, password)

domains = api.dns

CSV.open("./hover_export.csv", "w+b") do |csv|
    csv << ["zone_name", "record_name", "record_type", "content", "hover_can_revert", "hover_id", "hover_is_default", "ttl"]
end
CSV.open("./hover_export.csv", "a+") do |csv|
  domains.each do |dom|
    dom["entries"].each do |e|
      csv << [dom["domain_name"], e["name"], e["type"], e["content"], e["can_revert"], e["id"], e["is_default"], e["ttl"]]
    end
  end
end

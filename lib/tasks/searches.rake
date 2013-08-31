desc "Remove search older than a week"

task remove_search: :environment do
  Search.delete_all
end
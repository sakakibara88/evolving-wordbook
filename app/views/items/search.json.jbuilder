if @search == "not-search"
  json.item "not-search"
else
  json.array! @search do |s|
    json.item s.item
    json.title_id s.title_id
    json.item_id s.id
  end
end
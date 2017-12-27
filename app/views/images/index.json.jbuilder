json.images do
  json.array! @images, partial: 'images/image', as: :image  
end


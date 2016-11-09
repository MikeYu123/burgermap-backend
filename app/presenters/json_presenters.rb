module JsonPresenters
  extend self

  def present_card(card)
    {
      'id' => card.id,
      'title' => card.title,
      'img' => card.image,
      'lat' => card.lat,
      'lng' => card.lng,
      'description' => card.description,
      'link' => card.link,
      'mark' => card.mark,
      'shortDescription' => card.short_description
    }
  end

end

class MarkerFilterQuery
  def initialize(relation = PlaceReview.all)
    @relation = relation
  end

  def filter(args = {})
    filter_lat_min(args[:lat_min])
    filter_lng_min(args[:lng_min])
    filter_lat_max(args[:lat_max])
    filter_lng_max(args[:lng_max])
    @relation
  end

  private
  # TODO: DRY and side-effects
    def filter_lat_min(lat_min)
      if lat_min
        @relation = @relation.where('lat >= ?', lat_min.to_f)
      end
    end

    def filter_lat_max(lat_max)
      if lat_max
        @relation = @relation.where('lat <= ?', lat_max.to_f)
      end
    end

    def filter_lng_min(lng_min)
      if lng_min
        @relation = @relation.where('lng >= ?', lng_min.to_f)
      end
    end

    def filter_lng_max(lng_max)
      if lng_max
        @relation = @relation.where('lng <= ?', lng_max.to_f)
      end
    end
end

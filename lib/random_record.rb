module RandomRecord

  def self.included(base)
    base.extend ActiveSupport::Concern
    base.extend(ExtendedMethods)

    base.field :random, type: Float, default: rand

    base.before_save { |doc| doc.random = rand }
  end

  module ExtendedMethods

    def random_record(limit: 10)
      where(:random.ne => nil).order_by([ [ :_id, :random ].sample, [ :asc, :desc ].sample ]).limit(limit)
    end

  end

end
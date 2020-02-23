class Post < ApplicationRecord
    belongs_to :category
    belongs_to :user, counter_cache: true
    has_many :comments, dependent: :destroy
    has_many_attached :images
    validates :title, presence: true,
                    length: { minimum: 5 }
    validates :category_id, presence: true
    validates :user_id, presence: true


      def self.by_category(category_id)
        where(category_id: category_id)
      end

      def self.by_date(date)
        if date == "Oldest"
          order(created_at: :asc)
        elsif date == "Newest"
          order(created_at: :desc)
      end
    end
        
end

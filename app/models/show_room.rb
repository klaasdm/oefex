class ShowRoom < ActiveRecord::Base

 default_scope :order => 'title'

belongs_to :user
has_many :line_items
  has_many :ratings
    has_many :raters, :through => :ratings, :source => :users
  before_destroy :ensure_not_referenced_by_any_line_item
  has_attached_file :pic,
                    :styles => {:original => "600x400>", :medium =>"150x150", :current => "600x400>"},
                    :url => "/images/uploaded_logos/:id/:style/:basename.:extension",
                    :path => "#{Rails.root}/public/images/uploaded_logos/:id/:style/:basename.:extension"
def average_rating
    @value = 0
    self.ratings.each do |rating|
        @value = @value + rating.value
    end
    if self.ratings.size.zero?
      "this item has not been rated yet"
   else
    @total = self.ratings.size
    @value.to_f / @total.to_f
       end
end

  private

    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.count.zero?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end

end

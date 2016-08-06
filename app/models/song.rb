class Song < ActiveRecord::Base
  validates :title , presence: true , uniqueness: { scope: [:release_year , :artist_name] }
  validates :released , inclusion: { in: [ true , false ] }
  validates :artist_name, presence: true
  validate :validate_release_year

  def validate_release_year
      if released && ( !release_year || release_year > Time.now.year )
        errors.add(:release_year , "Try again, mistakes were made.")
      end
  end

end

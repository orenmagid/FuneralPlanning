class FuneralHome < ApplicationRecord
  has_many :funerals

  validates :name, uniqueness: true, presence: true
  validates :address, presence: true
  validates :phone, presence: true
  validates_format_of :phone,
    :with => /\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*/

end

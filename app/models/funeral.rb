class Funeral < ApplicationRecord
  belongs_to :funeral_home
  belongs_to :religion
  has_one :user_funeral, :dependent => :destroy
  has_one :user, through: :user_funeral
  accepts_nested_attributes_for :funeral_home, reject_if: proc { |attributes| attributes['name'].blank? }


  def self.most_popular_funeral_home
    funerals = Funeral.all
    funeral_home_hash = {}
    funerals.each do |funeral|
      if funeral_home_hash[funeral.funeral_home.name]
        funeral_home_hash[funeral.funeral_home.name] += 1
      else
        funeral_home_hash[funeral.funeral_home.name] = 1
      end
    end
    funeral_home_hash.sort_by {|key, value| value}.reverse
  end

  def self.total_count_of_funerals
    funerals = Funeral.all
    total_count = 0
    funerals.each do |funeral|
      total_count += 1
    end
    total_count
  end

  def self.service_type_count
    arr = self.service_type_array
    service_hash = arr.each_with_object(Hash.new(0)) {|service, hash| hash[service] += 1}
  end

  def self.service_type_by_religion
    service_religion_hash = {}
    self.all.each do |funeral|
      if !service_religion_hash[funeral.service_type]
        service_religion_hash[funeral.service_type] = {funeral.religion.name => 1}
      elsif !service_religion_hash[funeral.service_type][funeral.religion.name]
        service_religion_hash[funeral.service_type][funeral.religion.name] = 1
      else
        service_religion_hash[funeral.service_type][funeral.religion.name] += 1
      end
    end
    service_religion_hash
  end


  def self.service_type_array
    self.all.collect {|funeral| funeral.service_type}
  end

end

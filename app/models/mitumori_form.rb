class MitumoriForm
    include ActiveModel::Model
  
    attr_accessor :mitumori_name, :name, :email, :radio, :detail
    
    validates :mitumori_name, :name, :email, :detail, presence: true
  end 
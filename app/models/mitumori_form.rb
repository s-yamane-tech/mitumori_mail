class MitumoriForm
    include ActiveModel::Model
    
    # 使い捨てカラム
    attr_accessor :mitumori_name, :name, :email, :radio, :detail
    
    # 未入力チェック
    validates :mitumori_name, :name, :email, :detail, presence: true
  end 
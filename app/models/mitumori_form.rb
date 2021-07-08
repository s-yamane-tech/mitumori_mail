class MitumoriForm
    include ActiveModel::Model
    include ActiveRecord::AttributeAssignment
    
    # 使い捨てカラム
    attr_accessor :genba_name, 
                  :sintiku,
                  :kodate,
                  :floor,
                  :syohin_name,
                  :size, 
                  :door_iti,
                  :grade,
                  :mitumori_kibo_date, 
                  :remark, 
                  :to_mail_address, 
                  :from_mail_address
    
    # 未入力チェック
    # validates :genba_name, 
    #           :size, 
    #           :remark, 
    #           :to_mail_address, 
    #           :from_mail_address, 
    # presence: true
  end 
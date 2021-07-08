class MitumoriFormsController < ApplicationController
    # ログイン後のみアクセス可能
    before_action :authenticate_user!

    # メールフォーム入力画面遷移時
    def new
        @mitumori_form = MitumoriForm.new
        @mitumori_image = MitumoriImage.new
    end

		 # 確認画面遷移時
    def confirm
        @mitumori_image = MitumoriImage.new(image_confirm_params[:mitumori_image])
        @mitumori_form = MitumoriForm.new(mitumori_form_params)

        # 入力チェック
        if @mitumori_form.valid?
          render :confirm
        else
          render :new
        end
    end

		# メール送信及び添付画像保存
		def complete
      # 添付画像保存      
      @mitumori_form = MitumoriForm.new(mitumori_form_params) 
      @mitumori_image = MitumoriImage.new(image_complete_params[:mitumori_image])
      @mitumori_image.genba_name = @mitumori_form.genba_name
      @mitumori_image.save!
			
      # メール送信
    	MitumoriMailMailer.send_email(@mitumori_form).deliver
      redirect_to root_path
		end

		# 入力したデータをパラメータとしてまとめる
  	private
    # 見積メール送信用パラメータ
  	def mitumori_form_params
    	params.require(:mitumori_form)
            .permit(:genba_name, 
                    :sintiku, 
                    :kodate, 
                    :floor, 
                    :size, 
                    :syohin_name, 
                    :door_iti, 
                    :grade, 
                    :mitumori_kibo_date, 
                    :remark, 
                    :to_mail_address, 
                    :from_mail_address
                  )
  	end

    # 確認画面用添付画像パラメータ
    def image_confirm_params
      params.require(:mitumori_form)
            .permit(mitumori_image:[:image])
    end

    # メール送信及び画像保存時の添付画像用パラメータ
    def image_complete_params
      params.require(:mitumori_form)
            .permit(mitumori_image:[:image_cache])
    end 
end

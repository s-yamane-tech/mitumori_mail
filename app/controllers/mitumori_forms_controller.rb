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
        if @mitumori_form.valid?
          render :confirm
        else
          render :new
        end
    end

		# 送信完了画面遷移時
		def complete
			@mitumori_form = MitumoriForm.new(mitumori_form_params)    
    	MitumoriMailMailer.send_email(@mitumori_form).deliver

    	# 完了画面を表示
    	render :action => 'complete'
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
end

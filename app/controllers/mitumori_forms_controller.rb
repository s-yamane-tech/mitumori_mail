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
  	def mitumori_form_params
    	params.require(:mitumori_form).permit(:genba_name, :sintiku, :kodate, :floor, :size, :syohin_name, :door_iti, :grade, :mitumori_kibo_date, :remark, :to_mail_address, :from_mail_address)
  	end
end

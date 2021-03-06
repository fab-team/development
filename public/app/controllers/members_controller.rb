class MembersController < ApplicationController
  before_action :login_required

  # 会員一覧
  def index
    @members = Member.order("number")
    .paginate(page: params[:page], per_page: 15)
  end

  # 検索
  def search
    @members = Member.search(params[:q])
    .paginate(page: params[:page], per_page: 15)
    render "index"
  end

  # 会員情報の詳細
  def show
    @member = Member.find(params[:id])
    if params[:format].in?(["jpg", "png", "gif"])
      send_image
    else
      render "show"
    end
  end

  # 新規作成フォーム
  # def new
  #   @member = Member.new(birthday:Date.new(1980,1,1))
  #   @member.build_image
  # end

  # # 更新フォーム
  # def edit
  #   @member =Member.find(params[:id])
  #   @member.build_image unless @member.image
  # end

  # # 会員の新規登録
  # def create
  #   @member = Member.new(member_params)
  #   if @member.save
  #     redirect_to @member, notice: "会員を登録しました。"
  #   else
  #     render "new"
  #   end
  # end

  # # 会員情報の更新
  # def update
  #   @member = Member.find(params[:id])
  #   # assign_attributesメゾットでフォームからデータをセット
  #   @member.assign_attributes(member_params)
  #   if @member.save
  #     redirect_to @member, notice: "更新完了"
  #   else
  #     render "edit"
  #   end
  # end

  # # 会員の削除
  # def destroy
  #   @member = Member.find(params[:id])
  #   @member.destroy
  #   redirect_to :members, notice: "削除完了"
  # end

  private
  # def member_params
  #   attrs = [:number, :name, :full_name, :gender, :birthday, :email, :password, :password_confirmation]
  #   attrs << :administrator if current_member.administrator?
  #   attrs << { image_attributes: [:_distroy, :id, :uploaded_image] }
  #   params.require(:member).permit(attrs)
  # end

  # 画像送信
  def send_image
    if @member.image.present?
      send_data @member.image.data,
        type: @member.image.content_type, disposition: "inline"
    else
      raise NotFound
    end
  end
end

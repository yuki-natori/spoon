class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_one :card
  has_one :profile

  validates :nickname,
    presence: true,
    length: { maximum: 20 }

  validates :last_name,
    presence: true,
    length: { maximum: 35 }

  validates :first_name,
    presence: true,
    length: { maximum: 35 }

  validates :last_name_kana,
    presence: true,
    length: { maximum: 35 }

  validates :first_name_kana,
    presence: true,
    length: { maximum: 35 }

  validates :birthday,
    presence: true

  validates :email,
    presence: true,
    uniqueness: { message: "メールアドレスに誤りがあります。ご確認いただき、正しく変更してください。" },
    format: { with: /\A[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*[a-zA-Z]+\z/, allow_blank: true, message: "フォーマットが不適切です" }

  validates :password,
    presence: true,
    confirmation: { message: "パスワードとパスワード（確認）が一致しません" },
    length: { in: 7..128, message: "パスワードは7文字以上128文字以下で入力してください" },
    format: { with: /\A(?=.*[^\d])+/, allow_blank: true, message: "数字のみのパスワードは設定できません" }

  def self.from_omniauth(auth)
    sns = SnsCredential.where(uid: auth["uid"], provider: auth["provider"]).first
    if sns.present?
      user = sns.user
    else
      user = User.where(email: auth["info"]["email"]).first
      if user.present?
        SnsCredential.create(uid: auth["uid"], provider: auth["provider"], user_id: user.id)
        user
      else
        user
      end
    end
  end
end

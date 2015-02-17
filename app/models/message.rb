class Message < ActiveRecord::Base
  validates_presence_of :username
  validates_presence_of :street
  validates_presence_of :city
  validates_presence_of :message
  validates :zip, format: { with: /\A\d{5}\z|\A\d{5}\-\d{4}\z/, message: "must be 5 digits"}
  validates :state, inclusion: {in: %w(AL AK AZ AR CA CO CT DE DC FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY),
    message: "%{value} is not a valid state" }
  validates :phone, format: {with: /\A[1-9][0-9]{9}\z/, message: "must be 10 digits"}
  validates :email, format: {with: /[a-z0-9\-_]+\@[a-z0-9\-_]+\.[a-z]{2,6}/i,message: "might be invalid" }
  before_validation :normalize_phone

  protected
  def normalize_phone
    if phone.present?
      phone.gsub!(/[\s\(\)\-\.]/,'') # remove spaces, parens, hyphen
      phone.gsub!(/x.*\z/,'') # removes things like x12345
    end
  end
end

# AL AK AZ AR CA CO CT DE DC FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY

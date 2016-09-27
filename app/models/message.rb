class Message < ActiveRecord::Base
  before_create :send_sms

private

  def send_sms
    response = RestClient::Request.new(
      :method => :post,
      :url => 'https://AC9322063518a8907f71daec9f039363d0:43bd293c6dc9763a43b5715e18777a6d@api.twilio.com/2010-04-01/Accounts/AC9322063518a8907f71daec9f039363d0/Messages.json',
      :user =>'AC9322063518a8907f71daec9f039363d0',
      :password => '43bd293c6dc9763a43b5715e18777a6d',
      :payload => { :Body => body,
                    :To => from,
                    :From => to }
    ).execute
  end
end

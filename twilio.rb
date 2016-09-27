TWILIO REST API
https://www.twilio.com/docs/api/rest

REST API: SENDING SMS OR MMS
https://www.twilio.com/docs/api/rest/sending-messages#messaging-services
Rest Client Gem
https://github.com/rest-client/rest-client


RestClient.post 'http://example.com/resource', {param1: 'one', nested: {param2: 'two'}}

require 'rest-client'
RestClient.post(
  'https://AC9322063518a8907f71daec9f039363d0:43bd293c6dc9763a43b5715e18777a6d@api.twilio.com/2010-04-01/Accounts/AC9322063518a8907f71daec9f039363d0/Messages.json',
  :Body => 'Hello World!',
  :To => '5416780529',
  :From => '5416394132'
)


response = RestClient::Request.new(
  :method => :post,
  :url => 'https://AC9322063518a8907f71daec9f039363d0:43bd293c6dc9763a43b5715e18777a6d@api.twilio.com/2010-04-01/Accounts/AC9322063518a8907f71daec9f039363d0/Messages.json',
  :user =>'AC9322063518a8907f71daec9f039363d0',
  :password => '43bd293c6dc9763a43b5715e18777a6d',
  :payload => { :Body => 'Hello JSON World!',
                :To => '5416780529',
                :From => '5416394132'
  }
).execute

class Message
  def initialize(attributes)
    @to = attributes['to']
    @from = attributes['from']
    @body = attributes['body']
    @status = attributes['status']
  end
end

response = RestClient::Request.new(
  :method => :get,
  :url => 'https://AC9322063518a8907f71daec9f039363d0:43bd293c6dc9763a43b5715e18777a6d@api.twilio.com/2010-04-01/Accounts/AC9322063518a8907f71daec9f039363d0/Messages.json',
  :user =>'AC9322063518a8907f71daec9f039363d0',
  :password => '43bd293c6dc9763a43b5715e18777a6d'
).execute

parsed_response = JSON.parse(response)
messages_data = parsed_response['messages']
messages = messages_data.map { |data| Message.new(data) }

JSON
curl -X POST 'https://api.twilio.com/2010-04-01/Accounts/AC9322063518a8907f71daec9f039363d0/Messages.json' \
--data-urlencode 'To=+15558675309'  \
--data-urlencode 'From=+15017250604'  \
--data-urlencode 'Body=This is the ship that made the Kessel Run in fourteen parsecs?'  \
-d 'MediaUrl=https://c1.staticflickr.com/3/2899/14341091933_1e92e62d12_b.jpg' \
-u AC9322063518a8907f71daec9f039363d0:your_auth_token

RUBY

require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'AC9322063518a8907f71daec9f039363d0'
auth_token = 'your_auth_token'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create({
  :from => '+15017250604',
  :to => '+15558675309',
  :body => 'This is the ship that made the Kessel Run in fourteen parsecs?',
  :media_url => 'https://c1.staticflickr.com/3/2899/14341091933_1e92e62d12_b.jpg',
})

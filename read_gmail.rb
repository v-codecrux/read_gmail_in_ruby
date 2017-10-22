require 'google/apis/gmail_v1'
require 'date'

def get_my_message(identity = {})
	client = Signet::OAuth2::Client.new(access_token: identity[:token], refresh_token: identity[:refresh_token], token_credential_uri: 'https://accounts.google.com/o/oauth2/token', client_id: ENV['GOOGLE_APP_ID'], client_secret: ENV['GOOGLE_APP_SECRET'])

	client.grant_type = 'refresh_token'
	client.scope = 'https://www.googleapis.com/auth/gmail.readonly'
	client.refresh!
	service = Google::Apis::GmailV1::GmailService.new
	service.authorization = client
	user_id = 'me'

	time_now = DateTime.now
	time_hour_before = (time_now - 1.0/24).to_time

	messages = service.list_user_messages(user_id, include_spam_trash: true, q:"after:#{time_hour_before.to_i} before:#{time_now.to_time.to_i}" ).messages
	if !messages.nil?
		messages.each do |msg|
			message = service.get_user_message(user_id, msg.id, format: 'full')
			# message.payload.parts will give you email body and message.payload.headers will give you headers like "to", "from", "subject", and many other headers.
			# There can be a better way to read the content of mails. 
			#
		end
	end
end

get_my_message({token: 'access token of user', refresh_token: 'refresh token of user'})
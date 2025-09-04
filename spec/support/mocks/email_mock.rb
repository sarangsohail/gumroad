# Email service mocking for offline testing

# SendGrid API
WebMock.stub_request(:post, /api\.sendgrid\.com/).to_return(
  status: 202,
  body: '',
  headers: { 'X-Message-Id' => 'test_message_id' }
)

# Resend API
WebMock.stub_request(:post, /api\.resend\.com/).to_return(
  status: 200,
  body: { id: 'test_email_id' }.to_json,
  headers: { 'Content-Type' => 'application/json' }
)

# Configure ActionMailer for testing
RSpec.configure do |config|
  config.before(:each) do
    ActionMailer::Base.deliveries.clear
    ActionMailer::Base.delivery_method = :test
  end
end
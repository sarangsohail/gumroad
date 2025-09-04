# Third-party service mocking

# Google OAuth
WebMock.stub_request(:any, /oauth2\.googleapis\.com/).to_return(
  status: 200,
  body: { access_token: 'test_token' }.to_json
)

# Facebook Graph API
WebMock.stub_request(:any, /graph\.facebook\.com/).to_return(
  status: 200,
  body: { id: 'test_user' }.to_json
)

# Twitter API
WebMock.stub_request(:any, /api\.twitter\.com/).to_return(
  status: 200,
  body: { id: 'test_user' }.to_json
)

# Discord API
WebMock.stub_request(:any, /discord\.com\/api/).to_return(
  status: 200,
  body: { id: 'test_channel' }.to_json
)

# OpenAI API
WebMock.stub_request(:any, /api\.openai\.com/).to_return(
  status: 200,
  body: { choices: [{ text: 'test response' }] }.to_json
)
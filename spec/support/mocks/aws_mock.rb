# AWS services mocking for offline testing

# S3 API
WebMock.stub_request(:any, /s3\.amazonaws\.com/).to_return(
  status: 200,
  body: '<?xml version="1.0" encoding="UTF-8"?><ListBucketResult></ListBucketResult>',
  headers: { 'Content-Type' => 'application/xml' }
)

# SNS API
WebMock.stub_request(:any, /sns\..*\.amazonaws\.com/).to_return(
  status: 200,
  body: '<?xml version="1.0" encoding="UTF-8"?><PublishResponse></PublishResponse>',
  headers: { 'Content-Type' => 'application/xml' }
)

# SQS API
WebMock.stub_request(:any, /sqs\..*\.amazonaws\.com/).to_return(
  status: 200,
  body: '<?xml version="1.0" encoding="UTF-8"?><SendMessageResponse></SendMessageResponse>',
  headers: { 'Content-Type' => 'application/xml' }
)
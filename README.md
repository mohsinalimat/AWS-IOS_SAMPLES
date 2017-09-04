# AWS-IOS_SAMPLES
AWS Samples in Swift 3 
***
## Cognito 
Amazon Cognito Identity provides secure access to AWS services. 
***
## S3
Amazon Simple Storage Service provides flexible object storage. 

## Examples include:
TransferManager and TransferUtility

### TransferManager vs TransferUtility
The differences are as follows.

Use `TransferUtility` to:

Make background file or data transfers that complete even if the system suspends an app invoking the transfer
Transfer binary data to a file with out saving a file at the transfer source location first.

Use `TransferManager` to make file transfers that happen while the app is in the foreground.

Whenever possible, TransferManager uploads are broken up into multiple pieces. Several pieces can be sent in parallel to provide better throughput that is resilient to I/O errors.

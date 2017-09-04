##Should I Use TransferManager or TransferUtility?

Both the Amazon S3 TransferManager and TransferUtitliy classes make it easy for you to upload and download files from Amazon S3 while optimizing for performance and reliability. Both hide the complexity of making asynchronous file transfers behind simple APIs. Both provide the ability to pause, resume, and cancel file transfers.

The differences are as follows.

Use `TransferUtility` to:

Make background file or data transfers that complete even if the system suspends an app invoking the transfer
Transfer binary data to a file with out saving a file at the transfer source location first.

Use `TransferManager` to:
Make file transfers that happen while the app is in the foreground.

Whenever possible, TransferManager uploads are broken up into multiple pieces. Several pieces can be sent in parallel to provide better throughput that is resilient to I/O errors.

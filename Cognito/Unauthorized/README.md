# Unauthorized federated identies

## Setup
1. Sign into AWS and go to https://console.aws.amazon.com/cognito/

2. Select "Manage Federated Identities"

3. "Create new identity pool". Give the identity pool a name and check "Enable access to unauthenticated identities" under "Unauthenticated identities"

4. Create an xcode project

5. Create a Podfile in the xcode project `pod init`

6. Add `pod AWSCore` & `pod AWSCognito`

7. Install pods `pod install`

8. Open your xcworkspace file `open *xcworkspace`

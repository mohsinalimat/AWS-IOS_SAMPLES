### For setup instructions see Cognito/unauthorized instructions

## How to add user sync

1. Set up cognito configuration 

2. Create a dataset `let dataset = AWSCognito.default().openOrCreateDataset("DATASET NAME")`

3. Set key/value pair for dataset `dataset.setString("VALUE", forKey:"KEY")

4. Sync data with AWS `dataset.synchronize()'

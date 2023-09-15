# 20230907-EdwardDuclervil-NYCSchools
A Simple Application Displaying Schools in NYC along with additional info


## Architecture and Frameworks
- This project uses an MVVM Architecture
- It contains a network layer with a network manager to handle API calls
- The program uses Combine, WebKit, & MapKit
- Minimum Requirements: iOS 14.0+


## Security
- The Network Manager uses SSL Pinning to ensure the authenticity and integrity of server certificates during api calls.
- Both SecTrustGetCertificateAtIndex and SecTrustCopyCertificateChain are implemented based on which iOS is available
    - SecTrustGetCertificateAtIndex was deprecated at iOS 15.0
    
    
## Network and Error Handling
- Combine is used to accomplish the API call. 
- A request protocol was created to create the proper URL needed for each Request. 
- The Standard Library 'Error' was extended to handle a few basic api errors, including badURLError, noDataFoundError, dataParseError, responseError

## WebKit and Mapkit
- For every school, Webkit was utilized in order to pull up the website provided in the API
- Simple string manipulation was used to apply proper format for WebKit
    - While not every school site loads, this was confirmed to be a serverside error, rather than code based.
- When a longitude and latitude is provided, MapKit was used to display the location of the school 
- A location manager was implemented, which could provide capabilities for showing current locations, however, it's not required beyond the extension to MKCoordinateRegion


## Screenshots

<img width="421" alt="Simulator Screenshot - iPhone X - 2023-09-08 at 14.14.26" src="https://github.com/EdwardDuc/20230907-EdwardDuclervil-NYCSchools/blob/main/JPMCChallenge/JPMCChallenge/Assets.xcassets/Simulator%20Screenshot%20-%20iPhone%20X%20-%202023-09-08%20at%2014.14.26.imageset/Simulator%20Screenshot%20-%20iPhone%20X%20-%202023-09-08%20at%2014.14.26.png">
<img width="421" alt="Simulator Screenshot - iPhone X - 2023-09-08 at 14.15.16" src="https://github.com/EdwardDuc/20230907-EdwardDuclervil-NYCSchools/blob/main/JPMCChallenge/JPMCChallenge/Assets.xcassets/Simulator%20Screenshot%20-%20iPhone%20X%20-%202023-09-08%20at%2014.15.16.imageset/Simulator%20Screenshot%20-%20iPhone%20X%20-%202023-09-08%20at%2014.15.16.png">
<img width="421" alt="Simulator Screenshot - iPhone X - 2023-09-08 at 14.15.54" src="https://github.com/EdwardDuc/20230907-EdwardDuclervil-NYCSchools/blob/main/JPMCChallenge/JPMCChallenge/Assets.xcassets/Simulator%20Screenshot%20-%20iPhone%20X%20-%202023-09-08%20at%2014.15.54.imageset/Simulator%20Screenshot%20-%20iPhone%20X%20-%202023-09-08%20at%2014.15.54.png">
<img width="421" alt="Simulator Screenshot - iPhone X - 2023-09-08 at 14.16.05" src="https://github.com/EdwardDuc/20230907-EdwardDuclervil-NYCSchools/blob/main/JPMCChallenge/JPMCChallenge/Assets.xcassets/Simulator%20Screenshot%20-%20iPhone%20X%20-%202023-09-08%20at%2014.16.05.imageset/Simulator%20Screenshot%20-%20iPhone%20X%20-%202023-09-08%20at%2014.16.05.png">
<img width="421" alt="Simulator Screenshot - iPhone X - 2023-09-08 at 14.16.23" src="https://github.com/EdwardDuc/20230907-EdwardDuclervil-NYCSchools/blob/main/JPMCChallenge/JPMCChallenge/Assets.xcassets/Simulator%20Screenshot%20-%20iPhone%20X%20-%202023-09-08%20at%2014.16.23.imageset/Simulator%20Screenshot%20-%20iPhone%20X%20-%202023-09-08%20at%2014.16.23.png">
<img width="421" alt="Simulator Screenshot - iPhone X - 2023-09-08 at 14.16.35" src="https://github.com/EdwardDuc/20230907-EdwardDuclervil-NYCSchools/blob/main/JPMCChallenge/JPMCChallenge/Assets.xcassets/Simulator%20Screenshot%20-%20iPhone%20X%20-%202023-09-08%20at%2014.16.35.imageset/Simulator%20Screenshot%20-%20iPhone%20X%20-%202023-09-08%20at%2014.16.35.png">



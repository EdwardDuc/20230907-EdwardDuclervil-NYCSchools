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

<img width="421" alt="SS1" src="https://github.com/EdwardDuc/20230907-EdwardDuclervil-NYCSchools/blob/main/JPMCChallenge/JPMCChallenge/Assets.xcassets/SS1.2023.09.15.14.56.25.imageset/SS1.2023.09.15.14.56.25.png">
<img width="421" alt="SS2" src="https://github.com/EdwardDuc/20230907-EdwardDuclervil-NYCSchools/blob/main/JPMCChallenge/JPMCChallenge/Assets.xcassets/SS3.2023.09.15.14.57.05.imageset/SS3.2023.09.15.14.57.05.png">
<img width="421" alt="SS3" src="https://github.com/EdwardDuc/20230907-EdwardDuclervil-NYCSchools/blob/main/JPMCChallenge/JPMCChallenge/Assets.xcassets/SS2.2023.09.15.14.56.47.imageset/SS2.2023.09.15.14.56.47.png">
<img width="421" alt="SS4" src="https://github.com/EdwardDuc/20230907-EdwardDuclervil-NYCSchools/blob/main/JPMCChallenge/JPMCChallenge/Assets.xcassets/SS4.2023.09.15.14.57.16.imageset/SS4.2023.09.15.14.57.16.png">
<img width="421" alt="SS5" src="https://github.com/EdwardDuc/20230907-EdwardDuclervil-NYCSchools/blob/main/JPMCChallenge/JPMCChallenge/Assets.xcassets/SS5.2023.09.15.14.57.32.imageset/SS5.2023.09.15.14.57.32.png">
<img width="421" alt="SS6" src="https://github.com/EdwardDuc/20230907-EdwardDuclervil-NYCSchools/blob/main/JPMCChallenge/JPMCChallenge/Assets.xcassets/SS6.2023.09.15.14.57.50.imageset/SS6.2023.09.15.14.57.50.png">
<img width="421" alt="SS7" src="https://github.com/EdwardDuc/20230907-EdwardDuclervil-NYCSchools/blob/main/JPMCChallenge/JPMCChallenge/Assets.xcassets/SS7.2023.09.15.14.58.02.imageset/SS7.2023.09.15.14.58.02.png">
<img width="421" alt="SS8" src="https://github.com/EdwardDuc/20230907-EdwardDuclervil-NYCSchools/blob/main/JPMCChallenge/JPMCChallenge/Assets.xcassets/SS8.2023.09.15.14.58.17.imageset/SS8.2023.09.15.14.58.17.png">
<img width="421" alt="SS9" src="https://github.com/EdwardDuc/20230907-EdwardDuclervil-NYCSchools/blob/main/JPMCChallenge/JPMCChallenge/Assets.xcassets/SS9.2023.09.15.14.58.29.imageset/SS9.2023.09.15.14.58.29.png">



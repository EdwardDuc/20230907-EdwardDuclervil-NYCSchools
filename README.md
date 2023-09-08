# 20230907-EdwardDuclervil-NYCSchools
A Simple Application Displaying Schools in NYC along with additional info


## Architecture and Frameworks
- This project uses an MVVM Architecture
- It contains a network layer with a network manager to handle API calls
- The program uses Combine, WebKit, & XCTest
- Minimum Requirements: iOS 14.0+


## Security
- The Network Manager uses SSL Pinning to ensure the authenticity and integrity of server certificates during api calls.
- Both SecTrustGetCertificateAtIndex and SecTrustCopyCertificateChain are implemented based on which iOS is available
    - SecTrustGetCertificateAtIndex was deprecated at iOS 15.0
    
    
## Network and Error Handling
- Combine is used to accomplish the API call. 
- A request protocol was created to create the proper URL needed for each Request. 
- The Standard Library 'Error' was extended to handle a few basic api errors, including badURLError, noDataFoundError, dataParseError, responseError


###Shortcomings
    - Due to time constraints, The UI sufffered greatly. 
        - Aside from a few text formats, additional UI was not added
    - Search functionality only filters by the name of the school.
        - My initial intention was to add functionality to let you filter by Borough and whether it was an All-Boys School, All-Girls School, or Co-Ed
    - Test Cases were limited, Only testing a correct API call, an API call Failure, and Filtering for one of the View Models.
        - The intention was to at least test all Network Error cases for each View Model.
    - Not every dataset contains every element. For this reason, error handling would be required before displaying certain values. But due to time constraints, some values were disregarded because they were not properly handled (e.g. Graduation Rate, Extracurricular Activities, School Start & End Time, and a comprehensive list of Academic Activities.) 
    - The Initial plan was to implement MapKit and display the location for places that provided a longitude and latitude. 


##Screenshots


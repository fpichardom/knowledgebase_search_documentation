#set page(
  paper: "us-letter",
  numbering: "1"
)
#set par(justify: true)
#set text(
  font: "New Computer Modern",
  size:12pt
)

= CKAN installation and customization steps

== Steps to get a functional CKAN instance for the needs of the knowledge-base

=== CKAN specific steps

1. CKAN instance installation - from source
  - install the CKAN package and all its dependent services
2. CKAN form and metadata fields customization
  - use `ckanext-scheming` extension to create new dataset types and metadata fields
3. Templates customization
  - add logos
  - change vocabulary of the application to reflect its use as a digitization knowledge-base
  - Remove unused or unwanted features from the UI
  - make available the custom types from the UI
  - Improve interface for better user experience
  - Changes to the overall UI theme to match the brand
4. Setup traffic tracking in the application (e.g., Google Analytics)
  - The `ckanext-googleanalytics` extension provides extra features for tracking activities in ckan.
5. Setup a commenting system for the knowledge-base ckan instance.
  - there are several extensions that can be tested, such as `ckanext-disqus`, `ckanext-discourse`, `ckanext-ypt-comments`
6. (optional) Install and setup the `ckanext-versions` extension to track changes in the metadata, if named versions are desired
7. (optional) create persistent identifier to the datasets.
  - could provide a more stable unique links to the digitization resources in the knowledge base. We could register an ARK identifier with the help of the `ckanext-ark` extension. 


=== Application hosting steps
- Setup the production ready installation of CKAN with all modifications in a VPS or dedicated server (e.g., AWS)
- Decide if we want the database to be hosted in the same cloud server as the application or want to use a fully managed cloud solution (e.g., Amazon RDS for PostgreSQL)
- Configure the app to work with an web server and reverse proxy to get the appropriate domain for the knowledge-base and configure SSL certificates
- Secure the server (e.g., update firewall rules, etc.)

// there are a couple of extensions that could potentially work for providing commenting functionality for the ckan instance namely `ckanext-disqus`, `ckanext-discourse`, `ckanext-yp-comments`

== Identified Roles by Step

=== 1. CKAN instance installation

*Roles:*
- #underline[Robert:]
  - Select the best platform and mode of hosting the application and database
  - Link the application with the desired domain name
  - Secure the application and database
- #underline[Fritz:]
  - Provide assistance based on his knowledge of CKAN
  - Provide scripts and steps for installation for Robert to review
- #underline[ACIS team:]
  - Potential assistance hosting the application:
    - Provide advice on best practices
    - Application security advice

=== 2. CKAN form and metadata fields customization

*Roles*:
- #underline[Fritz:]
  - Identify the different digitization resources types required
  - Create standard vocabulary for field names and choices options for select fields and match them as best as possible with standards
  - Create the YAML configuration files to use for the custom types and fields
  - Create custom field validators for fields when necessary
  - Create the base ckan extension where the configuration files will be passed to ckan and any other modifications required.
  - Register the extension in the main ckan installation

- #underline[Robert:]
  - Provide general technical support
  - Help with troubleshooting process when needed
  - Provide support creating tests for field validators and other functionality changes
  - Work together to create a plan for updating configuration in the ckan application
- #underline[Team:]
  - Provide feedback on the standard vocabulary that will be used in the knowledge base

=== 3. Templates customization

*Roles:*
- #underline[Fritz:]
  - Provide guidance finding where the appropriate files are for specific pages or parts of pages and help identify where changes need to be made to achieve the custom new UI
  - Identify where to implement the changes proposed by Robert and the web designer in the ckan template structure
  - Update the custom ckan extension for the knowledge base with the new templates
  
- #underline[Robert:]
  - Help identifying places where user interactivity could be improved and work together with Fritz adding new JavaScript functions or incorporating interactivity using htmx which was adopted recently by ckan.
  - Assist in integrating the changes made by the web designer into the ckan template structure
- #underline[Web Designer:]
  - Provide changes to custom CSS and using Bootstrap framework tools to improve user experience and match the brand
  - Work together with Fritz and Robert to understand the structure of ckan templates

=== 4. Setup traffic tracking in the application (e.g., Google Analytics)

Roles:
- #underline[Fritz:]
  - Test how the `ckanext-googgleanalytics` extension work
  - Work with Robert to get the required info to setup google analytics
  - Work with Robert to decide the degree of implementation of Google analytics (e.g., just adding google provided code to the pages vs finer integration with the extension)
- #underline[Robert:]
  - Setting up the accounts for google analytics
  - work with Fritz on deciding on the best path of implementation

=== 5. Setup a commenting system

*Roles:*
- #underline[Fritz:]
  - Evaluate with if current ckan extensions that provide commenting functionality can be used in their current state or require modification
  - Work together with Robert to setup the functional extension or explore other options like using a commenting service through an API
- #underline[Robert:]
  - Work together with Fritz to select which will be the best option for adding commenting functionality to the ckan instance.

=== 6. (optional)Install and setup the `ckanext-versions` extension to track changes in the metadata

*Roles:*
- #underline[Fritz: ]
  - Install, test and setup the `ckanext-versions` extension

- #underline[Robert:]
  - Help with server access
  - Available for technical support


=== 7. (optional) create persistent identifier to the datasets.
*Roles:*
- #underline[Fritz:]
  - Install, test and setup the `ckanext-ark` extension
- #underline[Robert:]
  - Help with server access
  - Available for technical support
- #underline[Austin:]
  - Provide organizational information what is required to send a request for ARK keys  
  

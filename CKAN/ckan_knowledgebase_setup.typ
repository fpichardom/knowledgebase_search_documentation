= CKAN installation and customization steps

== Steps to get a functional CKAN instance for the needs of the knowledge-base

1. Setup a cloud server to host the knowledgebase
1. CKAN instance installation - from source
  - install the CKAN package and all the depended services
2. CKAN instance form and metadata fields customization
  - use `ckanext-scheming` extension to create new dataset types and metadata fields
3. Templates customization
  - add logo
  - change vocabulary of the application
  - Remove unused or unwanted features from the UI
  - make available the custom types from the UI
  - Improve interface for better user experience
  - Changes to the overall UI theme to match the brand
4. (optional) Install and setup the `ckanext-versions` extension to track changes in the metadata, if named versions are desired
5. (optional) create persistent identifier to the datasets.
  - could provide a more stable unique links to the digitization resources in the knowledge base. We could register an ARK identifier with the help of the `ckanext-ark` extension.
6. Setup
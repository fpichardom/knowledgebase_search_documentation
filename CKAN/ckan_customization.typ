= CKAN customization

CKAN is promoted as a highly customizable and extensible platform. Its modular design allows customization through extensions and plugins, avoiding direct modifications to the core code. This approach simplifies the update process, as the core code repository can be safely overwritten without significant issues, provided that best practices for CKAN are followed. For example, extensions should not modify the core tables of CKAN but if database modification are needed new ones should be created. There is a extensive ecosystem of extensions for CKAN both curated by the maintainers of the project and from community members and other organizations that host custom CKAN instances.


Extensions for CKAN use a standard naming convention `ckanext-{my_extension}`. The extension is a Python package that needs a specific structure. The base template is provided by CKAN using the command line interface `ckan generate extension`

Different aspects of CKAN are available for customization. The CKAN extending guide (https://docs.ckan.org/en/latest/extensions/index.html) provides an in depth description on how to customize CKAN but I want here to give a general overview of the parts that are of primary importance for the knowledge base.

== Forms and Fields customization

By default metadata fields and forms can be customized extending the `IDatasetForm` plugin interface. This allows the greatest flexibility in customization but for most needs it is suggested to use the functionality provided by the `ckanext-scheming` extension.

The `ckanext-scheming` extension allows the definition of custom datasets, organizations and groups. I will further elaborate on the datasets which are the main interest as these will be equivalent to the digitization resources. However, the customization of organization and groups follow a similar pattern.

The extension allows creating new dataset types wich will have its own set of metadata fields allocated to them. The definition 


There are different ways in which to modify the forms and metadata fields. By default it would require to use the When using IDatasetForm interface, you are modifying both the templates related to the custom fields and the underlying data schema. The templates control how the fields appear and behave in the user interface, while the schema defines how the data is structured, validated and stored in the database.
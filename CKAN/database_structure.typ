= Database Structure

My aim here is to describe the core aspects of the CKAN database structure. Specifically aimed to show how the tables that are related to the dataset and its metadata are structure and how it works for us.

The `package` table holds most of the core information and metadata information of the dataset.

It has a series of main fields that are described with their own columns in the table and the customizable fields are stored in JSON format in the `extras` column which is of format JSONB. One of the few metadata values for datasets that are stored outside of the `package` table is the `tag` which are stored in the `tag` table with a many to many relationship with `package` through the `package_tag` junction table. Tags can be optionally named and the type of tag is stored in the `vocabulary` table.



#table(
  columns: 2,
  table.header([field],[field type]),
  [id], [text],
  [name], [varchar(100)],
  [title], [text],
  [version], [text],
  [url],[text],
  [notes], [text],
  [author],[text],
  [author_email],[text],
  [maintainer],[text],
  [maintainer_email],[text],
  [state],[text],
  [licence_id],[text],
  [type],[text],
  [owner_org],[text],
  [private],[boolean],
  [metadata_modified],[timestamp],
  [creator_user_id],[text],
  [metadata_created],[timestamp],
  [plugin_data],[jsonb],
  [extras],[jsonb]
  
)

#figure(
  image("images/ckan_package_erd.svg"),
  caption: [Dataset metadata relational schema in CKAN]
)

Resources for the dataset table are stored in the store
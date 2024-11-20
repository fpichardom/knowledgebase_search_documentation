= Custom Digitization resources types for Knowledge base

Digitization resources or resources that would be useful for digitization projects can be of different formats with their own needs of metadata. Here I want to develop the vocabulary that would be then used for customizing form fields depending on the digitization resource type.

categories:
- journal-article: Publication from a scientific journal.
- web-reference: General web resource that provides information of interest. This would be general enough for entries like blog article, documentation, guides. These can have a specific article or only have links to organizations.
- resource-hub
- publication: generic publication type. It requires an author and date of publication
- equipment
- software


== Common Metadata fields for enhancing discovery

#table(
  columns: (auto, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*task_clusters*]
  ),
  [ckan_default], [false],
  [label],[Task Clusters],
  [standard_mapping], [],
  [number_of_values_allowed],[multiple],
  [example], [image processing],
  [options],[
    - pre-digitization curation
    - image capture
    - image processing
    - digital data capture
    - georeferencing
    - project design and management
    - digitization general
  ],
  table.cell(colspan: 2, align: left)[Description: ]
)

#table(
  columns: (auto, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*task*]
  ),
  [ckan_default], [false],
  [label],[Task],
  [standard_mapping], [],
  [example], [],
  [options],[
    - whole-drawer imaging
    - label imaging
    - quality control
  ],
  table.cell(colspan: 2, align: left)[Description: ]
)

== Journal-Article

=== Fields:

#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*title*]
  ),
  [ckan_default], [true],
  [label],[Title],
  [standard_map], [dc: title],
  [example], [],
  table.cell(colspan: 2, align: left)[Description: ]
)

#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*url*]
  ),
  [ckan_default], [true],
  [label], [Source],
  [standard mapping], [foaf: homepage],
  [example], [],
   table.cell(colspan: 2, align: left)[Description: ]
)

#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*doi*]
  ),
  [ckan_default], [false],
  [label], [DOI],
  [standard mapping], [dc:identifier:doi],
  [example], [],
   table.cell(colspan: 2, align: left)[Description: ]
)

#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*author*]
  ),
  [ckan_default], [true],
  [label], [Author],
  [standard mapping], [dc:creator],
  [example], [],
   table.cell(colspan: 2, align: left)[Description: ]
)

#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*author_email*]
  ),
  [ckan_default], [true],
  [label], [Author],
  [standard mapping], [dc:creator:email],
  [example], [],
   table.cell(colspan: 2, align: left)[Description: ]
)

#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*other_authors*]
  ),
  [ckan_default], [false],
  [label], [Other Authors],
  [standard mapping], [dc:creator],
  [example], [],
   table.cell(colspan: 2, align: left)[Description: ]
)

#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*journal*]
  ),
  [ckan_default], [false],
  [label], [Journal],
  [standard mapping], [],
  [example], [],
   table.cell(colspan: 2, align: left)[Description: ]
 )

#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*volume*]
  ),
  [ckan_default], [false],
  [label], [Volume],
  [standard mapping], [],
  [example], [],
   table.cell(colspan: 2, align: left)[Description: ]
)

#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*volume*]
  ),
  [ckan_default], [false],
  [label], [Volume],
  [standard mapping], [],
  [example], [],
   table.cell(colspan: 2, align: left)[Description: ]
)

#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*issue*]
  ),
  [ckan_default], [false],
  [label], [Issue],
  [standard mapping], [],
  [example], [],
   table.cell(colspan: 2, align: left)[Description: ]
)



=== Yaml Schema for journal-article

#raw(
  block: true,
  read("journal-article.yml"),
  lang:"yaml"
)
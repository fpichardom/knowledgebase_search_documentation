= Custom Digitization resources types for Knowledge base

Digitization resources, or general resources useful for digitization projects, #underline[appear in different formats]. Each format has their own metadata requirements. Here, I propose a set of standardized terms to used to customize form fields based on the type of digitization resource. These will attempt to use standard vocabulary from naming standards as much as possible such as:

- #link("https://www.dublincore.org/")[Dublin Core]
- #link("https://dwc.tdwg.org/")[Darwin Core]
- #link("https://schema.org/")[Schema.org]


categories:
- journal-article: Publication from a scientific journal.
- web-reference: General web resource that provides information of interest. This would be general enough for entries like blog article, documentation, guides. These can have a specific article or only have links to organizations.
- presentation-slides: presentation slides that have been hosted by an organization or author (not links to google slides, for example).
- online-training: online material that it is meant to teach in a structured way or provide certification
- publication: generic publication type. It requires an author, that is not an organization, and date of publication


- resource-hub

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
  table.cell(colspan: 2, align: left)[Description: Task clusters defined for biodiversity specimens digitization projects by #link("https://doi.org/10.3897/zookeys.209.3135")[Nelson, et al. (2012)]]
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

#table(
  columns: (auto, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*preparations*]
  ),
  [ckan_default], [false],
  [label],[Preparations],
  [standard_mapping], [dwc:preparations],
  [number_of_values_allowed],[multiple],
  [example], [],
  [options],[
    - herbarium sheet
    
    - label imaging
    - quality control
  ],
  table.cell(colspan: 2, align: left)[Description: Resource useful for specific types of methods of preparation ]
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
  [standard mapping], [schema:url | foaf: homepage],
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
#block(breakable: false)[
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
]

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
  [standard mapping], [#link("https://schema.org/publishedBy")[schema:publishedBy]],
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
  [standard mapping], [#link("https://schema.org/volumeNumber")[schema:volumeNumber]],
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
  [standard mapping], [#link("https://schema.org/issueNumber")[schema:issueNumber]],
  [example], [2],
   table.cell(colspan: 2, align: left)[Description: ]
)

#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*year*]
  ),
  [ckan_default], [false],
  [label], [Year],
  [standard mapping], [#link("https://schema.org/datePublished")[schema:datePublished]],
  [example], [2012],
   table.cell(colspan: 2, align: left)[Description: ]
)

#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*pages*]
  ),
  [ckan_default], [false],
  [label], [Pages],
  [standard mapping], [#link("https://schema.org/pagination")[schema:pagination]],
  [example], [1-5],
   table.cell(colspan: 2, align: left)[Description: ]
)


=== Yaml Schema for journal-article

#raw(
  block: true,
  read("journal-article.yml"),
  lang:"yaml"
)
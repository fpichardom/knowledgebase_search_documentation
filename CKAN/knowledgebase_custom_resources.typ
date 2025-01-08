#set page(
  paper: "us-letter",
  
)

#set text(
  font: "New Computer Modern",
  size: 11pt
)

#set par(
  leading: 0.70em
)

#show heading.where(level: 1): set block(below: 3em)
#show heading.where(level: 2): set block(below: 2em)

#show link: it => {
  set text(blue)
  underline(it)
}

= Custom Digitization resources types for Knowledge base

Digitization resources, or general resources useful for digitization projects, come in a variety of formats. Each format has their own metadata requirements. Here, I propose a set of standardized terms to used for customizing form fields based on the type of digitization resource. These terms will incorporate standard vocabulary from established naming conventions wherever possible such as:

- #link("https://www.dublincore.org/")[Dublin Core]
- #link("https://www.dublincore.org/specifications/lrmi/")[LRMI]
- #link("https://dwc.tdwg.org/")[Darwin Core]
- #link("https://ltc.tdwg.org/")[Latimer Core]
- #link("https://schema.org/")[Schema.org]

Field prefixes:

- `dc` for Dublin Core
- `lrmi` for LRMI
- `dwc` for Darwin Core
- `ltc` for Latimer Core
- `schema` for Schema.org


== CKAN Dataset default fields

- id
- name
- title
- version
- url (url of latest version)
- notes
- author
- author_email
- maintainer
- maintainer_email
- state (is active)
- licence_id
- type (digitization resource type)
- owner_org
- private: (is accessible only by members of owner_org)
- metadata_modified
- creator_user_id
- metadata_created
- plugin_data
- extras (custom fields in JSONB format)

== Custom Digitization Resource Types

*Categories:*

- *journal-article*: Publication from a scientific journal.
- *publication*: generic publication type. It requires an author, that is not an organization, and date of publication
- *web-content*: Online reference material and documentation. Typically curated by an organization. URls are the main identifiers, the document is subject to evolve with time. This would be general enough for resources in the form of blogs, documentation, wiki, etc.
- *presentation-slides*: presentation slides that have been hosted by an organization or author (not links to google slides, for example).
- *online-training*: online material that it is meant to teach in a structured way or provide certification
- *resource-hub*
- *software-application*


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
    - digitization general ?
  ],
  table.cell(colspan: 2, align: left)[Description: Task clusters defined for biodiversity specimens digitization projects by #link("https://doi.org/10.3897/zookeys.209.3135")[Nelson, et al. (2012)]]
)

#block(breakable: false)[
#table(
  columns: (auto, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*task*]
  ),
  [ckan_default], [false],
  [label],[Task],
  [standard_mapping], [],
  [options],[
    - whole-drawer imaging
    - label imaging
    - quality control
  ],
  table.cell(colspan: 2, align: left)[
    Description:
  ]
)
]

#block(breakable: false)[
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
    - herbarium sheets
    - pinned dried insects
    - microscope slides
    - flat sheets and packets
    - pinned things in trays and drawers
    - things in spirits in jars
    - three-dimensional objects in trays and boxes
  ],
  table.cell(colspan: 2, align: left)[Description: Resource useful for specific types of methods of preparation ]
)
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*audience*]
  ),
  [ckan_default], [false],
  [alternative names], [coverage],
  [label], [Audience],
  [standard mapping], [dc:audience, schema:audience],
  [number_of_values_allowed],[multiple],
  [example], [],
  [options],[
    - biodiversity specific
    - general
  ],
   table.cell(colspan: 2, align: left)[Description: Description of the specificity of the resource or the primary audience it is intended for]
)
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*discipline*]
  ),
  [ckan_default], [false],
  [alternative names], [],
  [label], [Discipline],
  [standard mapping], [ltc:discipline],
  [number_of_values_allowed],[multiple],
  [example], [],
  [options], [
    - Botany
    - Botany - Seed Plants
    - Entomology
    - Paleontology
    - Zoology - Vertebrates
    - Ornithology
    - Ichthyology
  ],
   table.cell(colspan: 2, align: left)[
     Description: Biological Discipline that best for which the resource is most suitable. Subcategories are acceptable
   ]
)
]

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


// === Yaml Schema for journal-article

// #raw(
//   block: true,
//   read("journal-article.yml"),
//   lang:"yaml"
// )

== Journal-Article

Alternative Names: scholarly-article

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


== Web-Resource
Alternative Names: web-reference

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
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

#show heading.where(level: 2): set text(size: 14pt, weight: "bold")
#show heading.where(level: 2): set block(above: 4em, below: 2em)

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
    - Example: #link("https://doi.org/10.3897/zookeys.209.3135")
- *publication-general*: generic publication type. It requires an author, that is not an organization, and date of publication
    - Example: #link(" https://doi.org/10.15468/doc-gg7h-s853")
- *web-resource*: a webpage that serves as a reference material. Typically curated by an organization but can also be attributed to particular authors. URls are the main identifiers and the document is subject to evolve with time. This would be general enough for resources in the form of blog articles, documentation, wiki articles, etc.

- *resource-hub*: typically a website that serves as a hub for helping material of a particular topic.
  - Example: #link("https://tdwg.github.io/esp/georeferencing/workflows")

- *learning-resource*: online material that it is meant to teach in a structured way or provide certification

- *software-application*: a computer program or source code of tools that would help in the biodiversity digitization process
  - Example: #link("https://geo-locate.org/")

- *?presentation-slides*: presentation slides that have been hosted by an organization or author (not links to google slides, for example).
  - Example: 

== CKAN Default fields

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*title*]
  ),
  [ckan_default], [true],
  [label],[Title],
  [standard_map], [
    #link("https://www.dublincore.org/specifications/dublin-core/dcmi-terms/terms/title/")[dc: title]
  ],
  [field_type],[text],
  [example], [],
  table.cell(colspan: 2, align: left)[Description: Title of the resource]
)
]

#block(breakable: false)[
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
]

#block(breakable: false)[
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
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*author_email*]
  ),
  [ckan_default], [true],
  [label], [Author Email],
  [standard mapping], [dc:creator:email],
  [example], [],
  table.cell(colspan: 2, align: left)[Description: ]
)
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*version*]
  ),
  [ckan_default], [true],
  [label], [Version],
  [standard mapping], [#link("https://schema.org/pagination")[schema:version]],
  [example], [1-5],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*owner_org*]
  ),
  [ckan_default], [true],
  [label], [Organization],
  [standard mapping], [],
  [example], [Symbiota],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*licence_id*]
  ),
  [ckan_default], [true],
  [label], [Licence],
  [standard mapping], [
    #link("https://schema.org/license")[schema:licence]
  ],
  [field_type],[select],
  [example], [Creative Commons Attribution],
   table.cell(colspan: 2, align: left)[Description: Licence for the content. See: #link("https://opendefinition.org/licenses/") ]
)
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*maintainer*]
  ),
  [ckan_default], [true],
  [label], [Maintainer],
  [standard mapping], [dc:contributor],
  [example], [],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*maintainer_email*]
  ),
  [ckan_default], [true],
  [label], [Maintainer Email],
  [standard mapping], [dc:contributor:email],
  [example], [],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*notes*]
  ),
  [ckan_default], [true],
  [label], [Description],
  [standard mapping], [schema:abstract],
  [example], [],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

== Common Metadata fields for enhancing discovery

#block(breakable: false)[
#table(
  columns: (auto, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*task_clusters*]
  ),
  [ckan_default], [false],
  [label],[Task Clusters],
  [standard_mapping], [],
  [field_type],[multiple_select],
  [example], [],
  [options],[
    - pre-digitization curation
    - image capture
    - image processing
    - digital data capture
    - georeferencing
    - project design and management
    - digitization general ?
  ],
  table.cell(colspan: 2, align: left)[Description: Task clusters defined for biodiversity specimens digitization projects by #link("https://doi.org/10.3897/zookeys.209.3135")[Nelson, et al. (2012)].]
)
]

#block(breakable: false)[
#table(
  columns: (auto, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*task*]
  ),
  [ckan_default], [false],
  [label],[Task],
  [standard_mapping], [],
  [field_type],[multiple_select],
  [options],[
    - whole-drawer imaging
    - label imaging
    - quality control
  ],
  table.cell(colspan: 2, align: left)[
    Description: More specific task or activies involved within a task cluster.
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
  [standard_mapping], [
    #link("http://rs.tdwg.org/dwc/terms/preparations")[dwc:preparations]
  ],
  [field_type],[multiple_select],
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
  table.cell(colspan: 2, align: left)[Description: Resource that focuses on the digitization of specific methods of preparation.]
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
  [standard mapping], [
  #link("https://www.dublincore.org/specifications/dublin-core/dcmi-terms/terms/audience/")[dc:audience], #link("https://schema.org/audience")[schema:audience]
  ],
  [field_type],[multiple_select],
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
  [label], [Discipline],
  [standard mapping], [
    #link("https://ltc.tdwg.org/quick-reference/#ObjectGroup.discipline")[ltc:discipline]
  ],
  [field_type],[multiple_select],
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

CKAN fields:
- title
- url
- author
- author_email
- licence_id
- notes



#block(breakable: false)[
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
]



#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*other_authors*]
  ),
  [ckan_default], [false],
  [label], [Other Authors],
  [standard mapping], [dc:creator],
  [field_type],[multiple_text],
  [example], [],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

#block(breakable: false)[
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
]

#block(breakable: false)[
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
]

#block(breakable: false)[
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
]

#block(breakable: false)[
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
]

#block(breakable: false)[
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
]



#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*category*]
  ),
  [ckan_default], [false],
  [label], [Description],
  [standard mapping], [schema:category],
  [field_type],[select],
  [example], [],
  [options], [
    - journal article
  ],
   table.cell(colspan: 2, align: left)[Description: ]
)
]
// === Yaml Schema for journal-article

// #raw(
//   block: true,
//   read("journal-article.yml"),
//   lang:"yaml"
// )


== Publication-General

=== Fields:

CKAN fields:
- title
- url
- author
- author_email
- licence_id
- notes


#block(breakable: false)[
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
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*isbn*]
  ),
  [ckan_default], [false],
  [label], [DOI],
  [standard mapping], [dc:identifier:isbn],
  [example], [],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

#block(breakable: false)[
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
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*publisher*]
  ),
  [ckan_default], [false],
  [label], [Publisher],
  [standard mapping], [schema:publisher],
  [example], [],
   table.cell(colspan: 2, align: left)[Description: Organization in charge of publishing the resource ]
)
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*year_published*]
  ),
  [ckan_default], [false],
  [label], [Year Published],
  [standard mapping], [
    #link("https://schema.org/datePublished")[schema:datePublished]
  ],
  [example], [2012],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*category*]
  ),
  [ckan_default], [false],
  [label], [Description],
  [standard mapping], [schema:category],
  [example], [],
  [options], [
    - protocol
    - guide
    - conference paper
    - presentation slides
  ],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

== Web-Resource

Alternative Names: web-reference, web-content, website, webpage


=== Fields:

CKAN Fields:
- title
- url
- author
- author_email
- version
- owner_org
- licence_id
- maintainer
- maintainer_email
- notes





#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*archived_at*]
  ),
  [ckan_default], [false],
  [label], [Archived At],
  [standard mapping], [schema:archivedAT],
  [example], [],
   table.cell(colspan: 2, align: left)[Description: URL for permanent archival of resource]
)
]





#block(breakable: false)[
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
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*date_published*]
  ),
  [ckan_default], [false],
  [label], [Date Published],
  [standard mapping], [#link("https://schema.org/datePublished")[schema:datePublished]],
  [example], [2012],
   table.cell(colspan: 2, align: left)[Description: ]
)
]



#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*copyright_holder*]
  ),
  [ckan_default], [false],
  [label], [Copyright Holder],
  [standard mapping], [#link("https://schema.org/datePublished")[schema:copyrightHolder]],
  [example], [Symbiota],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*category*]
  ),
  [ckan_default], [false],
  [label], [Description],
  [standard mapping], [schema:category],
  [example], [],
  [options], [
    - protocol
    - documentation
    - guide
    - blog
  ],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

== Resource-Hub

=== Fields:

CKAN fields:
- title
- url
- owner_org
- licence_id
- maintainer
- maintainer_email
- notes




#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*copyright_holder*]
  ),
  [ckan_default], [false],
  [label], [Copyright Holder],
  [standard mapping], [#link("https://schema.org/datePublished")[schema:copyrightHolder]],
  [example], [Symbiota],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*category*]
  ),
  [ckan_default], [false],
  [label], [Description],
  [standard mapping], [schema:category],
  [example], [],
  [options], [
    - resource hub
  ],
   table.cell(colspan: 2, align: left)[Description: ]
)
]


== Learning-Resource
Alternative Names: web-reference, web-content, website, webpage

=== Fields:

CKAN fields:
- title
- url
- author
- author_email
- version
- owner_org
- licence_id
- maintainer
- maintainer_email
- notes






#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*archived_at*]
  ),
  [ckan_default], [false],
  [label], [Archived At],
  [standard mapping], [schema:archivedAT],
  [example], [],
   table.cell(colspan: 2, align: left)[Description: URL for permanent archival of resource]
)
]


#block(breakable: false)[
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
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*date_published*]
  ),
  [ckan_default], [false],
  [label], [Date Published],
  [standard mapping], [#link("https://schema.org/datePublished")[schema:datePublished]],
  [example], [2012],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*time_required*]
  ),
  [ckan_default], [false],
  [label], [Time Required],
  [standard mapping], [#link("https://schema.org/datePublished")[lrmi:timeRequired]],
  [example], [],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*learning_mode*]
  ),
  [ckan_default], [false],
  [label], [Learning Mode],
  [standard mapping], [#link("https://schema.org/datePublished")[schema:courseMode]],
  [example], [],
  [options], [
    - syncronous
    - asyncronous
    - mixed syncronous-asyncronous
    - requires registration
  ],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*repeat_frequency*]
  ),
  [ckan_default], [false],
  [label], [Repeat Frequency],
  [standard mapping], [#link("https://schema.org/datePublished")[schema:repeatFrequency]],
  [example], [],
  [options], [
    - on demand
    - self-paced
    - scheduled
  ],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*is_accessible_for_free*]
  ),
  [ckan_default], [false],
  [label], [Is Accessible for Free],
  [standard mapping], [#link("https://schema.org/datePublished")[schema:isAccessibleForFree]],
  [example], [],
  [options], [
    - true
    - false
  ],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*copyright_holder*]
  ),
  [ckan_default], [false],
  [label], [Copyright Holder],
  [standard mapping], [#link("https://schema.org/datePublished")[schema:copyrightHolder]],
  [example], [Symbiota],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*category*]
  ),
  [ckan_default], [false],
  [label], [Description],
  [standard mapping], [schema:category],
  [example], [],
  [options], [
    - workshop
    - certification
    - course
  ],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

== Software Application

Alternative names: software

=== Fields:

CKAN_fields:
- title
- url
- author
- author_email
- version
- owner_org
- licence_id
- maintainer
- maintainer_email
- notes




#block(breakable: false)[
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
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*date_published*]
  ),
  [ckan_default], [false],
  [label], [Date Published],
  [standard mapping], [#link("https://schema.org/datePublished")[schema:datePublished]],
  [example], [2023-12-31],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*operating_system*]
  ),
  [ckan_default], [false],
  [label], [Operating System],
  [standard mapping], [
    #link("")[schema:operatingSystem]
  ],
   [number_of_values_allowed],[multiple],
  [example], [],
  [options], [
    - windows
    - macos
    - linux
    - general
  ],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*programming_language*]
  ),
  [ckan_default], [false],
  [label], [Programming Language],
  [standard mapping], [
    #link("")[schema:programmingLanguage]
  ],
  [number_of_values_allowed],[single],
  [example], [],
  [options], [
    - python
    - r
    - php
    - javascript
    - c
    - perl
    - c++
    - go
    - rust
  ],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*is_accessible_for_free*]
  ),
  [ckan_default], [false],
  [label], [Is Accessible for Free],
  [standard mapping], [
    #link("")[schema:isAccessibleForFree]
  ],
  [example], [],
  [options], [
    - true
    - false
  ],
   table.cell(colspan: 2, align: left)[Description: Boolean for wether the resource is available for free or has a cost ]
)
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*copyright_holder*]
  ),
  [ckan_default], [false],
  [label], [Copyright Holder],
  [standard mapping], [#link("https://schema.org/datePublished")[schema:copyrightHolder]],
  [example], [Symbiota],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*category*]
  ),
  [ckan_default], [false],
  [label], [Description],
  [standard mapping], [schema:category],
  [example], [],
  [options], [
    - web application
    - desktop application
    - mobile application
    - api
    - library or package
    - source code general
  ],
   table.cell(colspan: 2, align: left)[Description: List of categories specific to the resource type]
)
]
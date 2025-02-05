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

// Heading Styling

#show heading.where(level: 1): set block(below: 3em)
#show heading.where(level: 2): set block(below: 2em)

#show heading.where(level:2): it => {
  set block(above: 2em, below: 1em)
  set text(weight: "bold")
  box(
    width: 100%,
    fill: rgb("#f0f4f7"),
    inset: 1em,
    radius: 4pt,
    it
  )
}

// Link Styling

#show link: it => {
  set text(blue)
  underline(it)
}


// Table Styling

// Basic table settings
#set table(
  inset: 1em,
  stroke: 0.5pt + rgb("#e0e0e0"),  // Light gray border
  fill: (_, row) => if row == 0 { rgb("#f0f4f7") } else { white }
)

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

- *scholarly-article*: Publication in a journal or publishing organization which has an author, specific publishing date and a resolvable persistent identifier such as a DOI. It could also have versions.
  - peer-reviewed article
  - non peer-reviewed article

- *web-content*: a webpage that serves as a reference material. Typically curated by an organization but can also be attributed to particular authors. URls are the main identifiers and the document is subject to evolve with time. This would be general enough for resources in the form of blog articles, documentation, wiki articles, etc.
  - guide: descriptive information on how to tackle specific scenarios or providing general overview of a particular topic.
  - protocol: document specifying step by step instructions for completing specific tasks
  - resource hub: website that provides links to several resources of the same or different types.
  
- *learning-resource*: online material or course that is meant to provide training or knew knowledge in a structure way for a particular topic.

- *software-application*: a computer program or source code of tools that would help in the biodiversity digitization process

- *?presentation-slides*: presentation slides that have been hosted by an organization or author (not links to google slides, for example).
  - Example:
- *?video*: media of type video
- digital-document
- *discussion-forum*:
- *discussion-forum-posting*
- *event* (#link("https://schema.org/Event")[schema:Event]): event happening in a particular time and place
== CKAN Default fields (User input)

#block(breakable: false, below: 2em)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*title*]
  ),
  [ckan_default], [true],
  [label],[Title],
  [alternative_name],[],
  [standard_mapping], [
    #link("https://www.dublincore.org/specifications/dublin-core/dcmi-terms/terms/title/")[dc:title],
    #link("https://schema.org/name")[schema:name]
  ],
  [field_type],[text],
  [example], [],
  table.cell(colspan: 2, align: left)[Description: Title of the resource]
)
]

#block(breakable: false, below: 2em)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*url*]
  ),
  [ckan_default], [true],
  [label], [Source],
  [alternative_name],[],
  [standard mapping], [
    #link("https://schema.org/url")[schema:url],
    #link("https://schema.org/sameAs")[schema:sameAs]
  ],
  [field_type],[text - link],
  [example], [],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

#block(breakable: false, below: 2em)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*author*]
  ),
  [ckan_default], [true],
  [label], [First Author],
  [alternative_name],[creator],
  [standard mapping], [
    #link("https://www.dublincore.org/specifications/dublin-core/dcmi-terms/terms/creator/")[dc:creator],
    #link("https://schema.org/creator")[schema:creator],
    #link("https://schema.org/author")[schema:author]
    
  ],
  [example], [],
   table.cell(colspan: 2, align: left)[
     Description: First author as written in the resource 
   ]
)
]

#block(breakable: false, below: 2em)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*author_email*]
  ),
  [ckan_default], [true],
  [label], [First Author Email],
  [alternative_name],[],
  [standard mapping], [dc:creator:email],
  [example], [],
  table.cell(colspan: 2, align: left)[Description: ]
)
]

#block(breakable: false, below: 2em)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*version*]
  ),
  [ckan_default], [true],
  [label], [Version],
  [alternative_name],[],
  [standard mapping], [#link("https://schema.org/version")[schema:version]],
  [field_type],[text],
  [example], [1.5],
   table.cell(colspan: 2, align: left)[Description: If specified version of the resource ]
)
]

#block(breakable: false, below: 2em)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*owner_org*]
  ),
  [ckan_default], [true],
  [label], [Organization],
  [standard mapping], [],
  [example], [Symbiota],
   table.cell(colspan: 2, align: left)[Description: Organization hosting or maintaining the resource. Required field. ]
)
]

#block(breakable: false, below: 2em)[
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

#block(breakable: false, below: 2em)[
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

#block(breakable: false, below: 2em)[
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

#block(breakable: false, below: 2em)[
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

#block(breakable: false, below: 2em)[
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

#block(breakable: false, below: 2em)[
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
    - label transcription
    - label imaging
    - quality control
  ],
  table.cell(colspan: 2, align: left)[
    Description: More specific task or activies involved within a task cluster.
  ]
)
]


#block(breakable: false, below: 2em)[
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

== Scholarly-Article

Basis:
- schema:scholarlyArticle (https://schema.org/ScholarlyArticle)

Alternative Names: 


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
  [alternative_name],[],
  [standard mapping], [
    dc:identifier:doi,
    #link("https://schema.org/sameAs")[schema:sameAs]
  ],
  [field_type],[text - link],
  [example], [],
   table.cell(colspan: 2, align: left)[Description: DOI identifier of the resource. Write the complete resolvable link ]
)
]



#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*other_authors*]
  ),
  [ckan_default], [false],
  [alternative_names],[additional_authors],
  [label], [Other Authors],
  [standard mapping], [
    #link("https://www.dublincore.org/specifications/dublin-core/dcmi-terms/terms/creator/")[dc:creator],
    #link("https://schema.org/creator")[schema:creator],
    #link("https://schema.org/author")[schema:author]
  ],
  [field_type],[multiple_text],
  [example], [],
   table.cell(colspan: 2, align: left)[Description: List of additional authors as written in the resource ]
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
  [alternative_name],[Publisher],
  [standard mapping], [#link("https://schema.org/publisher")[schema:publisher]],
  [field_type],[text],
  [example], [ZooTaxon],
   table.cell(colspan: 2, align: left)[Description: ]
 )
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*publisher_abbreviation*]
  ),
  [ckan_default], [false],
  [label], [Publisher Abbreviation],
  [standard mapping], [#link("https://schema.org/publisher")[schema:publisher]],
  [example], [ZooTaxon],
   table.cell(colspan: 2, align: left)[Description: ]
 )
]

#block(breakable: false, below: 2em)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*volume_number*]
  ),
  [ckan_default], [false],
  [label], [Volume Number],
  [alternative_name],[],
  [standard mapping], [#link("https://schema.org/volumeNumber")[schema:volumeNumber]],
  [field_type],[text],
  [example], [],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*issue_number*]
  ),
  [ckan_default], [false],
  [label], [Issue Number],
  [alternative_name],[],
  [standard mapping], [
    #link("https://schema.org/issueNumber")[schema:issueNumber]
  ],
  [field_type],[text],
  [example], [2],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

#block(breakable: false, below: 2em)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*date_published*]
  ),
  [ckan_default], [false],
  [label], [Date Published],
  [standard mapping], [#link("https://schema.org/datePublished")[schema:datePublished]],
  [example], [2012-12-31],
  [field_type], [date],
   table.cell(colspan: 2, align: left)[Description: Date the resource was published. I if only year is available then default to the first day of the year 2012-01-01]
)
]

#block(breakable: false, below: 2em)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*pagination*]
  ),
  [ckan_default], [false],
  [label], [Pagination],
  [alternative_name],[],
  [standard mapping], [
    #link("https://schema.org/pagination")[schema:pagination]
  ],
  [field_type],[text],
  [example], [1-5],
   table.cell(colspan: 2, align: left)[Description: Page range of the resource in the publication. Some digital journals don't have page ranges but a unique number. ]
)
]

#block(breakable: false, below: 2em)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*category*]
  ),
  [ckan_default], [false],
  [label], [Description],
  [],[],
  [standard mapping], [schema:category],
  [field_type],[select],
  [example], [],
  [options], [
    - journal article
    - conference abstract
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
  [standard mapping], [
    #link("https://www.dublincore.org/specifications/dublin-core/dcmi-terms/terms/creator/")[dc:creator]
  ],
  [field_type],[multiple_text],
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
    table.cell(colspan: 2, align: center)[*date_published*]
  ),
  [ckan_default], [false],
  [label], [Date Published],
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

== Web-Content

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
  [standard mapping], [
    #link("https://www.dublincore.org/specifications/dublin-core/dcmi-terms/terms/creator/")[dc:creator]
  ],
  [field_type],[multiple_text],
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
  [standard mapping],
  [#link("https://schema.org/copyrightHolder")[schema:copyrightHolder]],
  [field_type],[text],
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
    - resource hub
    - wiki article
  ],
   table.cell(colspan: 2, align: left)[Description: ]
)
]


== Event (#link("https://schema.org/Event")[schema:Event])

=== Alternative Names:

=== Fields:

CKAN Fields:
- title - Title
- url - Source
- author - First Author
- author_email - First Author Email
- version - Version
- owner_org - Organization
- licence_id - Licence ID
- maintainer - Maintainer
- maintainer_email - Maintainer Email
- notes - Description


#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*other_authors*]
  ),
  [ckan_default], [false],
  [label], [Other Authors],
  [standard mapping], [
    #link("https://www.dublincore.org/specifications/dublin-core/dcmi-terms/terms/creator/")[dc:creator]
  ],
  [field_type],[multiple_text],
  [example], [],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*location*]
  ),
  [ckan_default], [false],
  [label], [Location],
  [standard mapping], [#link("https://schema.org/location")[schema:location]],
  [field_type],[text],
  [example], [Tallahassee, Florida],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*start_date*]
  ),
  [ckan_default], [false],
  [label], [Start Date],
  [standard mapping], [#link("https://schema.org/startDate")[schema:startDate]],
  [field_type],[date],
  [example], [2012-12-31],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*end_date*]
  ),
  [ckan_default], [false],
  [label], [End Date],
  [standard mapping], [#link("https://schema.org/endDate")[schema:startDate]],
  [field_type],[date],
  [example], [2012-12-31],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*duration*]
  ),
  [ckan_default], [false],
  [label], [Duration],
  [standard mapping], [#link("https://schema.org/duration")[schema:duration]],
  [field_type],[text],
  [example], [30 minutes],
   table.cell(colspan: 2, align: left)[Description: ]
)
]

#block(breakable: false)[
#table(
  columns: (1fr, 1fr),
  table.header(
    table.cell(colspan: 2, align: center)[*in_language*]
  ),
  [ckan_default], [false],
  [label], [Language],
  [standard mapping], [#link("https://schema.org/inLanguage")[schema:inLanguage]],
  [field_type],[select],
  [example], [en],
  [options], [
    - en
    - es
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
  [field_type],[select],
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
  [standard mapping],
  [#link("https://schema.org/copyrightHolder")[schema:copyrightHolder]],
  [field_type],[text],
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
  [field_type],[multiple_select],
  [example], [],
  [options], [
    - workshop
    - conference
  ],
   table.cell(colspan: 2, align: left)[Description: ]
)
]




== Video
(https://schema.org/VideoObject)

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
  [standard mapping], [
    #link("https://www.dublincore.org/specifications/dublin-core/dcmi-terms/terms/creator/")[dc:creator]
  ],
  [field_type],[multiple_text],
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
    table.cell(colspan: 2, align: center)[*duration*]
  ),
  [ckan_default], [false],
  [label], [Duration],
  [standard mapping],
  [#link("https://schema.org/duration")[schema:duration]],
  [field_type],[text],
  [example], [30min],
   table.cell(colspan: 2, align: left)[Description: Duration of video resource in minutes ]
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
  [standard mapping],
  [#link("https://schema.org/copyrightHolder")[schema:copyrightHolder]],
  [field_type],[text],
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


== Learning-Resource
Alternative names:

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
  [standard mapping], [
    #link("https://www.dublincore.org/specifications/dublin-core/dcmi-terms/terms/creator/")[dc:creator]
  ],
  [field_type],[multiple_text],
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
  [standard mapping],
  [#link("https://schema.org/copyrightHolder")[schema:copyrightHolder]],
  [field_type],[text],
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
  [standard mapping], [
    #link("https://schema.org/category")[schema:category]
  ],
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
  [standard mapping], [
    #link("https://www.dublincore.org/specifications/dublin-core/dcmi-terms/terms/creator/")[dc:creator]
  ],
  [field_type],[multiple_text],
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
   [field_type],[multiple_select],
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
  [field_type],[select],
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
  [field_type],[select],
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
  [standard mapping],
  [#link("https://schema.org/copyrightHolder")[schema:copyrightHolder]],
  [field_type],[text],
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
  [field_type],[select],
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

== Examples by Category

=== Journal Article

- Uncertainty matters: ascertaining where specimens in natural history collections come from and its implications for predicting species distributions (https://doi.org/10.1111/ecog.06025)

=== Publication General

- Georeferencing Best Practices. Copenhagen: GBIF Secretariat (https://doi.org/10.15468/doc-gg7h-s853)
- Georeferencing Quick Reference Guide. Copenhagen (https://doi.org/10.35035/e09p-h128)
- Rapid Creation of a Data Product for the World's Specimens of Horseshoe Bats and Relatives, a Known Reservoir for Coronaviruses (https://doi.org/10.5281/zenodo.5044247)

=== Software Application

-  **NGS Coordinate Conversion and Transformation Tool (NCAT) (https://www.ngs.noaa.gov/NCAT/)** - web app
- Google Earth - https://earth.google.com/ - web app
- Biodiversity Enhanced Location Services (BELS) (https://github.com/VertNet/bels) - source code
- Geolocate Web Services (https://www.geo-locate.org/developers/default.html) - api
- GeoNames Web Services (https://www.geonames.org/export/web-services.html) - api
- Nominatim API - OpenStreetMap (https://nominatim.org/release-docs/latest/api/Overview/)
- Google Gemini (https://gemini.google.com/app) - web app
- GeoLocate (https://www.geo-locate.org/) - web app
- GeoLocate - Collaborative Georeferencing (CoGe) (https://www.geo-locate.org/community/default.html) - web app
- Geonames (https://www.geonames.org/) - web app
- spaCy (https://spacy.io/) - package/library

=== Web Resource

- Darwin Core (https://dwc.tdwg.org/list/) - standard
- California Phenology Network Illustrated Georeferencing Guidelines (https://www.capturingcaliforniasflowers.org/uploads/1/6/3/7/16372936/georeferencingpictureguide_v2.pdf) - guide
- BugFlow Modules (https://entcollnet.github.io/BugFlow/modules/) - protocol
- LACMIP EMu Handbook (https://lacmip.github.io/emu/) - protocol

=== Learning Resource

- Georeferencing for Paleo - 2020 Workshop (https://tdwg.github.io/esp/georeferencing/2020-workshop.html)
- Georeferencing in CCH2 Training Course (https://www.capturingcaliforniasflowers.org/georeferencingcourse.html)
- 
=== Resource Hub

- TDWG Earth Science and Paleobiology Interest Group (https://tdwg.github.io/esp/georeferencing/workflows)
- California Phenology Network Georeferencing Hub (https://www.capturingcaliforniasflowers.org/georeferencing-protocols-and-guides.html)

=== Video
- How to reverse geocode coordinates using the Google Maps API and OpenRefine (https://vimeo.com/507204276)
== Summarized steps

=== Step 1 Installation

CKAN provides detailed installation and upgrading instructions in their documentation for several install methods (https://docs.ckan.org/en/latest/maintaining/installing/index.html). Two recommended ways would be:
- Source install
- Docker Compose install

As the knowledge base is expected to be run in its own server running only that application we can aim to do a source install for our production environment a Linux server with *Ubuntu 24.04 LTS*. The installation step would require installing and setting up different resources that are necessary for the functioning of CKAN. The main dependencies are:

- CKAN core code from GitHub repository (https://github.com/ckan/ckan)
- Python -- it accepts v3.9 or newer, I would recommend we use Python 3.12.3 which comes installed by default in Ubuntu 24.04
- PostgreSQL RDMS -- for the main database. it accepts v12 or newer. I would recommend we directly install v17 which was recently released and has #link("https://www.postgresql.org/about/news/postgresql-17-released-2936/")[better support for JSONB columns]
- Redis -- for background jobs
- Apache Solr --  for the search engine. Compatible with latest v9.x

Installation for production would be done a in VPS or dedicated server. A most likely option would be AWS as we have services hosted there already (i.e., BioSpex). CKAN documentation contains detailed installation instructions which can be found in [CKAN installation manual](https://docs.ckan.org/en/latest/maintaining/installing/index.html).
For more detail custom installation steps I prepared see [[CKAN installation]].

Roles
- Robert:
	- Select the best platform and mode of hosting the application and database.
	- Link the application with the desired domain
	- Secure the application and database
- Fritz:
	- Provide assistance based on his knowledge of CKAN
- ACIS team:
	- Potential assistance hosting the application:
		- Provide advice on best practices
		- Security advice
		- 

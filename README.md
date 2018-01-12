# recipe-for-hippo-db-migration

This recipe explains how to migrate the database of Hippo CMS to a different database.

## Installation

Download this repository as zip file and extract it to a folder wherer you want to execute this migration script.

## Steps Overview

  - Step 1: Configure the *Source* repository and *Backup* (that is, *Target*) repository by adding ```conf/source-repository.xml``` and ```conf/backup-repository.xml```.
  - Step 2: Copy all the necessary JAR files to ```lib/``` directory.
  - Step 3: Execute ```bin/migrate.sh```
  - Step 4: Validation

## Step 1: Configure Source repository and Backup (Target) repository

- Find an example for your source and backup Database systems under [Configure Hippo CMS for your Database Server](https://www.onehippo.org/library/deployment/configuring/databases.html) page.
- Find the **Repository.xml for Repository Consistency Checker** section in each Database specific configuration page and copy the ```repository.xml``` in the section to ```conf/source-repository.xml``` or ```conf/backup-repository.xml```.
- You need to update the database connection settings in ```conf/source-repository.xml``` and ```conf/backup-repository.xml```.
- For H2 database, be referred to [conf/examples/h2-repository.xml](conf/examples/h2-repository.xml).

## Step 2: Copy all the necessary JAR files to lib/ directory

Copy the following jar files in Hippo CMS Server to ```lib/``` directory:

- ```jackrabbit-standalone-2.x.x.jar``` (which you can download from http://jackrabbit.apache.org/jcr/downloads.html).
- $CATALINA_BASE/common/lib/*.jar
- $CATALINA_BASE/shared/lib/*.jar
- $CATALINA_BASE/webapps/cms/WEB-INF/lib/*.jar
- All the necessary JDBC jar files

## Step 3: Execute bin/migrate.sh

Execute it.

```bash
$ sh bin/migrate.sh \
  --conf conf/source-repository.xml \
  --repo source-storage \
  --backup-conf conf/backup-repository.xml \
  --backup-repo backup-storage
```

## Step 4: Validation

After the Step 3, all the data has been copied to the new *Target* Hippo CMS Database.

Find an example ```repository.xml``` for the new *Target* Database systems under [Configure Hippo CMS for your Database Server](https://www.onehippo.org/library/deployment/configuring/databases.html) page.

And, configure the database setting in ```conf/context.xml``` and deploy Hippo CMS to the new *Target* system with the new ```repository.xml```.

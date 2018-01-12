# Recipe for Migrating Hippo CMS Database from one to another

This recipe explains how to migrate the database of Hippo CMS to a different database.
For example, from MySQL to PostreSQL, from MSSQL to MySQL or PostgreSQL, from Oracle to MySQL or PostgreSQL, etc.

## Installation

Download this Git repository as zip file and extract it to a folder wherer you want to execute this migration script.

## Steps Overview

  - Step 1: Configure the *Source* repository and *Backup* (that is, *Target*) repository by adding ```conf/source-repository.xml``` and ```conf/backup-repository.xml```.
  - Step 2: Copy the repository directory of the *Source* system to local system
  - Step 3: Copy all the necessary JAR files to ```lib/``` directory.
  - Step 4: Execute ```bin/migrate.sh```
  - Step 5: Validation

## Step 1: Configure Source repository and Backup (Target) repository

- Find an example for your source and backup Database systems under [Configure Hippo CMS for your Database Server](https://www.onehippo.org/library/deployment/configuring/databases.html) page.
- Find the **Repository.xml for Repository Consistency Checker** section in each Database specific configuration page and copy the ```repository.xml``` in the section to ```conf/source-repository.xml``` or ```conf/backup-repository.xml```.
- You need to update the database connection settings in ```conf/source-repository.xml``` and ```conf/backup-repository.xml```.
- For H2 database, be referred to [conf/examples/h2-repository.xml](conf/examples/h2-repository.xml).

## Step 2: Copy the repository directory of the Source system to local system where you execute this tool

- Copy the repository directory of the *Source* Hippo CMS system to a local folder.
  Note that the repository directory is typically specified by either ```-Drepo.path=...``` system property (e.g, ```-Drepo.path=storage```) or ```repository-directory``` context init parameters in ```conf/context.xml```.
- After copying it, remove ```workspaces/default/workspace.xml```, which should be regenerated.

## Step 3: Copy all the necessary JAR files to lib/ directory

Copy the following jar files in Hippo CMS Server to ```lib/``` directory:

- ```jackrabbit-standalone-2.x.x.jar``` (for the best compatible version which you can download from http://jackrabbit.apache.org/jcr/downloads.html).
- ```hippo-addon-checker-x.x.x.jar``` (for the best compatible version from http://maven.onehippo.com/maven2/org/onehippo/cms7/hippo-addon-checker/, 2.x for Hippo CMS 12 and 1.x for earlier versions).
- $CATALINA_BASE/common/lib/*.jar
- $CATALINA_BASE/shared/lib/*.jar
- $CATALINA_BASE/webapps/cms/WEB-INF/lib/*.jar
- All the necessary JDBC jar files for *Source* database and *Backup* (*Target*) database.

## Step 4: Execute bin/migrate.sh

Execute it.

```bash
$ sh bin/migrate.sh \
  --conf conf/source-repository.xml \
  --backup-conf conf/backup-repository.xml \
  --repo source-storage \
  --backup-repo backup-storage
```

You can trace the log file, ```jackrabbit.log_IS_UNDEFINED```, while being executed.

## Step 5: Validation

After the Step 3, all the data has been copied to the new *Target* Hippo CMS Database.

Find an example ```repository.xml``` for the new *Target* Database systems under [Configure Hippo CMS for your Database Server](https://www.onehippo.org/library/deployment/configuring/databases.html) page.

And, configure the database setting in ```conf/context.xml``` and deploy Hippo CMS to the new *Target* system with the new ```repository.xml```.

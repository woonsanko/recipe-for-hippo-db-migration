# recipe-for-hippo-db-migration

This recipe explains how to migrate the database of Hippo CMS to a different database.

## Steps Overview

  - Step 1: Configure the source repository and target repository by adding ```conf/source-repository.xml``` and ```conf/target-repository.xml```.
  - Step 2: Copy all the necessary JAR files to ```lib/``` directory.
  - Step 3: Execute ```bin/migrate.sh```

## Step 1: Configure conf/source-repository and conf/target-repository

- Find an example for your source and target Database systems under [Configure Hippo CMS for your Database Server](https://www.onehippo.org/library/deployment/configuring/databases.html) page.
- Find the **Repository.xml for Repository Consistency Checker** section in each Database specific configuration page and copy the ```repository.xml``` in the **Repository.xml for Repository Consistency Checker** section to ```conf/source-repository.xml``` or ```conf/target-repository.xml```.
- You need to update the database connection settings in ```conf/source-repository.xml``` and ```conf/target-repository.xml```.

## Step 2: Copy all the necessary JAR files to lib/ directory

Copy the following jar files in Hippo CMS Server to ```lib/``` directory:

- $CATALINA_BASE/common/lib/*.jar
- $CATALINA_BASE/shared/lib/*.jar
- $CATALINA_BASE/webapps/cms/WEB-INF/lib/*.jar
- All the necessary JDBC jar files

## Step 3: Execute bin/migrate.sh

Execute it.

```bash
$ sh bin/migrate.sh
```


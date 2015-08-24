TODO explain how to setup crawler with tescobank taken as an example

CREATE DATABASE crawl;

DROP TABLE tescobank;

CREATE TABLE tescobank (
 url VARCHAR(512),
 status VARCHAR(16) DEFAULT 'DISCOVERED',
 nextfetchdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 metadata TEXT,
 bucket SMALLINT DEFAULT 0,
 PRIMARY KEY(url)
);

INSERT INTO tescobank (url, metadata) VALUES ("http://www.tescobank.com/sitemap.xml","isSitemap=true");

# configure CloudSearch domain

The script `createCSDomain.sh` can be used with the AWS CLI to configure a CloudSearch domain.

# run

`mvn exec:java -Dexec.mainClass=com.digitalpebble.stormcrawler.CrawlTopology -Dexec.args="-conf crawler-conf.yaml -local`

or with Storm installed 

`storm jar target/stormcrawler-tescobank-0.1-SNAPSHOT.jar com.digitalpebble.stormcrawler.CrawlTopology -conf crawler-conf.yaml -local`

remove `-local` to run in deployed mode.

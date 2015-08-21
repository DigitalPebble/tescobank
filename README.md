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

# TODO configure CloudSearch domain

# run

`mvn exec:java -Dexec.mainClass=com.digitalpebble.stormcrawler.CrawlTopology -Dexec.args="-conf crawler-conf.yaml -local`

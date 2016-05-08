.headers on
.mode csv
.separator ","
.output stdout
select id, title, author, url, flags_last_modified from rss_item where not unread and flags_last_modified is not null and flags like '%i%';


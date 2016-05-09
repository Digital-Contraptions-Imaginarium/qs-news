delete from rss_read where item_last_modified < date('now', 'localtime', '-4 days');

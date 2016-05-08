.headers on
.mode csv
.separator ","
.output stdout
select *
    from rss_read
    where
        (item_last_modified >= date('now', 'localtime', '-1 hour')) AND
        (item_last_modified < date('now', 'localtime', '-1 hour', '+1 day'));

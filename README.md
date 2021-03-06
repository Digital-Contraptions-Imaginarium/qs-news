qs-news
=======

This repository includes a series of scripts that modify Newsbeuter's internal SQLite3 database to save the history of usage into an extra table called _rss_read_.

Whenever any of the following changes takes place:

- an article is downloaded from the source feed
- an article goes from unread to read,
- an article goes from logically 'undeleted' to deleted, or
- any flags are added / changed

the new record is copied to _rss_read_, together with a timestamp in the _item_last_modified_ column. Physical deletion of records from _rss_item_ does not affect _rss_read_.

Using scripts such as _extract.sql_, all _rss_read_ records generated during the current day are printed to standard output in CSV format (note that _extract_ is written to output all activity of the date that was 1 hour before the script is called, this may not necessarily be what you need).

Remember to do some kind of garbage collection, too, e.g. the _garbage-collect.sql_ script deletes everything older than four days ago.

To "install" the features, Newsbeuter's database need being changed by using the _database-setup.sql_ script. On Fedora, for example, this is done by running:

    cp ~/.local/share/newsbeuter/cache.db ./cache.db.ORIGINAL
    cat database-setup.sql | sqlite3 ~/.local/share/newsbeuter/cache.db

It is recommended to make a copy of the original database before installing, as shown in the example.

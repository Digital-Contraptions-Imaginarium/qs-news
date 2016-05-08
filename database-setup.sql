CREATE TABLE rss_read AS SELECT * FROM rss_item WHERE 0;
ALTER TABLE rss_read ADD COLUMN item_last_modified TIMESTAMP DEFAULT NULL;
CREATE TRIGGER update_record_last_modified AFTER UPDATE ON rss_item
    FOR EACH ROW
        WHEN (old.unread AND NOT new.unread) OR
             ((NOT old.deleted) AND new.deleted) OR
             (old.flags != new.flags)
    BEGIN
        INSERT INTO rss_read
            SELECT a.*, datetime('now', 'localtime') AS item_last_modified
            FROM rss_item AS a
            WHERE rowid = new.rowid;
    END;

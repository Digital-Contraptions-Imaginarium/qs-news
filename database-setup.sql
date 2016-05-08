ALTER TABLE rss_item ADD COLUMN flags_last_modified TIMESTAMP DEFAULT NULL;
CREATE TRIGGER update_record_last_modified AFTER UPDATE ON rss_item
    FOR EACH ROW WHEN old.flags != new.flags
    BEGIN
        UPDATE rss_item SET flags_last_modified = datetime('now', 'localtime')
        WHERE rowid = new.rowid;
    END;

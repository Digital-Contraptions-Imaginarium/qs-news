qs-news
=======

This repository includes a series of scripts that modify Newsbeuter's internal SQLite3 database to support the identification of "flagged" articles and the date and time their flags were last changed.

Flagging is a native functionality of Newsbeuter, accessible by doing CTRL+E on a selected article, but there is no way to know when the flagging took place, that also means that Newsbeuter's database cannot be used out of the box to produce a list of articles flagged in a specified time frame.

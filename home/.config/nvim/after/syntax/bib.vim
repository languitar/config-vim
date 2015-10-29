" Do not highlight bibUnescapedSpecial as this results in broken highlights
" with & signs in URLs.
syn cluster bibVarContents	contains=bibBrace,bibParen

" define further types supported by biblatex
syn keyword bibType contained  mvbook bookinbook suppbook collection
syn keyword bibType contained  mvcollection suppcollection online patent
syn keyword bibType contained  periodical suppperiodical mvproceedings
syn keyword bibType contained  inproceedings reference mvreference
syn keyword bibType contained  inreference report set thesis xdata
syn keyword bibType contained  electronic www

" adapt entries to biblatex repertoire
syn clear bibNSEntryKw
syn keyword bibEntryKw contained  abstract addendum afterword annotation
syn keyword bibEntryKw contained  annotator authortype bookauthor
syn keyword bibEntryKw contained  bookpagination booksubtitle booktitleaddon
syn keyword bibEntryKw contained  commentator date doi editora editorb editorc
syn keyword bibEntryKw contained  editortype editoratype editorbtype
syn keyword bibEntryKw contained  editorctype eid entrysubtype eprint
syn keyword bibEntryKw contained  eprintclass eprinttype eventdate eventtitle
syn keyword bibEntryKw contained  eventtitleaddon file foreword holder
syn keyword bibEntryKw contained  indextitle introduction isan isbn ismn isrn
syn keyword bibEntryKw contained  issn issue issuesubtitle issuetitle iswc
syn keyword bibEntryKw contained  journalsubtitle journaltitle label language
syn keyword bibEntryKw contained  library location mainsubtitle maintitle
syn keyword bibEntryKw contained  maintitleaddon nameaddon origdate
syn keyword bibEntryKw contained  origlanguage origlocation origpublisher
syn keyword bibEntryKw contained  origtitle pagetotal pagination part pubstate
syn keyword bibEntryKw contained  reprinttitle shortauthor shorteditor
syn keyword bibEntryKw contained  shorthand shorthandintro shortjournal
syn keyword bibEntryKw contained  shortseries shorttitle subtitle titleaddon
syn keyword bibEntryKw contained  translator url urldate venue version
syn keyword bibEntryKw contained  volumes

syn keyword bibEntryKw contained  archiveprefix pdf primaryclass

syn keyword bibNSEntryKw contained  crossref entryset execute gender langid
syn keyword bibNSEntryKw contained  langidopts ids indexsorttitle keywords
syn keyword bibNSEntryKw contained  options presort related relatedoptions
syn keyword bibNSEntryKw contained  relatedtype relatedstring sortkey sortname
syn keyword bibNSEntryKw contained  sortshorthand sorttitle sortyear xdata
syn keyword bibNSEntryKw contained  xref

syn keyword bibNSEntryKw contained  namea nameb namec nameatype namebtype
syn keyword bibNSEntryKw contained  namectype lista listb listc listd liste
syn keyword bibNSEntryKw contained  listf usera userb userc userd usere userf
syn keyword bibNSEntryKw contained  verba verbb verbc

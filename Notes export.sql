USE RE7
select
NotesId,
NoteTypeId,
NotepadDate,
Title,
Description,
Author,
ActualNotes,
Sequence,
ParentId as record_id,
Import_Id,
DateAdded,
AddedById,
DateChanged,
LastChangedById
from ConstituentNotepad
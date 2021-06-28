# atlasProcessor
collection of tools to process "atlas" video collection at aclu

WORKFLOW:
<br> (1) Run Batch2MOV to convert Atlas MP4 to MOV access files. The converted files are stored in new directory MOV_Converts.
<br> (2) Run DirectoryManifest on MOV_Converts to capture original names (BaseName is the column name in output CSV file) of all MOV files.
<br> (3) Create "NewName" column in DirectoryManifest CSV file and enter desired name for each file.
<br> (4) Run RenameFromCSV to rename all MOVs in MOV_Converts.

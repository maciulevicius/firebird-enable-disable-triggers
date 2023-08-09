SET TERM ^ ;
EXECUTE BLOCK
AS
DECLARE VARIABLE NOMTABLE varchar(100);
DECLARE VARIABLE REQ1 Varchar(100);
BEGIN
for select x.RDB$TRIGGER_NAME from rdb$triggers x where
rdb$trigger_source is not null and (coalesce(rdb$system_flag,0) = 0)
and rdb$trigger_source not starting with 'CHECK' into :NOMTABLE
do
begin
NOMTABLE=trim(NOMTABLE);
req1= 'ALTER TRIGGER "' || :NOMTABLE || '" INACTIVE;';
execute statement req1;
end
END^
SET TERM ; ^
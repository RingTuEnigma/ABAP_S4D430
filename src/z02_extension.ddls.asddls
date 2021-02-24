@AbapCatalog.sqlViewAppendName: 'Z02_EX_SQL'
@EndUserText.label: 'Task 13'
extend view Z02_EXTENDED with Z02_EXTENSION association[1..1] to spfli as _connection 
on b.carrid = _connection.carrid
and b.connid = _connection.connid
{
    b.class,
    b.counter,
    _connection
} 
 
unit dbutils;

{$mode objfpc}{$H+}

interface

uses
  dSQLdbBroker, SysUtils, PQConnection;

function con: TdSQLdbConnector;

implementation

var
  _con: TdSQLdbConnector = nil;

function con: TdSQLdbConnector;
begin
  if not Assigned(_con) then
  begin
    _con := TdSQLdbConnector.Create(nil);
    _con.Driver := 'mysql.5.6';
    _con.Host := '127.0.0.1';
    _con.Database := 'ypud';
    _con.User := 'root';
    _con.Password := 'suckarep';
  end;
  Result := _con;
end;

finalization
  FreeAndNil(_con);

end.


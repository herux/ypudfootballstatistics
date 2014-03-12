unit baseentity;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, dbutils, sqldb;

type
  EYPUDException = class(Exception);

  { TYPUDBaseEntity }

  TYPUDBaseEntity = class
  protected

  private
    FId: Int64;
  public
    procedure Validate;  virtual;
    procedure Save; virtual;
  published
    property Id: Int64 read FId write FId;
  end;

implementation

{ TYPUDBaseEntity }

procedure TYPUDBaseEntity.Validate;
begin
  //
end;

procedure TYPUDBaseEntity.Save;
var
  q: TSQLQuery;
  t: TSQLTransaction;
  c: TSQLConnection;
begin
  Validate;
  t := TSQLTransaction.Create(nil);
  q := TSQLQuery.Create(nil);
  try
    c := dbutils.Connection;
    t.DataBase := c;
    q.Transaction := t;
    q.DataBase := c;
    q.SQL.Text := 'insert into person (name) values (:name)';
    q.Params.ParamByName('name').AsString := FName;
    try
      q.ExecSQL;
      t.Commit;
    except
      t.Rollback;
      raise;
    end;
  finally
    q.Free;
    t.Free;
  end;
end;

end.


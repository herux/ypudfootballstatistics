unit baseentity;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, dbutils, sqldb;

type
  EYPUDException = class(Exception);

  TYPUDEntityState = (esInsert, esUpdate, esDelete, esBrowse);

  { TYPUDBaseEntity }

  TYPUDBaseEntity = class
  protected
    function InsertSQL: String; abstract;
    function UpdateSQL: String; abstract;
    function DeleteSQL: String; abstract;
    procedure SetupParams; abstract;
  private
    FConnection: TSQLConnection;
    FId: Int64;
    FQuery: TSQLQuery;
    FState: TYPUDEntityState;
    FTransaction: TSQLTransaction;
  public
    constructor Create;
    destructor Destroy; override;

    property Query: TSQLQuery read FQuery write FQuery;
    property Transaction: TSQLTransaction read FTransaction write FTransaction;
    property Connection: TSQLConnection read FConnection write FConnection;
    procedure Validate;  virtual;
    procedure Save; virtual;
    property State: TYPUDEntityState read FState write FState;
  published
    property Id: Int64 read FId write FId;
  end;

implementation

{ TYPUDBaseEntity }

constructor TYPUDBaseEntity.Create;
begin
  FTransaction := TSQLTransaction.Create(nil);
  FQuery := TSQLQuery.Create(nil);
  FConnection := dbutils.Connection;
  FTransaction.DataBase := FConnection;
  FQuery.Transaction := FTransaction;
  FQuery.DataBase := FConnection;
end;

destructor TYPUDBaseEntity.Destroy;
begin
  FQuery.Free;
  FTransaction.Free;
  FConnection.Free;
  inherited Destroy;
end;

procedure TYPUDBaseEntity.Validate;
begin
  //
end;

procedure TYPUDBaseEntity.Save;
begin
  Validate;
  case State of
    esInsert : Query.SQL.Text := InsertSQL;
    esUpdate : Query.SQL.Text := UpdateSQL;
    esDelete : Query.SQL.Text := DeleteSQL;
    esBrowse := ;
  end;
  SetupParams;
  try
    Query.ExecSQL;
    Transaction.Commit;
  except
    Transaction.Rollback;
    raise;
  end;
end;

end.


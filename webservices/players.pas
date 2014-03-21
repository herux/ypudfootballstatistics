unit players;

{$mode objfpc}{$H+}

interface

uses
  dSQLdbBroker, dbutils, SysUtils;

type
  EYPUDException = class(Exception);

  { TYPUDPlayer }

  TYPUDPlayer = class
  private
    FForName: string;
  public
    procedure Validate;
  published
    property ForName: string read FForName write FForName;
  end;

  { TYPUDPlayerOpf }

  TYPUDPlayerOpf = class(specialize TdGSQLdbOpf<TYPUDPlayer>)
  public
    constructor Create; overload;
  end;

implementation

{ TYPUDPlayerOpf }

constructor TYPUDPlayerOpf.Create;
begin
  inherited Create(dbutils.con, 'players');
end;

{ TYPUDPlayer }

procedure TYPUDPlayer.Validate;
begin
  if Trim(FForName) = '' then
    raise EYPUDException.Create('Name must not be empty.');
end;

end.


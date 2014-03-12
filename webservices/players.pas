unit players;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, baseentity;

type

  { TYPUDPlayer }

  TYPUDPlayer = class(TYPUDBaseEntity)
  private
    FForName: string;
  public
    procedure Validate; override;
    procedure Save; override;
  published
    property ForName: string read FForName write FForName;
  end;

implementation

{ TYPUDPlayer }

procedure TYPUDPlayer.Validate;
begin
  inherited Validate;
  if Trim(FForName) = '' then
    raise EYPUDException.Create('Name must not be empty.');
end;

procedure TYPUDPlayer.Save;
begin
  inherited Save;
end;

end.


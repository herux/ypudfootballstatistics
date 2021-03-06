unit teams;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, baseentity;

type

  { TYPUDTeam }

  TYPUDTeam = class(TYPUDBaseEntity)
  private
    FForName: string;
  public
    procedure Validate; override;
    procedure Save; override;
  published
    property ForName: string read FForName write FForName;
  end;

implementation

{ TYPUDTeam }

procedure TYPUDTeam.Validate;
begin
  inherited Validate;
end;

procedure TYPUDTeam.Save;
begin
  inherited Save;
end;

end.


unit matchs;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, baseentity;

type

  { TYPUDMatch }

  TYPUDMatch = class(TYPUDBaseEntity)
  private
    FForName: string;
  public
    procedure Validate; override;
    procedure Save; override;
  published
  end;

implementation

{ TYPUDMatch }

procedure TYPUDMatch.Validate;
begin
  inherited Validate;
end;

procedure TYPUDMatch.Save;
begin
  inherited Save;
end;

end.


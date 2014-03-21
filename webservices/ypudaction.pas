unit ypudaction;

{$mode objfpc}{$H+}

interface

uses
  BrookAction;

type
  TYPUDAction = class(TBrookAction)
  public
    procedure Get; override;
  end;

implementation

procedure TYPUDAction.Get;
begin
  Write('Your content here ... ');
end;

initialization
  TYPUDAction.Register('*');

end.

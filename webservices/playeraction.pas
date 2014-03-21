unit playeraction;

{$mode objfpc}{$H+}

interface

uses
  BrookAction, players;

type

  { TPlayerRESTAction }

  TPlayerRESTAction = class(specialize TBrookGAction<TYPUDPlayer>)
  private
    FOpf: TYPUDPlayerOpf;
  public
    constructor Create; overload; override;
    destructor Destroy; override;
    procedure Get; override;
    procedure Post; override;
    procedure Put; override;
    procedure Delete; override;
    property Opf: TYPUDPlayerOpf read FOpf;
  end;

implementation

{ TPlayerRESTAction }

constructor TPlayerRESTAction.Create;
begin
  inherited Create;
  FOpf:= TYPUDPlayerOpf.Create;
end;

destructor TPlayerRESTAction.Destroy;
begin
  FOpf.Free;
  inherited Destroy;
end;

procedure TPlayerRESTAction.Get;
var
  lPlayer: TYPUDPlayer;
  lPlayers: TYPUDPlayerOpf.TEntities;
begin
  lPlayers := TYPUDPlayerOpf.TEntities.Create;
  try
    FOpf.List(lPlayers);
    for lPlayer in lPlayers do
      Write('Name: %s<br />', [lPlayer.ForName]);
  finally
    lPlayers.Free;
  end;
end;

procedure TPlayerRESTAction.Post;
begin
  Entity.Validate;
  FOpf.Add(Entity);
  FOpf.Apply;
end;

procedure TPlayerRESTAction.Put;
begin
  Entity.Validate;
  FOpf.Modify(Entity);
  FOpf.Apply;
end;

procedure TPlayerRESTAction.Delete;
begin
  FOpf.Remove(Entity);
  FOpf.Apply;
end;

initialization
  TPlayerRESTAction.Register('*');

end.


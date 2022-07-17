unit PIP.Main;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  {%H-}Math,
  {%H-}PIP.Utils;

procedure Run;

implementation

uses
  PIP.Cases02_05;

procedure Run;
type
  sets = set of char;
begin
  Main;
end;

end.

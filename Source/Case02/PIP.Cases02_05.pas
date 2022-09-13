unit PIP.Cases02_05;

{$mode objfpc}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

procedure Main;
var
  x, i: integer;
  fish: double;
begin
  fish := 11;

  for i := 5 downto 2 do
  begin
    fish := (1 / i) + fish * i;
  end;

  WriteLnF('共有%f条金鱼。', [fish]);
end;

end.

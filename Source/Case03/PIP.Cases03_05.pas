unit PIP.Cases03_05;

{$mode objfpc}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  Math,
  DeepStar.Utils;

procedure Main;

implementation

procedure Main;
var
  ind, ten, hun, n: integer;
begin
  Write('Result is: ');
  for n := 100 to 999 do
  begin
    hun := n div 100;
    ten := (n - hun * 100) div 10;
    ind := n mod 10;

    if hun ** 3 + ten ** 3 + ind ** 3 = n then
      WriteF('%4d'#09, [n]);
  end;

  WriteLn;
end;

end.

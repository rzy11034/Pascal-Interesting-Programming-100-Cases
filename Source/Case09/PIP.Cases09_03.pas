unit PIP.Cases09_03;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

procedure Hanoi(n: integer; a, b, c: char);
begin
  if n = 1 then
    WriteLnF('move dish %d form %s to %s.', [n, a, c])
  else
  begin
    Hanoi(n - 1, a, c, b);
    WriteLnF('move dish %d form %s to %s.', [n, a, c]);
    Hanoi(n - 1, b, a, c);
  end;
end;

procedure Main;
var
  n: integer;
begin
  Write('Please input the number of dishes:');
  n := 3;
  WriteLnF('%d', [n]);
  WriteLnF('The steps to move %2d dishes are:', [n]);
  Hanoi(n, 'A', 'B', 'C');
end;

end.

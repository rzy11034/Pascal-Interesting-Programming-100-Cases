unit PIP.Cases02_07;

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
  n, Count, sum: integer;
begin
  sum := 0;
  Count := 1000;

  for n := 7 to Count do
  begin
    if (n mod 7 = 0) and (n mod 6 = 5) and (n mod 5 = 4) and (n mod 4 = 3)
      and (n mod 3 = 2) and (n mod 2 = 1) then
    begin
      sum += 1;
      WriteLn(n);
    end;
  end;

  WriteLnF('在1—%d之间， 有%d个数。', [Count, sum]);
end;

end.

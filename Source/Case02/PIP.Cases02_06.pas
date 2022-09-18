unit PIP.Cases02_06;

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
  t, i, k: integer;
  a: array[0..4] of integer;
begin
  i := 95860;
  while true do
  begin
    t := 0;
    k := 100000;
    while k >= 10 do
    begin
      a[t] := (i mod k) div (k div 10);
      k := k div 10;
      t += 1;
    end;

    if (a[0] = a[4]) and (a[1] = a[3]) then
    begin
      WriteLnF('里程表上出现的新的对称数为：%d%d%d%d%d', [a[0], a[1], a[2], a[3], a[4]]);
      WriteLnF('该车的速度为：%.2f', [(i - 95859) / 2]);
      Break;
    end;

    i += 1;
  end;
end;

end.

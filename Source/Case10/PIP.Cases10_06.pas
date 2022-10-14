unit PIP.Cases10_06;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils,
  DeepStar.UString;

procedure Main;

implementation

function Reverse(n: integer): integer;
var
  str: string;
begin
  str := n.ToString;
  str := str.ReverseString;

  if TryStrToInt(str, Result) then
    Exit
  else
    Result := -1;
end;

procedure Fun(n: integer);
var
  sum, Count: integer;
begin
  Count := 0;

  while true do
  begin
    if Reverse(n) < 0 then
    begin
      WriteLnF('%d: 超出范围',[n]);
      Exit;
    end;

    if n <> Reverse(n) then
    begin
      sum := n + Reverse(n);
      Count += 1;
      WriteLnF('[%d] %d+%d=%d', [Count, n, Reverse(n), sum]);
      n := sum;
    end
    else
    begin
      Break;
    end;
  end;
end;

procedure Main;
begin
  Fun(1993);
  DrawLineBlockEnd;

  Fun(1996);
  DrawLineBlockEnd;

  Fun(1047483642);
end;

end.

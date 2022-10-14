unit PIP.Cases10_02;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

procedure Fun(n: integer);
var
  Count: integer;
begin
  Count := 0;
  Write('请输入一个自然数：');
  WriteLn(n);

  repeat
    if Odd(n) then
    begin
      n := n * 3 + 1;
      Count += 1;
      WriteLnF('[%d]:%d*3+1=%d', [Count, (n - 1) div 3, n]);
    end
    else
    begin
      n := n div 2;
      Count += 1;
      WriteLnF('[%d]:%d/2=%d', [Count, 2 * n, n]);
    end;
  until n = 1;
end;

procedure Main;
var
  n: Integer;
begin
  n:=6;
  Fun(n) ;
  DrawLineBlockEnd;

  n:= 15;
  Fun(n);
end;

end.

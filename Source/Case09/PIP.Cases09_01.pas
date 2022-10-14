unit PIP.Cases09_01;

{$mode objfpc}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

function Age(n: integer): integer;
var
  x: integer;
begin
  if n = 1 then
    x := 10
  else
    x := Age(n - 1) + 2;

  Result := x;
end;

procedure Main;
var
  n: integer;
begin
  n := 5;
  WriteLnF('请输入n值：%d', [n]);
  WriteLnF('第%d个人的年龄为%d。', [n, Age(n)]);
end;

end.

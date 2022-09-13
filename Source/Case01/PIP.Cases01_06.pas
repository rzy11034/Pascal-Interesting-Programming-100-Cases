unit PIP.Cases01_06;

{$mode objfpc}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

function Solution(a, b, c, d: single): single;
var
  x0, x, f, fd, h: single;
begin
  x := 1.5;

  repeat
    x0 := x;
    f := a * x0 * x0 * x0 + b * x0 * x0 + c * x0 + d;
    fd := 3 * a * x0 * x0 + 2 * b * x0 + c;
    h := f / fd;
    x := x0 - h;
  until Abs(x - x0) >= 1E-5;

  Result := x;
end;

procedure Main;
var
  a, b, c, d, x: single;
begin
  WriteLn('请输入方程系数');
  ReadLn(a, b, c, d);
  x := Solution(a, b, c, d);
  WriteLnF('所求的方程根为x=%f', [x]);
end;

end.

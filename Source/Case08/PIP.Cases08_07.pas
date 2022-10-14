unit PIP.Cases08_07;

{$mode objfpc}{$J-}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

const
  _N_ = 5;

procedure Main;
var
  a: TArr2D_int;
  i, j, k, t, x, y: integer;
begin
  i := 0;
  j := _N_ div 2;
  t := _N_ - 1;
  SetLength(a, 5, 5);

  for k := 1 to _N_ * _N_ do
  begin
    a[i, j] := k;
    x := i;
    y := j;

    if i = 0 then
      i := t
    else
      i := i - 1;

    if j <> t then
      j := j + 1
    else
      j := 0;

    if a[i, j] <> 0 then
    begin
      i := x + 1;
      j := y;
    end;
  end;

  WriteLn('生成的5-魔方先为：');
  for i := 0 to _N_ - 1 do
  begin
    for j := 0 to _N_ - 1 do
    begin
      WriteF('%4d  ', [a[i, j]]);
    end;
    WriteLn;
  end;
end;

end.

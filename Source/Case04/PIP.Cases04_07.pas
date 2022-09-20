unit PIP.Cases04_07;

{$mode objfpc}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils,
  DeepStar.UString;

procedure Main;

implementation

function zxgb(a, b: integer): integer;
var
  c, d: integer;
begin
  if a < b then specialize Swap<integer>(a, b);

  c := a * b;
  while b <> 0 do
  begin
    d := b;
    b := a mod b;
    a := d;
  end;

  Result := c div a;
end;

procedure Main;
var
  i, j, k, l, m, n, x: integer;
  str: string;
  strs, a: TArr_str;
begin
  a := ['16/32, 4/8', '4/5, 6/7', '8/4, 16/32'];

  for x := 0 to High(a) do
  begin
    str := a[x];

    Write('Input two FENSHU(x/x, x/x):');
    WriteLn(str);
    strs := str.Split(['/', ',']);

    i := strs[0].ToInteger;
    j := strs[1].ToInteger;
    k := strs[2].ToInteger;
    l := strs[3].ToInteger;

    m := zxgb(j, l) div j * i;
    n := zxgb(j, l) div l * k;

    if m > n then
      WriteLnF('%d/%d > %d/%d', [i, j, k, l])
    else if m = n then
      WriteLnF('%d/%d = %d/%d', [i, j, k, l])
    else
      WriteLnF('%d/%d < %d/%d', [i, j, k, l]);

    DrawLineBlockEnd;
  end;
end;

end.

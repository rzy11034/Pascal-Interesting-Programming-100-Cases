unit PIP.Cases09_06;

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

var
  Count: integer = 0;

procedure Parse_sort(num: integer; arr: TArr_int);
var
  i: integer;
  chs: TArr_chr;
  str: string;
begin
  str := num.ToString;
  chs := str.ToCharArray;
  for i := 0 to High(chs) do
    arr[i] := Ord(chs[i]) - Ord('0');

  TArrayUtils_int.Sort(arr);
end;

procedure Max_min(arr: TArr_int; var max, min: integer);
var
  strMax, strMin: string;
  i: integer;
begin
  strMin := '';
  strMax := '';

  for i := 0 to High(arr) do
    strMin += arr[i].ToString;
  for i := High(arr) downto 0 do
    strMax += arr[i].ToString;

  max := strMax.ToInteger;
  min := strMin.ToInteger;
end;

procedure kblk(num: integer);
var
  arr: TArr_int;
  max, min: integer;
begin
  SetLength(arr, 4);

  if (num <> 6174) and (num <> 0) then
  begin
    Parse_sort(num, arr);
    Max_min(arr, max, min);
    num := max - min;
    Count += 1;
    WriteLnF('[%d]: %4d-%4d=%4d.', [Count, max, min, num]);
    kblk(num);
  end;
end;

procedure Main;
var
  n: integer;
begin
  Write('请输入一个四位整数：');
  n := 3569;
  WriteLn(n);
  kblk(n);
end;

end.

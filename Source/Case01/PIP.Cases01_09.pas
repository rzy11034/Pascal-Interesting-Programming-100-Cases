unit PIP.Cases01_09;

{$mode objfpc}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

function BinarySearch(var arr: TArr_int; m: integer): integer;
var
  l, r, mid, res: integer;
begin
  l := Low(arr);
  r := High(arr);
  res := -1;

  while l <= r do
  begin
    mid := l + (r - l) div 2;

    if m < arr[mid] then
    begin
      r := mid - 1;
    end
    else if m > arr[mid] then
    begin
      l := mid + 1;
    end
    else
    begin
      res := mid;
      Break;
    end;
  end;

  Result := res;
end;

procedure Main;
var
  arr: TArr_int;
  k, m: integer;
begin
  arr := [-3, 4, 9, 13, 45, 67, 89, 100, 180];

  WriteLn('数组中数据如下：');
  for m in arr do
    WriteF('%d ', [m]);
  WriteLn;

  WriteLn('Enter m:');
  ReadLn(m);

  k := BinarySearch(arr, m);

  if k >= 0 then
    WriteLnF('m=%d, index=%d', [m, k])
  else
    WriteLn('Not be found!');
end;

end.

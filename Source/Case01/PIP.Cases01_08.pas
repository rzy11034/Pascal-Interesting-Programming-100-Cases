unit PIP.Cases01_08;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,
  SysUtils,
  PIP.Utils;

procedure Main;

implementation

procedure BubbleSort(var arr: TArr_int);
var
  i, n, t, j, a: integer;
begin
  n := High(arr);

  for i := 1 to n do
  begin
    for j := 0 to n - i do
    begin
      if arr[j] > arr[j + 1] then
      begin
        t := arr[j];
        arr[j] := arr[j + 1];
        arr[j + 1] := t;
      end;
    end;

    for a in arr do
      WriteF('%d ', [a]);

    WriteLn;
  end;
end;

procedure Main;
var
  arr: TArr_int;
  i: integer;
begin
  Randomize;

  SetLength(arr, 20);

  for i := 0 to High(arr) do
  begin
    arr[i] := Random(99);
  end;

  BubbleSort(arr);
end;

end.

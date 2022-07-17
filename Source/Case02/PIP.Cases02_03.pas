unit PIP.Cases02_03;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,
  SysUtils,
  PIP.Utils;

procedure Main;

implementation

function judge(arr: TArr_int): boolean;
var
  i: integer;
begin
  Result := true;

  for i := 1 to High(arr) do
  begin
    if arr[i] <> arr[i - 1] then
    begin
      Result := false;
      Break;
    end;
  end;
end;

procedure Print(arr: TArr_int);
var
  i: Integer;
begin
  for i := 0 to High(arr) do
    WriteF('%5d', [arr[i]]);

  WriteLn;
end;

procedure Main;
var
  sweets, temps: TArr_int;
  i: integer;
begin
  sweets := [10, 2, 8, 22, 16, 4, 10, 6, 14, 20];
  SetLength(temps, Length(sweets));
  Print(sweets);

  while not judge(sweets) do
  begin
    // 同时分一半糖果，奇数向老师要一块
    for i := 0 to High(sweets) do
    begin
      if Odd(sweets[i]) then
        sweets[i] += 1;

      sweets[i] := sweets[i] div 2;
      temps[i] := sweets[i];
    end;

    // 给右边小朋友
    for i := 0 to High(temps) do
      sweets[(i + 1) mod Length(sweets)] += temps[i];

    Print(sweets);
  end;
end;

end.

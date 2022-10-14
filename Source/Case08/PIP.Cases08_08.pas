unit PIP.Cases08_08;

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
  _X_ = 8;
  _Y_ = 8;

var
  chess: TArr2D_int;

function NextXY(var x, y: integer; Count: integer): integer;
begin
  case Count of
    0:
    begin
      if (x + 2 <= _X_ - 1) and (y - 1 >= 0) and (chess[x + 2, y - 1] = 0) then
      begin
        x := x + 2;
        y := y - 1;
        Exit(1);
      end;
    end;

    1:
    begin
      if (x + 2 <= _X_ - 1) and (y + 1 <= _Y_ - 1) and (chess[x + 2, y + 1] = 0) then
      begin
        x := x + 2;
        y := y + 1;
        Exit(1);
      end;
    end;

    2:
    begin
      if (x + 1 <= _X_ - 1) and (y - 2 >= 0) and (chess[x + 1, y - 2] = 0) then
      begin
        x := x + 1;
        y := y - 2;
        Exit(1);
      end;
    end;

    3:
    begin
      if (x + 1 <= _X_ - 1) and (y + 2 <= _Y_ - 1) and (chess[x + 1, y + 2] = 0) then
      begin
        x := x + 1;
        y := y + 2;
        Exit(1);
      end;
    end;

    4:
    begin
      if (x - 2 >= 0) and (y - 1 >= 0) and (chess[x - 2, y - 1] = 0) then
      begin
        x := x - 2;
        y := y - 1;
        Exit(1);
      end;
    end;

    5:
    begin
      if (x - 2 >= 0) and (y + 1 <= _Y_ - 1) and (chess[x - 2, y + 1] = 0) then
      begin
        x := x - 2;
        y := y + 1;
        Exit(1);
      end;
    end;

    6:
    begin
      if (x - 1 >= 0) and (y - 2 >= 0) and (chess[x - 1, y - 2] = 0) then
      begin
        x := x - 1;
        y := y - 2;
        Exit(1);
      end;
    end;

    7:
    begin
      if (x - 1 >= 0) and (y + 2 <= _Y_ - 1) and (chess[x - 1, y + 2] = 0) then
      begin
        x := x - 1;
        y := y + 2;
        Exit(1);
      end;
    end;
  end;

  Result := 0;
end;

function TravelChessBoard(x, y, tag: integer): integer;
var
  x1, y1, flag, Count: integer;
begin
  x1 := x;
  y1 := y;
  flag := 0;
  Count := 0;
  chess[x, y] := tag;

  if tag = _X_ * _Y_ then
    Exit(1);

  flag := NextXY(x1, y1, Count);
  while (flag = 0) and (Count < 7) do
  begin
    Count += 1;
    flag := NextXY(x1, y1, Count);
  end;

  while flag <> 0 do
  begin
    if TravelChessBoard(x1, y1, tag + 1) <> 0 then
      Exit(1);

    x1 := x;
    y1 := y;
    Count += 1;
    flag := NextXY(x1, y1, Count);
    while (flag = 0) and (Count < 7) do
    begin
      Count += 1;
      flag := NextXY(x1, y1, Count);
    end;
  end;

  if flag = 0 then
    chess[x, y] := 0;

  Result := 0;
end;

procedure Main;
var
  i, j: integer;
  //chess: TArr2D_int;
begin
  SetLength(chess, _X_, _Y_);

  for i := 0 to _X_ - 1 do
    for j := 0 to _Y_ - 1 do
      chess[i, j] := 0;

  if TravelChessBoard(2, 0, 1) <> 0 then
  begin
    for i := 0 to _X_ - 1 do
    begin
      for j := 0 to _Y_ - 1 do
        WriteF('%-5d', [chess[i, j]]);
      WriteLn;
    end;
    WriteLn('The horse has travelled the chess borad.');
  end
  else
  begin
    WriteLn('The horse cannot travel the chess borad.');
  end;
end;

end.

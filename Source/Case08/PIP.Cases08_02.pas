unit PIP.Cases08_02;

{$mode objfpc}{$J-}
{$ModeSwitch unicodestrings}
{$ModeSwitch advancedrecords}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

type
  TPlayer = record
    num, score, rand: integer;
    constructor Create(newNum, newScore, newRand: integer);
    class function Cmp_score(const a, b: TPlayer): integer; static;
    class function Cmp_num(const a, b: TPlayer): integer; static;
  end;

  TArr_TPlayer = array of TPlayer;
  TArrayUtils_TPlayer = specialize TArrayUtils<TPlayer>;

procedure SetRand(psn: TArr_TPlayer);
var
  i, j: integer;
begin
  j := 2;
  psn[0].rand := 1;
  for i := 1 to High(psn) do
  begin
    if psn[i].score <> psn[i - 1].score then
    begin
      psn[i].rand := j;
      j += 1;
    end
    else
      psn[i].rand := psn[i - 1].rand;
  end;
end;

procedure SortRand(psn: TArr_TPlayer);
begin
  TArrayUtils_TPlayer.Sort(psn, @TPlayer.Cmp_score);
  SetRand(psn);
  TArrayUtils_TPlayer.Sort(psn, @TPlayer.Cmp_num);
end;

procedure Main;
var
  psn: TArr_TPlayer;
  i: integer;
begin
  psn := [
    TPlayer.Create(1, 5, 0),
    TPlayer.Create(2, 3, 0),
    TPlayer.Create(3, 4, 0),
    TPlayer.Create(4, 7, 0),
    TPlayer.Create(5, 3, 0),
    TPlayer.Create(6, 5, 0),
    TPlayer.Create(7, 6, 0)];

  SortRand(psn);
  WriteLn('num    score    rand    ');
  for i := 0 to 6 do
  begin
    WriteLnF('%d%6d%6d', [psn[i].num, psn[i].score, psn[i].rand]);
  end;
end;

{ TPlayer }

constructor TPlayer.Create(newNum, newScore, newRand: integer);
begin
  Self.num := newNum;
  Self.score := newScore;
  Self.rand := newRand;
end;

class function TPlayer.Cmp_num(const a, b: TPlayer): integer;
var
  res: integer;
begin
  if a.num > b.num then
    res := 1
  else if a.num < b.num then
    res := -1
  else
    res := 0;

  Result := res;
end;

class function TPlayer.Cmp_score(const a, b: TPlayer): integer;
var
  res: integer;
begin
  if a.score > b.score then
    res := 1
  else if a.score < b.score then
    res := -1
  else
    res := 0;

  Result := res;
end;

end.

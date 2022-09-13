unit PIP.Cases02_02;

{$mode objfpc}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

type
  BankInterest = record
    year: integer;
    interest: double;
  end;

const
  ARR_BANKINTEREST: array[0..4] of BankInterest = (
    (year: 1; interest: 0.0063),
    (year: 2; interest: 0.0066),
    (year: 3; interest: 0.0069),
    (year: 5; interest: 0.0075),
    (year: 8; interest: 0.0084));

// 贪婪算法
function GreedyAlgorithm(money: double; year: integer; arr_year: TArr_int): double;
var
  i: integer;
  bi: BankInterest;
  res: double;
begin
  res := money;

  while year > 0 do
  begin
    for i := High(ARR_BANKINTEREST) downto 0 do
    begin
      if year >= ARR_BANKINTEREST[i].year then
      begin
        bi := ARR_BANKINTEREST[i];
        Break;
      end;
    end;

    year -= bi.year;
    arr_year[bi.year] += 1;

    for i := 1 to bi.year do
    begin
      res += res * bi.interest;
    end;
  end;

  Result := res;
end;

procedure Main;
var
  res: double;
  years: TArr_int;
  y: integer;
begin
  y := 20;
  years := nil;
  SetLength(years, 9);
  WriteLn('贪婪算法:');

  res := GreedyAlgorithm(2000, y, years);
  WriteLnF('8年期存了%d次', [years[8]]);
  WriteLnF('5年期存了%d次', [years[5]]);
  WriteLnF('3年期存了%d次', [years[3]]);
  WriteLnF('2年期存了%d次', [years[2]]);
  WriteLnF('1年期存了%d次', [years[1]]);
  WriteLnF('本息合计：%0.2f', [res]);
end;

end.

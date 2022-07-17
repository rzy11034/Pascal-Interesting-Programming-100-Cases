unit PIP.Cases02_01;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,
  SysUtils,
  PIP.Utils;

procedure Main;

implementation

//起征点为3500元。
//不超过1500元的部分，征收3％：
//超过1500～4500元的部分，征收10‰
//超过4500～9000元的部分，征收20‰
//超过9000～35000元的部分，征收25％；
//超过35000～55000元的部分，征收30％：
//超过55000～80000元的部分，征收35％；
//超过80000元以上的，征收45％；

type
  TTaxTable = record
    Start, End_: integer;
    Taxrate: double;
  end;

const
  TAX_TABLES: array of TTaxTable = (
    (Start: 0; End_: 1500; Taxrate: 0.03),
    (Start: 1500; End_: 4500; Taxrate: 0.10),
    (Start: 4500; End_: 9000; Taxrate: 0.20),
    (Start: 9000; End_: 35000; Taxrate: 0.25),
    (Start: 35000; End_: 55000; Taxrate: 0.30),
    (Start: 55000; End_: 80000; Taxrate: 0.35),
    (Start: 80000; End_: integer.MaxValue; Taxrate: 0.45));

  TAX_BASE = 3500;


function Tax_C(money: double): double;
var
  profit, res: double;
  curTaxTable: TTaxTable;
begin
  profit := money - TAX_BASE;
  res := 0;

  for curTaxTable in TAX_TABLES do
  begin
    if profit > curTaxTable.End_ then
      res += curTaxTable.End_ * curTaxTable.Taxrate
    else if profit - curTaxTable.Start > 0 then
      res += (profit - curTaxTable.Start) * curTaxTable.Taxrate;
  end;

  Result := res;
end;

function Tax_R(money: double): double;
  function __Tax__(money: double; n: integer): double;
  var
    res: double;
    curTable: TTaxTable;
  begin
    if n = -1 then Exit(0);

    res := 0;
    curTable := TAX_TABLES[n];

    if money > curTable.End_ then
      res := curTable.End_ * curTable.Taxrate + __Tax__(money, n - 1)
    else if money > curTable.Start then
      res := (money - curTable.Start) * curTable.Taxrate + __Tax__(money, n - 1)
    else
      res := __Tax__(money, n - 1);

    Result := res;
  end;

var
  i: integer;
begin
  i := High(TAX_TABLES);
  Result := __Tax__(money - TAX_BASE, i);
end;

procedure Main;
var
  profit: double;
begin
  WriteLn('请输入个人收入金额：');
  ReadLn(profit);

  WriteLnF('你的个人所得税为：%0.2f', [Tax_C(profit)]);
  WriteLnF('你的个人所得税为：%0.2f', [Tax_R(profit)]);

  // ReadLn;
end;

end.

unit PIP.Cases01_03;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,
  SysUtils;

procedure Main;

implementation

type
  TDate = record
    Year, Month, Day: uint16;
  end;

function IsLeapYear(Year: word): boolean;
begin
  Result := (Year mod 4 = 0) and ((Year mod 100 <> 0) or (Year mod 400 = 0));
end;

function CountDay(currentDate: TDate): integer;
var
  totalDay, i: integer;
  perMonth: array of integer;
begin
  totalDay := 0;
  perMonth := [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  for i := 1990 to currentDate.Year - 1 do
    totalDay += specialize IfThen<integer>(IsLeapYear(currentDate.Year), 365, 366);

  if IsLeapYear(currentDate.Year) then
    perMonth[2] += 1;

  for i := 0 to currentDate.Month - 1 do
    totalDay += perMonth[i];

  totalDay += currentDate.Day;

  Result := totalDay;
end;

procedure Main;
var
  today: TDate;
  totalDay, res: integer;
begin
  WriteLn('请输入指定日期，包括年、月、日。如：1990 1 30');
  ReadLn(today.Year, today.Month, today.Day);

  totalDay := countDay(today);
  res := totalDay mod 5;

  if res in [1..3] then
    WriteLn('今天打鱼。')
  else
    WriteLn('今天晒网。');
end;

end.

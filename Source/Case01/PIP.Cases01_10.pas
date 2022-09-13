unit PIP.Cases01_10;

{$mode objfpc}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  Math,
  DeepStar.Utils,
  DeepStar.UString;

procedure Main;

implementation

function Num2Char(n: integer): UChar;
var
  res: UChar;
begin
  if n in [0..9] then
    res := Chr(n + Ord('0'))
  else
    res := Chr(n - 10 + Ord('A'));

  Result := res;
end;

function Char2Num(c: UChar): integer;
var
  res: integer;
begin
  res := -1;

  if c in ['0'..'9'] then
    res := Ord(c) - Ord('0')
  else
    res := Ord(UpCase(c)) - Ord('A') + 10;

  Result := res;
end;

function DecToAny(num: integer; NumberSystem: integer): UString;
var
  stack: IStack_chr;
  sb: TStringBuilder;
begin
  stack := TStack_chr.Create;

  sb := TStringBuilder.Create();
  try
    while num > 0 do
    begin
      stack.Push(Num2Char(num mod NumberSystem));
      num := num div NumberSystem;
    end;

    while not stack.IsEmpty do
    begin
      sb.Append(stack.Pop);
    end;

    Result := sb.ToString;
  finally
    sb.Free;
  end;
end;

function AnyToDec(numStr: UString; NumberSystem: integer): integer;
var
  stack: TStack_chr;
  i, res: integer;
begin
  stack := TStack_chr.Create;
  try
    res := 0;

    for i := Low(numStr) to High(numStr) do
      stack.Push(numStr[i]);

    i := 0;
    while not stack.IsEmpty do
    begin
      res += Char2Num(stack.Pop) * Trunc(IntPower(NumberSystem, i));
      i += 1;
    end;
  finally
    stack.Free;
  end;

  Result := res;
end;

procedure Main;
var
  flag: integer = 1;
  numStr: UString;
  before_numSys, after_numSys, temp: integer;
begin
  while flag = 1 do
  begin
    Write('转换前的数是：');
    ReadLn(numStr);

    Write('转换前的数制是：');
    ReadLn(before_numSys);

    Write('转换后的数制是：');
    ReadLn(after_numSys);

    temp := AnyToDec(numStr, before_numSys);
    WriteLnF('转换后的数制是：%s', [DecToAny(temp, after_numSys)]);


    WriteLn('继续输入1，否则输入0：');
    ReadLn(flag);
  end;
end;

end.

unit PIP.Cases09_07;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

procedure Reverse(n: integer);
begin
  if n <> 0 then
  begin
    WriteF('%d', [n mod 10]);
    Reverse(n div 10);
  end;
end;

procedure Main;
var
  num: integer;
begin
  num := 847309483;
  Write('请输入一个整数：');
  WriteLn(num);

  if num < 0 then
  begin
    Write('-');
    num := -num;
  end;

  Reverse(num);
  WriteLn;
end;

end.

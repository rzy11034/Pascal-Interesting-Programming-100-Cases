unit PIP.Cases10_01;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

procedure Fun(number: integer);
var
  x1, x2, x3, x4: integer;
begin
  Write('请输入一个自然数：');
  WriteLn(number);

  for x1 := 1 to number div 2 do
  begin
    for x2 := 0 to x1 do
    begin
      for x3 := 0 to x2 do
      begin
        for x4 := 0 to x3 do
        begin
          if number = x1 * x1 + x2 * x2 + x3 * x3 + x4 * x4 then
          begin
            WriteLnF('%d = %d * %d + %d * %d + %d * %d + %d * %d.',
              [number, x1, x1, x2, x2, x3, x3, x4, x4]);
            Exit;
          end;
        end;
      end;
    end;
  end;
end;

procedure Main;
var
  number: integer;
begin
  number := 98;
  Fun(number);
  DrawLineBlockEnd;

  number := 234;
  Fun(number);
  DrawLineBlockEnd;

  number := 6589;
  Fun(number);
end;

end.

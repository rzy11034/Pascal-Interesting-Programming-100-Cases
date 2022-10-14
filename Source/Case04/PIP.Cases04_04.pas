unit PIP.Cases04_04;

{$mode objfpc}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils,
  DeepStar.UString;

procedure Main;

implementation

procedure Main;
var
  a, b, c: integer;
  str: string;
  strs: TArr_str;
begin
  Write('Please enter a optional fraction(a/b):');
  ReadLn(str);
  strs := str.Split(['/']);
  a := strs[0].ToInteger;
  b := strs[1].ToInteger;

  while true do
  begin
    if b mod a <> 0 then
    begin
      c := b div a + 1;
    end
    else
    begin
      c := b div a;
      a := 1;
    end;

    if a = 1 then
    begin
      WriteLnF('1/%d', [c]);
      Break;
    end
    else
    begin
      WriteF('1/%d + ', [c]);
    end;

    a := a * c - b;
    b := b * c;
    if (a = 3) and (b mod 2 = 0) then
    begin
      WriteLnF('1/%d + 1/%d', [b div 2, b]);
      Break;
    end;
  end;
end;

end.

unit PIP.Cases08_09;

{$mode objfpc}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils,
  DeepStar.UString;

procedure Main;

implementation

function Fun(str: string): string;
var
  len, l, r, i: integer;
  chs: TArr_chr;
begin
  len := str.Length;
  chs := str.ToCharArray;

  for r := len - 1 downto 0 do
    if chs[r] <> '*' then Break;

  for l := 0 to len - 1 do
    if chs[l] <> '*' then Break;

  while l < r do
  begin
    if chs[l] = '*' then
    begin
      for i := l to len - 2 do
      begin
        chs[i] := chs[i + 1];
      end;

      r -= 1;
      len -= 1;
    end;

    l += 1;
  end;

  Result := string.Create(chs, 0, len);
end;

procedure Main;
var
  str: string;
begin
  str := '****A*BC*DEF*G********';
  WriteLn(str);
  WriteLn(Fun(str));
end;

end.

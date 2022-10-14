unit PIP.Cases12_05;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

procedure Fun(n: integer);
var
  s: TArr_int;
  i: Integer;
begin
  SetLength(s, 4);

  WriteLn(n);
  s[0] := n mod 10;
  s[1] := n mod 100 div 10;
  s[2] := n mod 1000 div 100;
  s[3] := n div 1000;

  for i := 0 to 3 do
  begin
    s[i] += 5;
    s[i] := s[i] mod 10;
  end;

  for i := 0 to 3 div 2 do
  begin
    specialize Swap<integer>(s[i], s[3 - i]);
  end;

  for i := 3 downto 0 do
  begin
    WriteF('%d', [s[i]]);
  end;
  WriteLn;
end;

procedure Main;
begin
  Fun(1356);
  DrawLineBlockEnd;

  Fun(8295);
end;

end.

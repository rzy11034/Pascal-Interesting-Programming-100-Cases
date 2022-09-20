unit PIP.Cases04_06;

{$mode objfpc}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils;

procedure Main;

implementation

procedure Main;
var
  i, j, n: integer;
  s, t: double;
begin
  s := 0;

  Write('Please input the number of n:');
  readLn(n);

  for i := 1 to n do
  begin
    t := 1;

    for j := 1 to i do
      t := t * j;

    s := s + 1 / t;
  end;

  WriteLn(s.ToString);
end;

end.

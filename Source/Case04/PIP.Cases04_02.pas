unit PIP.Cases04_02;

{$mode objfpc}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

procedure Main;
var
  m, n, b, lcw, k: integer;
begin
  WriteLn('Input m & n:');
  ReadLn(m, n);
  WriteF('The LCW of %d and %d is:', [m, n]);

  k := m * n;
  if m < n then specialize Swap<integer>(m, n);

  b := m mod n;
  while b <> 0 do
  begin
    m := n;
    n := b;
    b := m mod n;
  end;

  lcw := k div n;

  WriteLnF('%d.', [lcw]);
end;

end.

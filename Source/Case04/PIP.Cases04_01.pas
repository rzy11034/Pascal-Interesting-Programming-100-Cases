unit PIP.Cases04_01;

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
  m, n, b: integer;
begin
  WriteLn('Input m & n:');
  ReadLn(m, n);
  WriteF('The GCD of %d and %d is:', [m, n]);

  if m < n then specialize Swap<integer>(m, n);

  b := m mod n;
  while b <> 0 do
  begin
    m := n;
    n := b;
    b := m mod n;
  end;

  WriteLnF('%d.', [n]);
end;

end.

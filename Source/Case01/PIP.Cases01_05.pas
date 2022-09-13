unit PIP.Cases01_05;

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
  i, fib1, fib2: integer;
begin
  fib1 := 1;
  fib2 := 1;

  for i := 1 to 15 do
  begin
    WriteF('%12d%12d', [fib1, fib2]);

    if i mod 2 = 0 then WriteLn;

    fib1 := fib1 + fib2;
    fib2 := fib1 + fib2;
  end;

  WriteLn;
end;

end.

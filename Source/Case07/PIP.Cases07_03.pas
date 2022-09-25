unit PIP.Cases07_03;

{$mode objfpc}{$H+}{$J+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

function Input(t: integer): integer;
var
  a: integer;
begin
  repeat
    Write('Please count:');
    ReadLn(a);
    if (a > 2) or (a < 1) or (t + a > 30) then
      Write('Error input, again!')
    else
      WriteLnF('You count:%d', [t + a]);
  until (a > 2) or (a < 2) or (t + a > 30);

  Result := t + a;
end;

function Copu(s: integer): integer;
var
  c: integer;
begin
  Write('Computer count:');
  if (s + 1) mod 3 = 0 then
  begin
    s += 1;
    WriteLnF(' %d', [s]);
  end
  else
  begin
    if (s + 2) mod 3 = 0 then
    begin
      s += 2;
      WriteLnF(' %d', [s]);
    end
    else
    begin
      c := Random(1) + 1;
      s += c;
      WriteLnF(' %d', [s]);
    end;
  end;

  Result := s;
end;

procedure Main;
var
  tol: integer;
begin
  tol := 0;
  WriteLn('**********catch thirty**********');
  WriteLn('Game Begin');

  Randomize;

  if Random(1) + 1 = 1 then
    tol := input(tol);

  while tol <> 30 do
  begin
    tol := Copu(tol);
    if tol = 30 then
      WriteLn('I lose!')
    else
    begin
      tol := Input(tol);

      if tol = 30 then
        WriteLn('I win!');
    end;
  end;

  WriteLn('********** Game Over **********');
end;

end.

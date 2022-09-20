unit PIP.Cases05_02;

{$mode objfpc}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

function fun(n: integer): boolean;
var
  i: integer;
begin
  if n = 2 then Exit(true);
  if n mod 2 = 0 then Exit(false);

  i := 3;
  while i <= round(sqrt(n)) do
  begin
    if n mod i = 0 then
      Exit(false);

    i += 2;
  end;

  Result := true;
end;

procedure Main;
var
  n, i: integer;
  ok: boolean;
  str: string;
begin
  ReadLn(n);

  repeat
    ok := false;

    i := 2;
    while i <= n div 2 do
    begin
      if fun(i) then
      begin
        if fun(n - i) then
        begin
          WriteLnF('%d %d', [i, n - i]);
          ok := true;
        end;
      end;

      if i <> 2 then i += 1;
      if ok then Break;

      i += 1;
    end;

    if n < 3 then
      WriteLn('This is not prime.')
    else if n = 3 then
      WriteLnF('%d %d', [i, n - i]);

    ReadLn(n);
  until n < 0;
end;

end.

unit PIP.Cases08_05;

{$mode objfpc}{$J-}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  DeepStar.Utils;

procedure Main;

implementation

const
  _N_ = 15;
  Name: TArr_str = ('        ', 'and wolf', 'and goat', 'and cabbage');

var
  a: TArr2D_int;
  b: TArr_int;

procedure Search(step: integer);
var
  i: integer;
begin
  if a[step, 0] + a[step, 1] + a[step, 2] + a[step, 3] = 4 then
  begin
    for i := 0 to step do
    begin
      Write('east: ');
      if a[i, 0] = 0 then
        Write('wolf ');
      if a[i, 1] = 0 then
        Write('goat ');
      if a[i, 2] = 0 then
        Write('cabbage ');
      if a[i, 3] = 0 then
        Write('farmer ');
      if (a[i, 0] <> 0) and (a[i, 1] <> 0) and (a[i, 2] <> 0) and (a[i, 3] <> 0) then
        Write('none');
      Write('          ');
      Write('west: ');

      if a[i, 0] = 1 then
        Write('wolf ');
      if a[i, 1] = 1 then
        Write('goat ');
      if a[i, 2] = 1 then
        Write('cabbage ');
      if a[i, 3] = 1 then
        Write('farmer ');
      if not ((a[i, 0] <> 0) or (a[i, 1] <> 0) or (a[i, 2] <> 0) or (a[i, 3] <> 0)) then
        Write('none');
      WriteLn(LineEnding + LineEnding);

      if i < step then
        WriteLnF('                   the %d time', [i + 1]);
      if (i > 0) and (i < step) then
      begin
        if a[i, 3] = 0 then
        begin
          Write('                    ------->  farmer ');
          writeLnF('%s', [Name[b[i] + 1]]);
        end
        else
        begin
          Write('                    <-------  farmer ');
          writeLnF('%s', [Name[b[i] + 1]]);
        end;
      end;
    end;

    WriteLn(LineEnding + LineEnding + LineEnding);
    Exit;
  end;

  for i := 0 to step - 1 do
  begin
    if CompareMemRange(@a[i], @a[step], 16) = 0 then
      Exit;
  end;

  if (a[step, 1] <> a[step, 3]) and ((a[step, 2] = a[step, 1]) or (a[step, 0] = a[step, 1])) then
    Exit;

  for i := -1 to 2 do
  begin
    if step + 1 < 15 then
    begin
      b[step] := i;
      a[step + 1] := copy(a[step]);
      a[step + 1, 3] := 1 - a[step + 1, 3];

      if (i = -1) then
        Search(step + 1)
      else if a[step, i] = a[step, 3] then
      begin
        a[step + 1, i] := a[step + 1, 3];
        Search(step + 1);
      end;
    end;
  end;
end;

procedure Main;
begin
  SetLength(a, _N_, 4);
  SetLength(b, _N_);

  WriteLn('              农夫过河问题， 解决方案如下：');
  Search(0);
end;

end.

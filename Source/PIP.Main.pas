﻿unit PIP.Main;

{$mode objfpc}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  {%H-}Math,
  {%H-}DeepStar.Utils;

procedure Run;

implementation

uses
  PIP.Cases02_05;

procedure Test;
begin
  Exit;
end;

procedure Run;
begin
  Test;
  Main;
end;

end.

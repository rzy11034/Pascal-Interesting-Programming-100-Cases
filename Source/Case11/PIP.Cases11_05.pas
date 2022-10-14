unit PIP.Cases11_05;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,
  Forms,
  Controls,
  Graphics,
  Dialogs;

type
  TFrm_Cases11_05 = class(TForm)
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
    procedure FormPaint(Sender: TObject);
  private
    procedure __Circle(x, y, r: integer);
  public

  end;

procedure Main;

implementation

procedure Main;
var
  frm: TFrm_Cases11_05;
begin
  frm := TFrm_Cases11_05.Create(nil);
  try
    Application.Initialize;
    frm.ShowModal;
    Application.Run;
  finally
    frm.Free;
  end;
end;

{$R *.frm}

{ TFrm_Cases11_05 }

procedure TFrm_Cases11_05.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  Application.Terminate;
end;

procedure TFrm_Cases11_05.FormCreate(Sender: TObject);
begin
  Self.Height := 640;
  Self.Width := 800;
  Self.Color := clBlack;
  BorderStyle := TFormBorderStyle.bsDialog;
  Self.Position := TPosition.poScreenCenter;
end;

procedure TFrm_Cases11_05.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
begin
  Caption := Format('X:%d  Y:%d', [x, y]);
end;

procedure TFrm_Cases11_05.FormPaint(Sender: TObject);
var
  x1, x2, x3, x4, y1, y2, y3, y4: integer;
begin
  with Self.Canvas do
  begin
    Pen.Color := clWhite;
    __Circle(400, 310, 210);
    __Circle(320, 230, 40);
    __Circle(470, 230, 40);
    Line(380, 300, 370, 360);
    Line(370, 360, 420, 360);
    Line(420, 360, 410, 300);

    x1 := 310;
    y1 := 370;
    x2 := 480;
    y2 := 450;
    x3 := x1;
    y3 := y1+(y2-y1) div 2;
    x4 := x2;
    y4 := y1+(y2-y1) div 2;
    Arc(x1, y1, x2, y2, x3, y3, x4, y4);

    y2 := 430;
    Arc(x1, y1, x2, y2, x3, y3, x4, y4);
  end;
end;

procedure TFrm_Cases11_05.__Circle(x, y, r: integer);
var
  x1, y1, x2, y2: integer;
begin
  x1 := x - r;
  y1 := y - r;
  x2 := x + r;
  y2 := y + r;
  Canvas.Ellipse(x1, y1, x2, y2);
end;

end.

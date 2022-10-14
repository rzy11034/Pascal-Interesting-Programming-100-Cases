unit PIP.Cases11_08;

{$mode ObjFPC}{$H+}
{$ModeSwitch unicodestrings}

interface

uses
  Classes,
  SysUtils,DeepStar.Utils,
  Forms,
  Controls,
  Graphics,
  Dialogs;

type
  TFrm_Cases11_08 = class(TForm)
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

uses
  System.UITypes;

procedure Main;
var
  frm: TFrm_Cases11_08;
begin
  frm := TFrm_Cases11_08.Create(nil);
  try
    Application.Initialize;
    frm.ShowModal;
    Application.Run;
  finally
    frm.Free;
  end;
end;

{$R *.frm}

{ TFrm_Cases11_08 }

procedure TFrm_Cases11_08.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  Application.Terminate;
end;

procedure TFrm_Cases11_08.FormCreate(Sender: TObject);
begin
  with Self do
  begin
    Height := 640;
    Width := 800;
    Color := clBlack;
    BorderStyle := TFormBorderStyle.bsDialog;
    Position := TPosition.poScreenCenter;
  end;
end;

procedure TFrm_Cases11_08.FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: integer);
begin
  Caption := Format('X:%d, Y:%d', [X, Y]);
end;

procedure TFrm_Cases11_08.FormPaint(Sender: TObject);
var
  x1, x2, y1, y2, y, tempX1, tempX2: integer;
begin
  with Self.Canvas do
  begin
    Brush.Color := TColors.LightBlue;
    Clear;

    // 太阳
    Brush.Color := TColorRec.Red;
    Pen.Color := Brush.Color;
    __Circle(Width div 2, Height div 4 * 3, 100);

    // 草地
    Brush.Color := TColors.LightGreen;
    Pen.Color := Brush.Color;
    x1 := 0;
    y1 := Height div 4 * 3;
    x2 := Width;
    y2 := Height;
    Rectangle(x1, y1, x2, y2);

    // 草地 X 轴横线
    y := y1;
    Pen.Color := TColors.White;
    Line(x1, y, x2, y);
    y += 20;
    Line(x1, y, x2, y);
    y += 35;
    Line(x1, y, x2, y);
    y += 50;
    Line(x1, y, x2, y);

    // 草地 Y 轴竖线 左半部份
    tempX1 := Width div 2 - 10;
    tempX2 := tempX1 - 10;
    y := 10;
    repeat
      Line(tempX1, y1, tempX2, y2);
      y += 10;
      tempX1 -= y;
      tempX2 -= y * 2;
    until tempX1 < 0;

    // 草地 Y 轴竖线 右半部份
    tempX1 := Width div 2 + 10;
    tempX2 := tempX1 + 10;
    y := 10;
    repeat
      Line(tempX1, y1, tempX2, y2);
      y += 10;
      tempX1 += y;
      tempX2 += y * 2;
    until tempX1 > Width;

    // 文字
    Font.Size := 20;
    Font.Color := TColorRec.White;
    Brush.Color := TColorRec.LightBlue;
    TextOut(250, 175, END_OF_PROGRAM_EN);
  end;
end;

procedure TFrm_Cases11_08.__Circle(x, y, r: integer);
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

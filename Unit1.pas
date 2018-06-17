unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus, ExtDlgs;

type
  TForm1 = class(TForm)
    PaintBox1: TPaintBox;
    Panel1: TPanel;
    Button1: TButton;
    LabeledEdit1: TLabeledEdit;
    ColorDialog1: TColorDialog;
    Button2: TButton;
    Label1: TLabel;
    PaintBox2: TPaintBox;
    Button3: TButton;
    Button4: TButton;
    SavePictureDialog1: TSavePictureDialog;
    procedure FormCreate(Sender: TObject);
    procedure PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PaintBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure LabeledEdit1Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    Size:Byte;  //толщина линии
    New:Boolean;  //новая ли линия
    Colour:TColor;  //цвет линии
    Posx,Posy:Integer; //позиция курсора
    Xpo,Ypo:integer; //позиция предыдущей точки
    Bitmap:TBitmap; //битмап уже нарисованного
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  //установка стандартных значений
  Size:=5;
  New:=True;
  Colour:=clBlack;
  LabeledEdit1.Text:=IntToStr(Size);
  //Создание и заливка белым битмапа
  Bitmap:=TBitmap.Create;
  Bitmap.Width:=PaintBox1.Width;
  Bitmap.Height:=PaintBox1.Height;
  with Bitmap, Canvas do begin
    Brush.Style:=bsSolid;
    Brush.Color:=clWhite;
    FillRect(ClientRect);
  end;
end;

procedure TForm1.PaintBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  //заливка текущим цветом области тек цвета
  //при создании формы это не работает
  with PaintBox2, Canvas do begin
    Brush.Style:=bsSolid;
    Brush.Color:=Colour;
    FillRect(ClientRect);
  end;

  //отслеживание курсора
  Posx:=x;
  Posy:=y;

  //превью линии
  with PaintBox1, Canvas do begin
    Draw(0,0,Bitmap);
    Pen.Style:=psSolid;
    Pen.Color:=Colour;
    Pen.Width:=Size;
    if new=True then begin
      MoveTo(PosX,PosY);
      LineTo(Posx,Posy);
    end else
    begin
      MoveTo(Xpo,Ypo);
      LineTo(Posx,Posy);
    end;
  end;
end;

procedure TForm1.PaintBox1Click(Sender: TObject);
begin
  //отрисовка линии на битмапе
  with Bitmap, Canvas do begin
    Pen.Style:=psSolid;
    Pen.Color:=Colour;
    Pen.Width:=Size;
    if new=true then begin
      Xpo:=Posx;
      Ypo:=Posy;
      new:=False; 
      MoveTo(Xpo,Ypo);
    end else begin
      LineTo(Posx,Posy);
      Xpo:=Posx;
      Ypo:=Posy;
    end;
  end;
  //перенос на область рисования
  PaintBox1.Canvas.Draw(0,0,Bitmap);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  new:=True;
end;

procedure TForm1.LabeledEdit1Change(Sender: TObject);
var
  s:string; //временная переменная для текста из Edit1
  nums: set of char; //множество цифр
begin
  s:=LabeledEdit1.Text;
  nums:=['0','1','2','3','4','5','6','7','8','9'];
  if S<>'' then begin //проверка непустого поля
    //удаление последнего символа, если тот не цифра
    if not(s[Length(s)] in nums) then begin
      Delete(S,1,Length(s));
      LabeledEdit1.Text:=s;
    end;
    Size:=StrToInt(s);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if ColorDialog1.Execute then begin //проверка того, что цвет был выбран
    //присвание нового цвета
    Colour:=ColorDialog1.Color;
    //заливка области тек цвета
    with PaintBox2, Canvas do begin
    Brush.Style:=bsSolid;
    Brush.Color:=Colour;
    FillRect(ClientRect);
    end;

  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  with Bitmap, Canvas do begin
    Brush.Style:=bsSolid;
    Brush.Color:=clWhite;
    FillRect(ClientRect);
  end;
  PaintBox1.Canvas.Draw(0,0,Bitmap);
  new:=True;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if SavePictureDialog1.Execute then //проверка сброса сохраниения
  Bitmap.SaveToFile(SavePictureDialog1.FileName);
end;

end.

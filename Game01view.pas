unit Game01view;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TviewGame01 = class(TForm)
    P1_img: TImage;
    P2_img: TImage;
    P1_clock: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure configPerson(imageObject:TImage; refPersonagem:Integer);
    procedure FormCreate(Sender: TObject);

    
  private



  public
    
    { Public declarations }
  end;

var
  viewGame01: TviewGame01;

  

implementation

uses MainView, ConfigControlesView;


{$R *.dfm}

procedure TviewGame01.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    viewMain.Visible := true;
    viewMain.Refresh;
end;



procedure TviewGame01.FormCreate(Sender: TObject);
begin
    DoubleBuffered:=true;
    viewGame01.Width := viewWidth;
    viewGame01.Height := viewHeight;
    configPerson(P1_img, 1);
    configPerson(P2_img, 2);
    pontoDeReferenciaPersonagens(P1_img); 


end;








{
  ==========================================================================
  ========= SETANDO CONFIGURAÇOES INICIAIS DOS PERSONAGENS =================
  ==========================================================================
  }
procedure TviewGame01.configPerson(imageObject:TImage; refPersonagem:Integer);
var
percWidth: Double;
percHeight: Double;
percTop: Double;


begin
  {Configurando a resolução do personagem e as posições iniciais dele}
  percWidth := 12/100;
  percHeight := 36/100;
  percTop := 46/100;


  imageObject.Width := round(viewWidth * percWidth);
  imageObject.Height := round(viewHeight * percHeight);
  imageObject.Top :=  round(viewHeight * percTop);
  if refPersonagem = 1 then imageObject.Left := 40;
  if refPersonagem = 2 then imageObject.Left := viewWidth-imageObject.Width-40;
  imageObject.Refresh;


end;


end.

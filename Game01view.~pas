unit Game01view;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls;

type
  TviewGame01 = class(TForm)
    P1_img: TImage;
    P2_img: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure configPerson();
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  viewGame01: TviewGame01;

implementation

uses MainView;


{$R *.dfm}

procedure TviewGame01.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    viewMain.Visible := true;
    viewMain.Refresh;
end;




{
  ==========================================================================
  ========= SETANDO CONFIGURAÇOES INICIAIS DOS PERSONAGENS =================
  ==========================================================================
  }
procedure TviewGame01.configPerson();
var
percWidth: Double;
percHeight: Double;
percTop: Double;


begin
  {Configurando a resolução do personagem e as posições iniciais dele}
  percWidth := 12/100;
  percHeight := 36/100;
  percTop := 46/100;


  P1_img.Width := round(viewWidth * percWidth);
  P1_img.Height := round(viewHeight * percHeight);
  P1_img.Top :=  round(viewHeight * percTop);
  P1_img.Left := 40;
  P1_img.Refresh;

  P2_img.Width := round(viewWidth * percWidth);
  p2_img.Height := round(viewHeight * percHeight);
  p2_img.Top :=  round(viewHeight * percTop);
  p2_img.Left := viewWidth-P2_img.Width-40;
  p2_img.Refresh;





end;

procedure TviewGame01.FormCreate(Sender: TObject);
begin
    viewGame01.Width := viewWidth;
    viewGame01.Height := viewHeight;
    configPerson;
end;

end.

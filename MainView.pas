unit MainView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Menus, ComCtrls, ImgList;

type
  TviewMain = class(TForm)
    MainMenu1: TMainMenu;
    Configuraes1: TMenuItem;
    Resoluo1: TMenuItem;
    Sair1: TMenuItem;
    N640x4801: TMenuItem;
    N1024x7681: TMenuItem;
    N1280x7201: TMenuItem;
    N1366x7681: TMenuItem;
    N1920x10801: TMenuItem;
    Controles1: TMenuItem;
    clkConfiguraBotoes: TTimer;
    btnimg01: TImage;
    procedure Sair1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N640x4801Click(Sender: TObject);
    procedure N1024x7681Click(Sender: TObject);
    procedure N1280x7201Click(Sender: TObject);
    procedure N1366x7681Click(Sender: TObject);
    procedure N1920x10801Click(Sender: TObject);
    procedure Controles1Click(Sender: TObject);
    procedure btnimg01Click(Sender: TObject);


  private
    procedure escolheResolucao(option: Integer);




  public
    { Public declarations }
  end;

var
  viewMain: TviewMain;
  viewWidth: Integer;
  viewHeight: Integer;


implementation

uses ConfigControlesView, Game01view;

{$R *.dfm}




procedure TviewMain.escolheResolucao(option: Integer);
begin
  Case option of
    1: begin viewWidth := 640; viewHeight := 480 end;
    2: begin viewWidth := 1024; viewHeight := 768 end;
    3: begin viewWidth := 1280; viewHeight := 720 end;
    4: begin viewWidth := 1366; viewHeight := 768 end;
    5: begin viewWidth := 1920; viewHeight := 1080 end;
    else ShowMessage('Erro! resolução inexistente.');
  end;
  viewMain.Position := poScreenCenter;
  viewMain.Refresh;
end;













procedure TviewMain.Sair1Click(Sender: TObject);
begin
      if MessageDlg('Deseja Realmente Sair',mtConfirmation,[mbYes,mbNo],mrYes) = mrYes then
        begin
          close;

        end
      else
        

end;

procedure TviewMain.FormCreate(Sender: TObject);
begin
  {
  ==========================================================================
  ========= SETANDO CONFIGURAÇOES INICIAIS NA CRIAÇÃO DA MAINVIEW ==========
  ==========================================================================
  }
  escolheResolucao(2);


  


  
end;


















procedure TviewMain.N640x4801Click(Sender: TObject);
begin
  escolheResolucao(1);
end;

procedure TviewMain.N1024x7681Click(Sender: TObject);
begin
    escolheResolucao(2);
end;

procedure TviewMain.N1280x7201Click(Sender: TObject);
begin
  escolheResolucao(3);
end;

procedure TviewMain.N1366x7681Click(Sender: TObject);
begin
    escolheResolucao(4);
end;

procedure TviewMain.N1920x10801Click(Sender: TObject);
begin
    escolheResolucao(5);
end;

procedure TviewMain.Controles1Click(Sender: TObject);
begin
    Application.CreateForm(TviewConfigControles, viewConfigControles);
    viewConfigControles.ShowModal;
    viewConfigControles.Free;

end;

procedure TviewMain.btnimg01Click(Sender: TObject);
begin
  viewMain.Visible := false;
  Application.CreateForm(TviewGame01, viewGame01);
  viewGame01.ShowModal;
  
  
end;

end.

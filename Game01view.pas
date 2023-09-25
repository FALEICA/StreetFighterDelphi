unit Game01view;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TviewGame01 = class(TForm)
    P1_img: TImage;
    P2_img: TImage;
    P1_clock: TTimer;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox2: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure configPerson(imageObject:TImage; refPersonagem:Integer);
    procedure FormCreate(Sender: TObject);
    procedure personAction(obj:TImage; person:String ;directionAction:String; buttonAction:String);
    procedure RyuObject(obj:TImage; directionAction:String; buttonAction:String);
    procedure P1_clockTimer(Sender: TObject);

    
  private


  public
    
    { Public declarations }
  end;

var
  viewGame01: TviewGame01;
  cima:String;
  baixo:String;
  esquerda:String;
  direita:String;
  cimaEsq:String;
  cimaDir:String;
  baixoEsq:String;
  baixoDir:String;
  parado:String;
  socoFraco:String;
  socoMedio:String;
  socoForte:String;
  chuteFraco:String;
  chuteMedio:String;
  chuteForte:String;
  semGolpes:String;
  selecionadoP1:String;
  selecionadoP2:String;
  spritesCont:Integer;





  

implementation

uses MainView, ConfigControlesView, Math;



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
    cima := 'cima';
    baixo := 'baixo';
    esquerda := 'esquerda';
    direita := 'direita';
    cimaEsq := 'cimaEsq';
    cimaDir := 'cimadir';
    baixoEsq := 'baixoEsq';
    baixoDir := 'baixoDir';
    parado:= 'parado';
    socoFraco:= 'socoFraco';
    socoMedio:= 'socoMedio';
    socoForte:= 'socoForte';
    chuteFraco:= 'chuteFraco';
    chuteMedio:= 'chuteMedio';
    chuteForte:= 'chuteForte';
    semGolpes:= 'semGolpes';
    spritesCont := 1;


     ComboBox1.Items.Add(Ryu);
     ComboBox1.Items.Add(Ken);
     ComboBox1.Items.Add(ChunLi);
     ComboBox1.Items.Add(Guile);

     ComboBox2.Items.Add(Ryu);
     ComboBox2.Items.Add(Ken);
     ComboBox2.Items.Add(ChunLi);
     ComboBox2.Items.Add(Guile);
     

     

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





procedure TviewGame01.personAction(obj:TImage; person:String ;directionAction:String; buttonAction:String);
begin
  If person = Ryu then RyuObject(obj, directionAction, buttonAction);


end;




procedure TviewGame01.P1_clockTimer(Sender: TObject);
begin

  if Edit1.Text = '' then P1_clock.Interval := 1 else  P1_clock.Interval := StrToInt(Edit1.Text);


  selecionadoP1 := ComboBox1.Text;

  if (GetKeyState(VK_UP) < 0) then personAction(P1_img, selecionadoP1, cima, semGolpes)
  else If (GetKeyState(VK_DOWN) < 0) then personAction(P1_img, selecionadoP1, baixo,semGolpes)
  else If (GetKeyState(VK_LEFT) < 0) then personAction(P1_img, selecionadoP1, esquerda, semGolpes)
  else If (GetKeyState(VK_RIGHT) < 0) then personAction(P1_img, selecionadoP1, direita, semGolpes)
  else If ((GetKeyState(VK_UP) < 0) and (GetKeyState(VK_LEFT) < 0)) then personAction(P1_img, selecionadoP1, cimaEsq, semGolpes)
  else If ((GetKeyState(VK_UP) < 0) and (GetKeyState(VK_RIGHT) < 0)) then personAction(P1_img, selecionadoP1, cimaDir, semGolpes)
  else If ((GetKeyState(VK_DOWN) < 0) and (GetKeyState(VK_LEFT) < 0)) then personAction(P1_img, selecionadoP1, baixoEsq, semGolpes)
  else If ((GetKeyState(VK_DOWN) < 0) and (GetKeyState(VK_RIGHT) < 0)) then personAction(P1_img, selecionadoP1, baixoDir, semGolpes)
  else personAction(P1_img, selecionadoP1, parado, semGolpes)




  
end;










{
  ==========================================================================
  ========= CRIAÇÃO DAS CARACTERISTICAS DE CADA PERSONAGEM =================
  ========= CRIANDO MOVIMENTOS SPRITES E SUAS AÇÕES        =================
  ==========================================================================
  }

procedure TviewGame01.RyuObject(obj:TImage; directionAction:String; buttonAction:String);
begin
   If directionAction = parado then
   begin

        if spritesCont = 1 then obj.Picture.LoadFromFile('img/Ryu/RyuStop01.bmp')
        else if spritesCont = 2 then obj.Picture.LoadFromFile('img/Ryu/RyuStop02.bmp')
        else if spritesCont = 3 then obj.Picture.LoadFromFile('img/Ryu/RyuStop03.bmp')
        else if spritesCont = 4 then obj.Picture.LoadFromFile('img/Ryu/RyuStop04.bmp')
        else spritesCont := 1;
        spritesCont := spritesCont+1;
   end;




end;

end.

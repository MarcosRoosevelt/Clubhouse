unit UnitPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.ListBox, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Ani;

type
  TFrmPrincipal = class(TForm)
    lyt_toolbar: TLayout;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Rectangle1: TRectangle;
    lb_salas: TListBox;
    lyt_rodape: TLayout;
    rect_room: TRectangle;
    Label1: TLabel;
    rect_degrade: TRectangle;
    Image5: TImage;
    lyt_menu: TLayout;
    rect_opaco: TRectangle;
    rect_menu: TRectangle;
    Label2: TLabel;
    Layout1: TLayout;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    rect_letsgo: TRectangle;
    Label7: TLabel;
    Image9: TImage;
    Line1: TLine;
    AnimationMenu: TFloatAnimation;
    procedure FormShow(Sender: TObject);
    procedure rect_roomClick(Sender: TObject);
    procedure rect_opacoClick(Sender: TObject);
    procedure AnimationMenuFinish(Sender: TObject);
  private
    procedure AddSugestao(lb : TListBox);
    procedure AddSala(lb : TListBox);
    procedure AddExplorar(lb : TListBox);
    procedure HideMenu;
    procedure ShowMenu;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.fmx}

uses UnitFrameSugestao, UnitFrameSala, UnitFrameExplorar;

{ TFrmPrincipal }

procedure TFrmPrincipal.AddExplorar(lb: TListBox);
var
  f    : TFrameExplorar;
  item : TListBoxItem;
begin
    item := TListBoxItem.Create(nil);
    item.Text := '';
    item.Height := 170;
    item.Align := TAlignLayout.Client;
    item.Selectable := false;

    f := TFrameExplorar .Create(item);
    f.Parent := item;
    f.Align := TAlignLayout.Client;

    lb.AddObject(item);

end;

procedure TFrmPrincipal.AddSala(lb: TListBox);
var
  f    : TFrameSala;
  item : TListBoxItem;
begin
    item := TListBoxItem.Create(nil);
    item.Text := '';
    item.Height := 220;
    item.Align := TAlignLayout.Client;
    item.Selectable := false;

    f := TFrameSala .Create(item);
    f.Parent := item;
    f.Align := TAlignLayout.Client;

    lb.AddObject(item);

end;

procedure TFrmPrincipal.AddSugestao(lb: TListBox);
var
  f    : TFrameSugestao;
  item : TListBoxItem;
begin
    item := TListBoxItem.Create(nil);
    item.Text := '';
    item.Height := 220;
    item.Align := TAlignLayout.Client;
    item.Selectable := false;

    f := TFrameSugestao.Create(item);
    f.Parent := item;
    f.Align := TAlignLayout.Client;

    lb.AddObject(item);

end;

procedure TFrmPrincipal.AnimationMenuFinish(Sender: TObject);
begin
    if AnimationMenu.Inverse then
      lyt_menu.Visible := false;
end;

procedure TFrmPrincipal.ShowMenu;
begin
    rect_menu.Margins.Bottom := -327;
    lyt_menu.Visible := true;

    AnimationMenu.Inverse := false;
    AnimationMenu.Start;

end;

procedure TFrmPrincipal.HideMenu;
begin
    AnimationMenu.Inverse := true;
    AnimationMenu.Start;
end;

procedure TFrmPrincipal.rect_opacoClick(Sender: TObject);
begin
    HideMenu;
end;

procedure TFrmPrincipal.rect_roomClick(Sender: TObject);
begin
    ShowMenu;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin

    AddSugestao(lb_salas);
    AddSala(lb_salas);
    AddSala(lb_salas);
    AddSala(lb_salas);
    AddExplorar(lb_salas);
end;

end.

uses crt,graph;

type  TArray= array[0..9,0..9] of byte;
      TXod=(Xbl,Xwh);

var   d,md,size,x,y                       : integer;
      i,j,n,m,l,c,bl,wh                   : byte;
      pole                                : pointer;
      a                                   : TArray;
      xod                                 : TXod;
      w                                   : array[0..1] of byte;
      sbl,swh                             : string;

label metkaBL,
      metkaWH,
      exit_from_game,
      podschet_fischek,
      new;

const http_1        =#1;
      http_2        =#2;
      b     :integer=40;
      ext   : boolean=false;

{----------------------------------------------}
procedure fblack(x,y:integer);
begin
 setcolor(0);
 setfillstyle(0,0);
 circle(x+b div 2,y+b div 2,b div 4);
 floodfill(x+b div 2,y+b div 2,0)
end;
{---------------------------------------------}
procedure malblack;
begin
 if i>=3 then
  begin
   n:=i-1;
   if a[n,j]=2 then
   begin
    while a[n,j]=2 do dec(n);
    if a[n,j]=1 then
    begin
     inc(n);
     while n<=i do
     begin
      inc(l);
      a[n,j]:=1;
      fblack((j-1)*b,(n-1)*b);
      inc(n);
     end
    end
   end
  end;

  if i<=6 then
  begin
   n:=i+1;
   if a[n,j]=2 then
   begin
    while a[n,j]=2 do inc(n);
    if a[n,j]=1 then
    begin
     dec(n);
     while n>=i do
     begin
      inc(l);
      a[n,j]:=1;
      fblack((j-1)*b,(n-1)*b);
      dec(n);
     end
    end
   end
  end;

  if j>=3 then
  begin
   m:=j-1;
   if a[i,m]=2 then
   begin
    while a[i,m]=2 do dec(m);
    if a[i,m]=1 then
    begin
     inc(m);
     while m<=j do
     begin
      inc(l);
      a[i,m]:=1;
      fblack((m-1)*b,(i-1)*b);
      inc(m);
     end
    end
   end
  end;

  if j<=6 then
  begin
   m:=j+1;
   if a[i,m]=2 then
   begin
    while a[i,m]=2 do inc(m);
    if a[i,m]=1 then
    begin
     dec(m);
     while m>=j do
     begin
      inc(l);
      a[i,m]:=1;
      fblack((m-1)*b,(i-1)*b);
      dec(m);
     end
    end
   end
  end;

  if (i>=3) and (j>=3) then
  begin
   n:=i-1;
   m:=j-1;
   if a[n,m]=2 then
   begin
    while a[n,m]=2 do
    begin
     dec(n);
     dec(m)
    end;
    if a[n,m]=1 then
    begin
     inc(n);
     inc(m);
     while n<=i do
     begin
      inc(l);
      a[n,m]:=1;
      fblack((m-1)*b,(n-1)*b);
      inc(m);
      inc(n)
     end
    end
   end
  end;

  if (i<=6) and (j<=6) then
  begin
   n:=i+1;
   m:=j+1;
   if a[n,m]=2 then
   begin
    while a[n,m]=2 do
    begin
     inc(n);
     inc(m)
    end;
    if a[n,m]=1 then
    begin
     dec(n);
     dec(m);
     while n>=i do
     begin
      inc(l);
      a[n,m]:=1;
      fblack((m-1)*b,(n-1)*b);
      dec(m);
      dec(n)
     end
    end
   end
  end;

  if (i<=6) and (j>=3) then
  begin
   n:=i+1;
   m:=j-1;
   if a[n,m]=2 then
   begin
    while a[n,m]=2 do
    begin
     inc(n);
     dec(m)
    end;
    if a[n,m]=1 then
    begin
     dec(n);
     inc(m);
     while n>=i do
     begin
      inc(l);
      a[n,m]:=1;
      fblack((m-1)*b,(n-1)*b);
      dec(n);
      inc(m)
     end
    end
   end
  end;

  if (i>=3) and (j<=6) then
  begin
   n:=i-1;
   m:=j+1;
   if a[n,m]=2 then
   begin
    while a[n,m]=2 do
    begin
     dec(n);
     inc(m)
    end;
    if a[n,m]=1 then
    begin
     inc(n);
     dec(m);
     while n<=i do
     begin
      inc(l);
      a[n,m]:=1;
      fblack((m-1)*b,(n-1)*b);
      inc(n);
      dec(m)
     end
    end
   end
  end
end;
{---------------------------}
procedure fwhite(x,y:integer);
begin
 setcolor(15);
 setfillstyle(1,15);
 circle(x+b div 2,y+b div 2,b div 4);
 floodfill(x+b div 2,y+b div 2,15)
end;
{---------------------------------------------}
procedure malwhite;
begin
   if i>=3 then
  begin
   n:=i-1;
   if a[n,j]=1 then
   begin
    while a[n,j]=1 do dec(n);
    if a[n,j]=2 then
    begin
     inc(n);
     while n<=i do
     begin
      inc(l);
      a[n,j]:=2;
      fwhite((j-1)*b,(n-1)*b);
      inc(n);
     end
    end
   end
  end;

  if i<=6 then
  begin
   n:=i+1;
   if a[n,j]=1 then
   begin
    while a[n,j]=1 do inc(n);
    if a[n,j]=2 then
    begin
     dec(n);
     while n>=i do
     begin
      inc(l);
      a[n,j]:=2;
      fwhite((j-1)*b,(n-1)*b);
      dec(n);
     end
    end
   end
  end;

  if j>=3 then
  begin
   m:=j-1;
   if a[i,m]=1 then
   begin
    while a[i,m]=1 do dec(m);
    if a[i,m]=2 then
    begin
     inc(m);
     while m<=j do
     begin
      inc(l);
      a[i,m]:=2;
      fwhite((m-1)*b,(i-1)*b);
      inc(m);
     end
    end
   end
  end;

  if j<=6 then
  begin
   m:=j+1;
   if a[i,m]=1 then
   begin
    while a[i,m]=1 do inc(m);
    if a[i,m]=2 then
    begin
     dec(m);
     while m>=j do
     begin
      inc(l);
      a[i,m]:=2;
      fwhite((m-1)*b,(i-1)*b);
      dec(m);
     end
    end
   end
  end;

  if (i>=3) and (j>=3) then
  begin
   n:=i-1;
   m:=j-1;
   if a[n,m]=1 then
   begin
    while a[n,m]=1 do
    begin
     dec(n);
     dec(m)
    end;
    if a[n,m]=2 then
    begin
     inc(n);
     inc(m);
     while n<=i do
     begin
      inc(l);
      a[n,m]:=2;
      fwhite((m-1)*b,(n-1)*b);
      inc(m);
      inc(n)
     end
    end
   end
  end;

  if (i<=6) and (j<=6) then
  begin
   n:=i+1;
   m:=j+1;
   if a[n,m]=1 then
   begin
    while a[n,m]=1 do
    begin
     inc(n);
     inc(m)
    end;
    if a[n,m]=2 then
    begin
     dec(n);
     dec(m);
     while n>=i do
     begin
      inc(l);
      a[n,m]:=2;
      fwhite((m-1)*b,(n-1)*b);
      dec(m);
      dec(n)
     end
    end
   end
  end;

  if (i<=6) and (j>=3) then
  begin
   n:=i+1;
   m:=j-1;
   if a[n,m]=1 then
   begin
    while a[n,m]=1 do
    begin
     inc(n);
     dec(m)
    end;
    if a[n,m]=2 then
    begin
     dec(n);
     inc(m);
     while n>=i do
     begin
      inc(l);
      a[n,m]:=2;
      fwhite((m-1)*b,(n-1)*b);
      dec(n);
      inc(m)
     end
    end
   end
  end;

  if (i>=3) and (j<=6) then
  begin
   n:=i-1;
   m:=j+1;
   if a[n,m]=1 then
   begin
    while a[n,m]=1 do
    begin
     dec(n);
     inc(m)
    end;
    if a[n,m]=2 then
    begin
     inc(n);
     dec(m);
     while n<=i do
     begin
      inc(l);
      a[n,m]:=2;
      fwhite((m-1)*b,(n-1)*b);
      inc(n);
      dec(m)
     end
    end
   end
  end;
end;
{-----------------------}
procedure schet;
var
    schbl,schwh      :byte;
    sschbl,sschwh    :string;
begin
 setfillstyle(1,1);
 bar(-140+b+1,1,-140+2*b-1,39);
 bar(9*b+21,1,10*b+19,39);
 fwhite(9*b+20,-5);
 fblack(-100,-5);
 schbl:=0;
 schwh:=0;
 for i:=1 to 8 do
  for j:=1 to 8 do
  if a[i,j]=1 then inc(schbl)
  else
  if a[i,j]=2 then inc(schwh);
  str(schbl,sschbl);
  str(schwh,sschwh);
  setcolor(15);
  settextstyle(0,0,1);
  outtextxy(-100+(b-textwidth(sschbl)) div 2,30,sschbl);
  outtextxy(9*b+20+(b-textwidth(sschwh)) div 2,30,sschwh);
end;
{---------------------------------}
procedure doska;
begin
 setcolor(15);
 setfillstyle (1,1);
 Bar (0,0,8*b,8*b);
 rectangle(0,0,8*b,8*b);
 line(0,b,8*b,b);
 line(0,2*b,8*b,2*b);
 line(0,3*b,8*b,3*b);
 line(0,4*b,8*b,4*b);
 line(0,5*b,8*b,5*b);
 line(0,6*b,8*b,6*b);
 line(0,7*b,8*b,7*b);
 line(b,0,b,8*b);
 line(2*b,0,2*b,8*b);
 line(3*b,0,3*b,8*b);
 line(4*b,0,4*b,8*b);
 line(5*b,0,5*b,8*b);
 line(6*b,0,6*b,8*b);
 line(7*b,0,7*b,8*b);
 putimage(x,y,pole^,xorput);
 for i:=1 to 8 do
  for j:=1 to 8 do
   if a[i,j]=1 then fblack((j-1)*b,(i-1)*b)
   else
   if a[i,j]=2 then fwhite((j-1)*b,(i-1)*b)

end;
{--------------------------------}
procedure clears;
begin
  for n:=1 to 8 do
  for m:=1 to 8 do
  if (a[n,m]<>1) and (a[n,m]<>2) then a[n,m]:=0;
end;
{----------------------------}
procedure vakant_position_for_fwhite;
var     my       :byte;
begin

 for i:=1 to 8 do
  for j:=1 to 8 do
  if a[i,j]=2 then
  begin

   my:=0;
   if i>=3 then
   begin
    n:=i-1;
    if a[n,j]=1 then
    begin
     while a[n,j]=1 do
     begin
      dec(n);
      inc(my)
     end;
     if (a[n,j]=0) and (n>=1) then a[n,j]:=3+my
     else
     if (a[n,j]<>1) and (a[n,j]<>2) and (n>=1) then inc(a[n,j],my)
    end
   end;

   my:=0;
   if i<=6 then
   begin
    n:=i+1;
    if a[n,j]=1 then
    begin
     while a[n,j]=1 do
     begin
      inc(n);
      inc(my)
     end;
     if (a[n,j]=0) and (n<=8) then a[n,j]:=3+my
     else
     if (a[n,j]<>1) and (a[n,j]<>2) and (n<=8) then inc(a[n,j],my)
    end
   end;

   my:=0;
   if j>=3 then
   begin
    m:=j-1;
    if a[i,m]=1 then
    begin
     while a[i,m]=1 do
     begin
      dec(m);
      inc(my)
     end;
     if (a[i,m]=0) and (m>=1) then a[i,m]:=3+my
     else
     if (a[i,m]<>1) and (a[i,m]<>2) and (m>=1)  then inc(a[i,m],my)
    end
   end;

   my:=0;
   if j<=6 then
   begin
    m:=j+1;
    if a[i,m]=1 then
    begin
     while a[i,m]=1 do
     begin
      inc(m);
      inc(my)
     end;
     if (a[i,m]=0) and (m<=8) then a[i,m]:=3+my
     else
     if (a[i,m]<>1) and (a[i,m]<>2) and (m<=8) then inc(a[i,m],my)
    end
   end;

   my:=0;
   if (i>=3) and (j>=3) then
   begin
    n:=i-1;
    m:=j-1;
    if a[n,m]=1 then
    begin
     while a[n,m]=1 do
     begin
      dec(n);
      inc(my);
      dec(m)
     end;
    if (a[n,m]=0) and (n>=1) and (m>=1) then a[n,m]:=3+my
    else
    if (a[n,m]<>1) and (a[n,m]<>2) and (n>=1) and (m>=1) then inc(a[n,m],my)
    end
   end;

   my:=0;
   if (i<=6) and (j<=6) then
   begin
    n:=i+1;
    m:=j+1;
    if a[n,m]=1 then
    begin
     while a[n,m]=1 do
     begin
      inc(n);
      inc(my);
      inc(m)
     end;
    if (a[n,m]=0) and (n<=8) and (m<=8) then a[n,m]:=3+my
    else
    if (a[n,m]<>1) and (a[n,m]<>2) and (n<=8) and (m<=8) then inc(a[n,m],my)
    end
   end;

   my:=0;
   if (i<=6) and (j>=3) then
   begin
    n:=i+1;
    m:=j-1;
    if a[n,m]=1 then
    begin
     while a[n,m]=1 do
     begin
      inc(n);
      inc(my);
      dec(m)
     end;
    if (a[n,m]=0) and (n<=8) and (m>=1) then a[n,m]:=3+my
    else
    if (a[n,m]<>1) and (a[n,m]<>2) and (n<=8) and (m>=1) then inc(a[n,m],my)
    end
   end;

   my:=0;
   if (i>=3) and (j<=6) then
   begin
    n:=i-1;
    m:=j+1;
    if a[n,m]=1 then
    begin
     while a[n,m]=1 do
     begin
      dec(n);
      inc(my);
      inc(m)
     end;
    if (a[n,m]=0) and (m<=8) and (n>=1) then a[n,m]:=3+my
    else
    if (a[n,m]<>1) and (a[n,m]<>2) and (m<=8) and (n>=1) then inc(a[n,m],my)
    end
   end;

  end
end;
{------------------}
procedure intellekt_max;
var maximum,linx :byte;

begin

 linx:=0;
 for n:=3 to 6 do
 for m:=3 to 6 do
 if (a[n,m]<>1) and (a[n,m]<>2) and (a[n,m]<>0) then inc(linx);

 if linx<>0 then
 begin
   maximum:=4;
   for n:=3 to 6 do
   for m:=3 to 6 do
   if a[n,m]>=maximum then
   begin
    maximum:=a[n,m];
    i:=n;
    j:=m
   end
 end
 else
 begin
   maximum:=4;
   for n:=1 to 8 do
   for m:=1 to 8 do
   if a[n,m]>=maximum then
   begin
    maximum:=a[n,m];
    i:=n;
    j:=m
   end
 end;

 maximum:=4;

 if a[1,1]>=maximum then
  begin
   maximum:=a[1,1];
   i:=1;
   j:=1
  end;

 if a[1,8]>=maximum then
  begin
   maximum:=a[1,8];
   i:=1;
   j:=8
  end;

 if a[8,1]>=maximum  then
  begin
   maximum:=a[8,1];
   i:=8;
   j:=1
  end;

 if a[8,8]>=maximum  then
  begin
   maximum:=a[8,8];
   i:=8;
   j:=8
  end;


end;
{------------------------}
procedure vakant_position_for_fblack;
begin

 for i:=1 to 8 do
  for j:=1 to 8 do
  if a[i,j]=1 then
  begin

   if i>=3 then
   begin
    n:=i-1;
    if a[n,j]=2 then
    begin
     while a[n,j]=2 do dec(n);
     if (a[n,j]=0) and (n>=1) then a[n,j]:=64
    end
   end;

   if i<=6 then
   begin
    n:=i+1;
    if a[n,j]=2 then
    begin
     while a[n,j]=2 do inc(n);
     if (a[n,j]=0) and (n<=8) then a[n,j]:=64
    end
   end;

   if j>=3 then
   begin
    m:=j-1;
    if a[i,m]=2 then
    begin
     while a[i,m]=2 do dec(m);
     if (a[i,m]=0) and (m>=1) then a[i,m]:=64
    end
   end;

   if j<=6 then
   begin
    m:=j+1;
    if a[i,m]=2 then
    begin
     while a[i,m]=2 do inc(m);
     if (a[i,m]=0) and (m<=8) then a[i,m]:=64
    end
   end;

   if (i>=3) and (j>=3) then
   begin
    n:=i-1;
    m:=j-1;
    if a[n,m]=2 then
    begin
     while a[n,m]=2 do
     begin
      dec(n);
      dec(m)
     end;
     if (a[n,m]=0) and (n>=1) and (m>=1) then a[n,m]:=64
    end
   end;

   if (i<=6) and (j<=6) then
   begin
    n:=i+1;
    m:=j+1;
    if a[n,m]=2 then
    begin
     while a[n,m]=2 do
     begin
      inc(n);
      inc(m)
     end;
     if (a[n,m]=0) and (n<=8) and (m<=8) then a[n,m]:=64
    end
   end;

   if (i<=6) and (j>=3) then
   begin
    n:=i+1;
    m:=j-1;
    if a[n,m]=2 then
    begin
     while a[n,m]=2 do
     begin
      inc(n);
      dec(m)
     end;
     if (a[n,m]=0) and (n<=8) and (m>=1) then a[n,m]:=64
    end
   end;

   if (i>=3) and (j<=6) then
   begin
    n:=i-1;
    m:=j+1;
    if a[n,m]=2 then
    begin
     while a[n,m]=2 do
     begin
      dec(n);
      inc(m)
     end;
     if (a[n,m]=0) and (n>=1) and (m<=8) then a[n,m]:=64
    end
   end;

  end
end;
{------------------}
procedure clicka;
begin
case readkey of {case#0}

      #75:if x<>0 then
          begin putimage(x,y,pole^,xorput);
           dec(x,b); putimage(x,y,pole^,xorput)
          end
          else
          begin
           putimage(x,y,pole^,xorput);
           x:=7*b;
           putimage(x,y,pole^,xorput);
          end;
      #77:if x<>7*b then
          begin putimage(x,y,pole^,xorput);
           inc(x,b); putimage(x,y,pole^,xorput)
          end
          else
          begin
           putimage(x,y,pole^,xorput);
           x:=0;
           putimage(x,y,pole^,xorput);
          end;
      #72:if y<>0 then
          begin putimage(x,y,pole^,xorput);
           dec(y,b); putimage(x,y,pole^,xorput)
          end
          else
          begin
           putimage(x,y,pole^,xorput);
           y:=7*b;
           putimage(x,y,pole^,xorput);
          end;
      #80:if y<>7*b then
          begin putimage(x,y,pole^,xorput);
           inc(y,b); putimage(x,y,pole^,xorput)
          end
          else
          begin
           putimage(x,y,pole^,xorput);
           y:=0;
           putimage(x,y,pole^,xorput);
          end;
      {75,77,72,80 управление курсором}

   end; {case#0}
end;
{-----------}
BEGIN  { Основная }

 {иниц. граф. режима}
  d:=detect;
 initgraph(d,md,'c:\Turbo\bgi');

 {сосдаём квадрат - курсор}
 setcolor(6);
 rectangle(0,0,b,b);
 size:=imagesize(0,0,b,b);
 getmem(pole,size);
 getimage(0,0,b,b,pole^);
 putimage(0,0,pole^,xorput);

 {выводим заголовок}
 setcolor(15);
 settextstyle(0,0,2);
 outtextxy ((GetMaxX-TextWidth('reverse')) div 2,25,'reverse');

 {определяем координаты левого верхнего угла окна}
 x:=(getmaxx-8*b) div 2;
 y:=(getmaxy-8*b) div 2;

 {сосдаём окно, за которым можно рисовать}
 setviewport(x,y,x+8*b,y+9*b+12,clipoff);

 {метка - игра с начала }
 new:

 {записываем, что ход чёрных}
 xod:=Xbl;

 {стираем надпись о результате игры}
 setfillstyle(1,0);
 bar(-150,8*b+2,8*b+150,b*8+58);

 {задаём матрицу}
 for i:=1 to 9 do for j:=1 to 9 do a[i,j]:=0;
 a[4,4]:=1;
 a[5,5]:=1;
 a[5,4]:=2;
 a[4,5]:=2;

 {определяем левый верхний угол квадрата-курсора относительно окна}
 x:=0;
 y:=0;

 {рисуем доску}
 doska;

 {задаем массив для контроля пропусков ходов(два пропуска хода подрят - конец игры)}
 w[0]:=0;
 w[1]:=0;

 {рисуем панельку}
 setfillstyle(1,1);
 setcolor(15);
 rectangle (-100,0,-140+3*b,40);
 rectangle(8*b+60,0,11*b+20,40);
 floodfill(-90,20,15);
 floodfill(10*b,20,15);
 line(-100,0,-100,40);
 line(-60,0,-60,40);
 line(9*b+20,0,9*b+20,40);
 line(10*b+20,0,10*b+20,40);
 fblack(-100,-5);
 fwhite(9*b+20,-5);

 {выводим счёт}
 schet;

 {проверяем за каким игроком первый ход}
 if xod=Xbl then goto metkaBL
 else
 if xod=Xwh then goto metkaWH;

 {метка - ход чёрных }
 metkaBL:

 clears;
 vakant_position_for_fblack;

 c:=0;
 for n:=1 to 8 do
 for m:=1 to 8 do
 if a[n,m]=64 then inc(c);

 if c=0 then
 begin

  settextstyle(0,0,1);
  setcolor(red);
  outtextxy((8*b-TextWidth('You pass! (Press Enter)'))div 2,8*b+30,'You pass! (Press Enter)' );
  readln;
  {стираем эту надпись}
  setfillstyle(1,0);
  bar(-150,8*b+2,8*b+150,b*8+58);
  {стираем рожицу(чёрных)}
  setfillstyle(1,1);
  bar(-140+2*b+1,1,-140+3*b-1,b-1);
  {проверка на завершение игры}
  if w[0]=0 then w[0]:=1
  else w[1]:=1;
  if (w[0]=1) and (w[1]=1) then goto podschet_fischek
  else goto metkaWH

 end
 else
 begin
  w[0]:=0;
  w[1]:=0
 end;
 clears;

 repeat {цикл - ход чёрных}

  xod:=Xbl;

  {выводим рожицу(чёрных)}
  setcolor(4);
  settextstyle(0,0,2);
  outtextxy(-140+2*b+(b-textwidth(http_1)) div 2,(b-textheight(http_1)) div 2,http_1);

  {управление клавишами}
  if keypressed then
  case readkey of {case black}

   #27:exit_from_game:ext:=true; {выход из игры}

   #0:clicka;
   #13:begin {чёрные совершают ход}

         {счётчик}
         l:=0;

         {определяем индексы матрицы, через координаты курсора}
         i:=y div b +1;
         j:=x div b +1;

         {если фишку поставили на пустую клеточку то...}
         if (a[i,j]<>1) and (a[i,j]<>2) then malblack
         else goto metkaBL;

         {если не перевернули ни одной фишки, то нужно повторить}
         if l=0 then goto metkaBL;

         {выводим счёт}
         schet;

         {стираем рожицу(чёрных)}
         setfillstyle(1,1);
         bar(-140+2*b+1,1,-140+3*b-1,b-1);

         {проверяем на завершение игры}

         {если все клетки заняты фишками, то игра закончена}
         c:=0;
         for i:=1 to 8 do
         for j:=1 to 8 do
         if a[i,j]=0 then inc(c);
         if c=0 then goto podschet_fischek;

         {если на поле все фишки чёрного цвета, то игра закончена}
         c:=0;
         for i:=1 to 8 do
         for j:=1 to 8 do
         if a[i,j]=2 then inc(c);
         if c=0 then goto podschet_fischek;

         {метка - ход белых }
         metkaWH:

         l:=0;

         {ход белых}
         Xod:=Xwh;

         {рожица}
         setcolor(4);
         settextstyle(0,0,2);
         outtextxy(10*b+20+(b-textwidth(http_2)) div 2,(b-textheight(http_2)) div 2,http_2);

         clears;
         vakant_position_for_fwhite;

         c:=0;
         for n:=1 to 8 do
         for m:=1 to 8 do
         if a[n,m]>=4 then inc(c);

         if c=0 then
         begin

          settextstyle(0,0,1);
          setcolor(red);
          outtextxy((8*b-TextWidth('I pass! (Press Enter)'))div 2,8*b+30,'I pass! (Press Enter)');
          readln;

          {стираем эту надпись}
          setfillstyle(1,0);
          bar(-150,8*b+2,8*b+150,b*8+58);

          {стираем рожицу}
          setfillstyle(1,1);
          bar(10*b+21,1,11*b+19,b-1);

          {проверка на завершение игры}
          if w[0]=0 then w[0]:=1
          else w[1]:=1;
          if (w[0]=1) and (w[1]=1) then goto podschet_fischek
          else goto metkaBL

         end
         else
         begin
           w[0]:=0;
           w[1]:=0
         end;

         intellekt_max;
         clears;
         malwhite;

         {счет}
         schet;

         {стираем рожицу}
         setfillstyle(1,1);
         bar(10*b+21,1,11*b+19,b-1);

         {проверяем на завершение}
         c:=0;
         for i:=1 to 8 do
         for j:=1 to 8 do
         if a[i,j]=0 then inc(c);
         if c=0 then goto podschet_fischek;

         c:=0;
         for i:=1 to 8 do
         for j:=1 to 8 do
         if a[i,j]=1 then inc(c);
         if c=0 then goto podschet_fischek;

         goto metkaBL;
 end {чёрные совершают ход}
 end {case black}
 until ext; {цикл - ход чёрных}

 {подсчитываем фишки по завершении игры}
 podschet_fischek:

 putimage(x,y,pole^,xorput);

  if not ext then
  begin

    {стираем рожицы}
    setfillstyle(1,1);
    bar(-140+2*b+1,1,-140+3*b-1,b-1);
    bar(10*b+21,1,11*b+19,b-1);

    settextstyle(0,0,1);

    bl:=0;
    wh:=0;

    for i:=1 to 8 do
      for j:=1 to 8 do
        if a[i,j]=1 then inc(bl)
         else
        if a[i,j]=2 then inc(wh);

    str(bl,sbl);
    str(wh,swh);
    setcolor(red);

    if bl>wh then
    outtextxy((8*b-TextWidth('Your victory! ('+sbl+':'+swh+')'))div 2,8*b+30,'Your victory! ('+sbl+':'+swh+')')
    else
    if wh>bl then
    outtextxy((8*b-TextWidth('My victory! ('+swh+':'+sbl+')'))div 2,8*b+30,'My victory! ('+swh+':'+sbl+')')
    else outtextxy((8*b-TextWidth('Drawn game! ('+sbl+':'+swh+')'))div 2,8*b+30,'Drawn game! ('+sbl+':'+swh+')')
  end;{if not ext}

  repeat
   if keypressed then
   case readkey of
    #13:goto new;
    #27:ext:=true;
   end;
  until ext;

 closegraph;
END.
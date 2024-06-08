module t_control_tb;

wire nr,ng,ny,sr,sg,sy,er,eg,ey,wr,wy,wg;
reg clk,rst_a;
traffic_light_controller k(.nr(nr),.ng(ng),.ny(ny),.sr(sr),.sg(sg),.sy(sy),.er(er),.eg(eg),.ey(ey),.wr(wr),.wy(wy),.wg(wg),.clk(clk),.rst_a(rst_a));

initial
 begin
  clk=1'b1;
  forever #5 clk=~clk;
 end
 
initial
 begin
  rst_a=1'b1;
  #15;
  rst_a=1'b0;
  #1000;
  $stop;
 end
endmodule
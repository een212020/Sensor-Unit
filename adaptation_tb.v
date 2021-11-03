`timescale 1ns / 1ps

module adaptation_tb;
    reg reset;
    reg [1:0] next_road;
    reg [7:0] N_n, N_e, N_s, N_w;
    reg [7:0] TGin, TGie, TGis, TGiw;
    wire [7:0] TGn, TGe, TGs, TGw;
    
    initial begin
        clk = 0;
        TGin = 10;
        TGie = 10;
        TGis = 10;
        TGiw = 10;
        N_n = 20;
        N_e = 20;
        N_s = 20;
        N_w = 20;
        reset = 1; #10
        next_road = 0;
        N_n = 43;
        N_e = 22;
        N_s = 20;
        N_w = 15;
        reset = 0; #50
        next_road = 1; #50
        N_n = 30;
        N_e = 34;
        N_s = 25;
        N_w = 15;
        next_road = 2; #50
        next_road = 3; #50
        $finish;
    end
    
    Adaptation DUT(reset, next_road,
        N_n, N_e, N_s, N_w, 
        TGin, TGie, TGis, TGiw,
        TGn, TGe, TGs, TGw 
        );
    
endmodule

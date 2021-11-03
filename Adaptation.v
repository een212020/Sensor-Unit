`timescale 1ns / 1ps

module Adaptation(
    reset, next_road, tot, avg,
    N_n, N_e, N_s, N_w, 
    TGin, TGie, TGis, TGiw,
    TGn, TGe, TGs, TGw 
    );
    
    input reset;
    input [1:0] next_road;
    input [7:0] N_n, N_e, N_s, N_w;
    input [7:0] TGin, TGie, TGis, TGiw;
    
    output reg [7:0] TGn, TGe, TGs, TGw;
    
    output reg [8:0] tot;
    output reg [7:0] avg;
    parameter b = 1;

    
    always @(next_road) begin
        
        if(reset) begin
            TGn <= TGin;
            TGe <= TGie;
            TGs <= TGis;
            TGw <= TGiw;
        end
        
        tot = N_n + N_e + N_s + N_w;
        avg = tot >> 2;      
        
        TGn = TGin + b*(N_n - avg);             
        TGe = TGie + b*(N_e - avg);       
        TGs = TGis + b*(N_s - avg);
        TGw = TGiw + b*(N_w - avg);

    end
endmodule

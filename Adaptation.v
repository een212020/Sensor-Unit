`timescale 1ns / 1ps

module Adaptation(
    reset, next_road,
    N_n, N_e, N_s, N_w, 
    TGn, TGe, TGs, TGw 
    );
    
    input reset;
    input [1:0] next_road;
    input [7:0] N_n, N_e, N_s, N_w;
    
    output reg [7:0] TGn, TGe, TGs, TGw;
    
    reg [7:0] TGin, TGie, TGis, TGiw;
    reg [8:0] tot;
    reg [7:0] avg;
    parameter b = 1;

    
    always @(next_road or reset) begin
        //initialise when high
        if(reset) begin
            TGin <= 54;
            TGie <= 54;
            TGis <= 54;
            TGiw <= 54;
            TGn <= 54;
            TGe <= 54;
            TGs <= 54;
            TGw <= 54;
        end
        
        //Calculate sum of Ni
        tot = N_n + N_e + N_s + N_w;
        //Calculate average using right shift
        avg = tot >> 2;      
        
        //update TGx values according to next_road value
        case (next_road)
            0: begin 
                    TGn = TGin + b*(N_n - avg);
                    TGin = TGn;
               end         
            1: begin
                    TGe = TGie + b*(N_e - avg);
                    TGie = TGe;
               end       
            2: begin
                    TGs = TGis + b*(N_s - avg);
                    TGis = TGs;
               end
            3: begin
                    TGw = TGiw + b*(N_w - avg);
                    TGiw = TGw;
               end
        endcase

    end
endmodule

`timescale 1ns / 1ps


module north_sensor_tb;
    reg reset;
    reg [1:0] next_road;
    reg [7:0] data_in;
    wire [7:0] avg;
    
    initial begin
        next_road = 0;
        reset = 1; #10
        reset = 0;
        data_in = 12; #120
        data_in = 20; #120
        data_in = 30; #120
        data_in = 10; 
    end
    
    north_sensor DUT(reset, next_road, data_in, avg);
    
    always #50 next_road = ~next_road;
    
endmodule

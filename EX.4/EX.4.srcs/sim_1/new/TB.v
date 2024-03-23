`timescale 1ns / 1ps

module TB();

    reg clk, rst, in_50b, in_100b;
    wire ciocolata;
    
    FSM_hot_chocolate DUT(
                          .clk(clk),
                          .rst(rst),
                          .in_50b(in_50b),
                          .in_100b(in_100b),
                          .ciocolata(ciocolata)
                          );

    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end
    
    initial begin
        rst = 1;
        in_50b = 1;
        in_100b = 1;
    #5
        rst = 0;
        in_50b = 1;
        in_100b = 0;
    #5
        rst = 0;
        in_50b = 0;
        in_100b = 1;
    #5
        rst = 0;
        in_50b = 1;
        in_100b = 1;
    #5
        rst = 0;
        in_50b = 0;
        in_100b = 0;    
    #10
        $stop();
    end
endmodule

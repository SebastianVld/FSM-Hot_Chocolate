`timescale 1ns / 1ps

module FSM_hot_chocolate(
                         input clk,
                         input rst,
                         input in_50b,
                         input in_100b,
                         output ciocolata
                         );
                         
     localparam S0 = 3'b000;
     localparam S1 = 3'b001;                    
     localparam S2 = 3'b010;
     localparam S3 = 3'b011;
     localparam S4 = 3'b100;
     localparam S5 = 3'b101;
     
     reg [2:0] state, state_next;
     
     always@(posedge clk)begin
        if(rst == 1)
            state <= S1;
        else 
            state <= state_next;
     end      
     
     always@(*)begin
        state_next = state;
        case(state)
            S0:begin
                    if(in_50b == 0 & in_100b == 0)
                        state_next = S0;
                    if(in_50b == 1 & in_100b == 0)
                        state_next = S1;
                    if(in_50b == 0 & in_100b == 1)
                        state_next = S2;
                    if(in_50b == 1 & in_100b == 1)
                        state_next = S3;
               end
            S1:begin
                    if(in_50b == 0 & in_100b == 0)
                        state_next = S1;
                    if(in_50b == 1 & in_100b == 0)
                        state_next = S2;
                    if(in_50b == 0 & in_100b == 1)
                        state_next = S3;
                    if(in_50b == 1 & in_100b == 1)
                        state_next = S4;
               end
            S2:begin
                    if(in_50b == 0 & in_100b == 0)
                        state_next = S2;
                    if(in_50b == 1 & in_100b == 0)
                        state_next = S3;
                    if(in_50b == 0 & in_100b == 1)
                        state_next = S4;
                    if(in_50b == 1 & in_100b == 1)
                        state_next = S5;
               end
            S3:begin
                    if(in_50b == 0 & in_100b == 0)
                        state_next = S3;
                    if(in_50b == 1 & in_100b == 0)
                        state_next = S4;
                    if(in_50b == 0 & in_100b == 1)
                        state_next = S5;
                    if(in_50b == 1 & in_100b == 1)
                        state_next = S1;
               end
            S4:begin
                    if(in_50b == 0 & in_100b == 0)
                        state_next = S4;
                    if(in_50b == 1 & in_100b == 0)
                        state_next = S5;
                    if(in_50b == 0 & in_100b == 1)
                        state_next = S1;
                    if(in_50b == 1 & in_100b == 1)
                        state_next = S2;
               end
            S5:begin
                    if(in_50b == 0 & in_100b == 0)
                        state_next = S0;
                    if(in_50b == 1 & in_100b == 0)
                        state_next = S1;
                    if(in_50b == 0 & in_100b == 1)
                        state_next = S2;
                    if(in_50b == 1 & in_100b == 1)
                        state_next = S3;
               end
            default: state_next = S0;   
        endcase
     end   
     
     assign ciocolata = (state_next == S5);           
                         
endmodule

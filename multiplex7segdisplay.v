`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2023 03:56:36 PM
// Design Name: 
// Module Name: multiplex7segdisplay
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module multiplex7segdisplay(
    input [4:0] ps,
    input CLK,
    output [7:0] seg,
    output reg [3:0] an
    );
    
    reg [7:0] ones, tens;
    
   always @(*)
   begin
         case (ps) 
            4'b0000: begin ones = 8'b00000011; tens = 8'b00000011; end
            4'b0001: begin ones = 8'b10011111; tens = 8'b00000011; end
            4'b0010: begin ones = 8'b00100101; tens = 8'b00000011; end
            4'b0011: begin ones = 8'b00001101; tens = 8'b00000011; end
            4'b0100: begin ones = 8'b10011001; tens = 8'b00000011; end
            4'b0101: begin ones = 8'b01001001; tens = 8'b00000011; end
            4'b0110: begin ones = 8'b01000001; tens = 8'b00000011; end
            4'b0111: begin ones = 8'b00011111; tens = 8'b00000011; end
            4'b1000: begin ones = 8'b00000001; tens = 8'b00000011; end
            4'b1001: begin ones = 8'b00001001; tens = 8'b00000011; end
            
            4'b1010: begin ones = 8'b00000011; tens = 8'b10011111; end
            4'b1011: begin ones = 8'b10011111; tens = 8'b10011111; end
            4'b1100: begin ones = 8'b00100101; tens = 8'b10011111; end
            4'b1101: begin ones = 8'b00001101; tens = 8'b10011111; end
            4'b1110: begin ones = 8'b10011001; tens = 8'b10011111; end
            4'b1111: begin ones = 8'b01001001; tens = 8'b10011111; end
        endcase
        
    end 
    
    
    
    
     clk_2n_div_test #(.n(13)) MY_DIV2 (
     .clockin   (CLK), 
     .fclk_only (0),          
     .clockout  (divclk)   );  
 
      mux_2t1_nb  #(.n(8)) my_2t1_mux  (
       .SEL   (divclk), 
       .D0    (ones), 
       .D1    (tens), 
       .D_OUT (seg) );  

       
       
       always @(divclk,an)
       begin
         if (divclk == 'b1) an = 4'b1011;
         else            an = 4'b0111;  
       end 
      
 
endmodule

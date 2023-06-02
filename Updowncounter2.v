`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/23/2023 03:56:36 PM
// Design Name: 
// Module Name: Updowncounter2
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

 module Updowncounter2(
    input b,
    input clk,
    output [7:0] seg ,
    output [3:0] an ,
    output reg [14:0] led
    );
    
    reg [3:0] ns;
    wire [3:0]  ps;
    
 reg_nb_sclr #(.n(4)) MY_REG (
     .data_in  (ns), 
     .ld       (1), 
     .clk      (divclk), 
     .clr      (0), 
     .data_out (ps)
          );  



  multiplex7segdisplay my_segdisplay (
     .ps    ({ps}), 
     .CLK    (clk), 
     .seg   (seg), 
     .an   (an)
    ); 
     

 clk_2n_div_test #(.n(24)) MY_DIV (
     .clockin   (clk), 
     .fclk_only (0),          
     .clockout  (divclk)   );  
 



   always @(ps, led)
   begin
       if (b==1)
         case (ps) 
            4'b0000: led = 15'b000000000000000 ;
            4'b0001: led = 15'b000000000000001 ;
            4'b0010: led = 15'b000000000000011 ;
            4'b0011: led = 15'b000000000000111 ;
            4'b0100: led = 15'b000000000001111 ;
            4'b0101: led = 15'b000000000011111 ;
            4'b0110: led = 15'b000000000111111 ;
            4'b0111: led = 15'b000000001111111 ;
            4'b1000: led = 15'b000000011111111 ;
            4'b1001: led = 15'b000000111111111 ;
            4'b1010: led = 15'b000001111111111 ;
            4'b1011: led = 15'b000011111111111 ;
            4'b1100: led = 15'b000111111111111 ;
            4'b1101: led = 15'b001111111111111 ;
            4'b1110: led = 15'b011111111111111 ;
            4'b1111: led = 15'b111111111111111 ;
        endcase
      else
         case (ps) 
            4'b0000: led = 15'b111111111111111 ;
            4'b0001: led = 15'b111111111111110 ;
            4'b0010: led = 15'b111111111111100 ;
            4'b0011: led = 15'b111111111111000 ;
            4'b0100: led = 15'b111111111110000 ;
            4'b0101: led = 15'b111111111100000 ;
            4'b0110: led = 15'b111111111000000 ;
            4'b0111: led = 15'b111111110000000;
            4'b1000: led = 15'b111111100000000 ;
            4'b1001: led = 15'b111111000000000 ;
            4'b1010: led = 15'b111110000000000 ;
            4'b1011: led = 15'b111100000000000 ;
            4'b1100: led = 15'b111000000000000 ;
            4'b1101: led = 15'b110000000000000 ;
            4'b1110: led = 15'b100000000000000 ;
            4'b1111: led = 15'b000000000000000 ;
        endcase
    end 
      
      
    always @(*)
    begin  
         if (b==0) 
                case(ps)
                     4'b0000: ns = 4'b1111 ;
                     4'b0001: ns = 4'b0000 ;
                     4'b0010: ns = 4'b0001 ;
                     4'b0011: ns = 4'b0010 ;
                     4'b0100: ns = 4'b0011 ;
                     4'b0101: ns = 4'b0100 ;
                     4'b0110: ns = 4'b0101 ;
                     4'b0111: ns = 4'b0110 ;
                     4'b1000: ns = 4'b0111 ;
                     4'b1001: ns = 4'b1000 ;
                     4'b1010: ns = 4'b1001 ;
                     4'b1011: ns = 4'b1010 ;
                     4'b1100: ns = 4'b1011 ;
                     4'b1101: ns = 4'b1100 ;
                     4'b1110: ns = 4'b1101 ;
                     4'b1111: ns = 4'b1110 ;  
                endcase
          else 
                case(ps)
                     4'b0000: ns = 4'b0001 ;
                     4'b0001: ns = 4'b0010 ;
                     4'b0010: ns = 4'b0011 ;
                     4'b0011: ns = 4'b0100 ;
                     4'b0100: ns = 4'b0101 ;
                     4'b0101: ns = 4'b0110 ;
                     4'b0110: ns = 4'b0111 ;
                     4'b0111: ns = 4'b1000 ;
                     4'b1000: ns = 4'b1001 ;
                     4'b1001: ns = 4'b1010 ;
                     4'b1010: ns = 4'b1011 ;
                     4'b1011: ns = 4'b1100 ;
                     4'b1100: ns = 4'b1101 ;
                     4'b1101: ns = 4'b1110 ;
                     4'b1110: ns = 4'b1111 ;
                     4'b1111: ns = 4'b0000 ;  
                    
                endcase
         end   
endmodule

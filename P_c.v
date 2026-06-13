module PC (PC_Next,PC,rst,clk);
 //declaring inputs 

  input[31:0] PC_Next;
  input clk,rst;

  //declaring output

  output reg [31:0] PC;

  // logic

  always @(posedge clk)
  begin
    if (rst == 1'b0)
      begin
         PC <=32'h00000000;

      end
    else 
    begin
        PC<= PC_Next;
    end 
  end
endmodule


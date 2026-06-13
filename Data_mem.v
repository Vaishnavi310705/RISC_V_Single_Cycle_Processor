module Data_mem(A,WD,clk,WE,RD,rst);
   
   // declaring inputs
   input [31:0] A,WD;
   input clk,WE;
   input rst;

   //declaring output

   output [31:0] RD;

   reg [31:0] Data_mem[1023:0];

   //read 
   assign RD = (!rst) ? 32'h00000000 :
                     Data_mem[A[31:2]];
   // write 
   always @(posedge clk) 
        begin
            if(WE)
             begin 
                Data_mem[A[31:2]] <=WD;
             end
        end

endmodule   

    
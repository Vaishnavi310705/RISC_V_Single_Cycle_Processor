

module Control_Unit (op,RegWrite,MemWrite,ResultSrc,ALUSrc,ImmSrc,PCSrc,funct3,funct7,ALUControl);

   //declaring inputs 
   input [6:0] op,funct7;
   input [2:0] funct3;

   //declaring outputs
   output RegWrite, ALUSrc, MemWrite, ResultSrc, PCSrc;
   output [1:0] ImmSrc;
   output [1:0] ALUOp;
   output [2:0] ALUControl;
   wire [1:0] ALUOp;

   main_decoder main_decoder(
        .op(op),
        .RegWrite(RegWrite),
        .ImmSrc(ImmSrc),
        .MemWrite(MemWrite),
        .ResultSrc(ResultSrc),
        .ALUSrc(ALUSrc),
        .ALUOp(ALUOp)

   );

   ALU_decoder AlU_decoder(
           .ALUOp(ALUOp),
           .funct3(funct3),
           .funct7(funct7[5]),
           .op5(op[5]),
           .ALUControl(ALUControl)
        
   );
endmodule   
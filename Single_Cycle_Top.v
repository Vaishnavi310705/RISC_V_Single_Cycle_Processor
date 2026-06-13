


module Single_Cycle_Top(clk,rst);
   input clk,rst;

   wire [31:0] PC_Top , RD1_Top,RD2_Top, RD_Instr , Imm_Ext_Top , ALUResult , ReadData,PC_Plus4;
   wire RegWrite , MemWrite;
   wire [2:0] ALUControl_Top;
   wire [1:0] ImmSrc_Top;

   PC P_c(
       .clk(clk),
       .rst(rst),
       .PC(PC_Top),
       .PC_Next(PC_Plus4)
      
   );

   Instr_mem Instr_mem(
    .rst(rst),
    .A(PC_Top),
    .RD(RD_Instr)
   );

   reg_file Register_File(
      .clk(clk),
      .rst(rst),
      .WE3(RegWrite),
      .WD3(ReadData),
      .A1(RD_Instr[19:15]),
      .A2(RD_Instr[24:20]),
      .A3(RD_Instr[11:7]),
      .RD1(RD1_Top),
     .RD2(RD2_Top)

   );
    
    Sign_Extend Sign_Extend (
    .In(RD_Instr),
    .ImmSrc(ImmSrc_Top),
    .Imm_Ext(Imm_Ext_Top)
    );

   ALU_Flag ALU_Flag(
        .A(RD1_Top),
        .B(Imm_Ext_Top),
        .ALUControl(ALUControl_Top),
        .Result(ALUResult),
        .Z(),
        .N(),
        .C(),
        .V()

   );

   Control_Unit COntrol_Unit (
          .op(RD_Instr[6:0]),
          .RegWrite(RegWrite),
          .MemWrite(MemWrite),
          .ResultSrc(),
          .ALUSrc(),
          .ImmSrc(ImmSrc_Top),
          .PCSrc(),
          .funct3(RD_Instr[14:12]),
          .funct7(),
          .ALUControl(ALUControl_Top)
   );
    
    Data_mem Data_mem(
        .A(ALUResult),
        .WD(RD2_Top),
        .clk(clk),
        .WE(MemWrite),
        .RD(ReadData),
        .rst(rst)
    );

    PC_Adder PC_Adder(
        .a(PC_Top),
        .b(32'd4),
        .c(PC_Plus4)
    ) ;

endmodule     
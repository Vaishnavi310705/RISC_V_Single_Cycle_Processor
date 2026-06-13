module Instr_mem (
    input  [31:0] A,
    input         rst,
    output [31:0] RD
);

    // 1024 words × 32 bits
    reg [31:0] mem [0:1023];

    // Instruction initialization
    initial begin
        mem[0] = 32'hFFC4A303;
        mem[1] = 32'h0064A423;
        mem[2] = 32'h00B62423;
        mem[3] = 32'h0064A423;
    end

    // Read instruction
    assign RD = (!rst) ? 32'h00000000 :
                          mem[A[31:2]];

endmodule
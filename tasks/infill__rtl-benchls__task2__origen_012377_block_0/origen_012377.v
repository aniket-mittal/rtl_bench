module origen_012377 (
    input wire Clk,
    input wire Rst,
    input wire PC_INC,
    input wire PCH_INC,
    input wire PCH_IN,
    input wire PC_IN,
    input wire PC_OUT,
    input wire [3:0] BUS_IN,
    output reg [3:0] BUS_OUT,
    output wire [7:0] C_MEM
);

    reg [3:0] PC_LEFT;
    reg [3:0] PC_RIGHT;

    assign C_MEM = {PC_LEFT, PC_RIGHT};

    [MASKED]

    always @(*) begin
        if (PC_OUT) begin
            BUS_OUT = PC_RIGHT;
        end else begin
            BUS_OUT = 4'bzzzz;
        end
    end

endmodule
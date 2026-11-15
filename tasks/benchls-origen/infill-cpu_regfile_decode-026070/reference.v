module origen_026070(
    input wire clk,
    input wire reset,
    input wire [15:0] ins,
    input wire [15:0] data_alu,
    input wire [2:0] rd_alu,
    output reg [15:0] r1_data,
    output reg [15:0] r2_data,
    output wire [2:0] rd,
    output reg [2:0] aluop,
    output reg [2:0] imm_data
);

    reg [15:0] reg_bank [0:7];

    initial begin
        reg_bank[0] = 16'h0000;
        reg_bank[1] = 16'h0005;
        reg_bank[2] = 16'h0005;
        reg_bank[3] = 16'h0000;
        reg_bank[4] = 16'h0000;
        reg_bank[5] = 16'h0000;
        reg_bank[6] = 16'h0000;
        reg_bank[7] = 16'h0000;
    end

    always @(negedge clk) begin
        r1_data <= reg_bank[ins[12:10]];
        r2_data <= reg_bank[ins[9:7]];
        imm_data <= ins[12:10];
    end

    always @(posedge clk or posedge reset) begin
        if (!reset) begin
            reg_bank[rd_alu] <= data_alu;
        end
    end

    always @(*) begin
        case (ins[15:13])
            3'b000: aluop[1:0] = 2'b00;
            3'b001: aluop[1:0] = 2'b01;
            3'b010: aluop[1:0] = 2'b10;
            3'b011: aluop[1:0] = 2'b11;
            default: aluop[1:0] = 2'b00;
        endcase

        case (ins[3:0])
            4'b0001: aluop[2] = 1'b0;
            4'b0010: aluop[2] = 1'b1;
            default: aluop[2] = 1'b0;
        endcase
    end

    assign rd = ins[6:4];

endmodule
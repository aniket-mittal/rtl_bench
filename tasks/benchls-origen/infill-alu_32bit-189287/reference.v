module origen_189287 (
    input reset,
    input [31:0] in_data_read_1,
    input [31:0] in_ex_mux,
    input [3:0] operation,
    output reg out_zero,
    output reg [31:0] alu_result
);

localparam AND = 4'b0000;
localparam OR = 4'b0001;
localparam XOR = 4'b0010;
localparam NOR = 4'b0011;
localparam ADD = 4'b0100;
localparam SUB = 4'b0101;
localparam LUI = 4'b0110;
localparam SLT = 4'b0111;
localparam SLL = 4'b1000;
localparam SRL = 4'b1001;
localparam SRA = 4'b1010;
localparam SLLV = 4'b1011;
localparam SRLV = 4'b1100;
localparam SRAV = 4'b1101;

always @(*) begin
    if (reset) begin
        alu_result = 32'b0;
        out_zero = 1'b1;
    end
    else begin
        case (operation)
            AND: begin
                alu_result = in_data_read_1 & in_ex_mux;
                out_zero = (alu_result == 32'b0);
            end
            OR: begin
                alu_result = in_data_read_1 | in_ex_mux;
                out_zero = (alu_result == 32'b0);
            end
            XOR: begin
                alu_result = in_data_read_1 ^ in_ex_mux;
                out_zero = (alu_result == 32'b0);
            end
            NOR: begin
                alu_result = ~(in_data_read_1 | in_ex_mux);
                out_zero = (alu_result == 32'b0);
            end
            ADD: begin
                alu_result = in_data_read_1 + in_ex_mux;
                out_zero = (alu_result == 32'b0);
            end
            SUB: begin
                alu_result = in_data_read_1 - in_ex_mux;
                out_zero = (alu_result == 32'b0);
            end
            LUI: begin
                alu_result = {in_ex_mux[31:16], 16'b0};
                out_zero = (alu_result == 32'b0);
            end
            SLT: begin
                alu_result = ($signed(in_data_read_1) < $signed(in_ex_mux)) ? 32'b1 : 32'b0;
                out_zero = (alu_result == 32'b0);
            end
            SLL: begin
                alu_result = in_data_read_1 << in_ex_mux[4:0];
                out_zero = (alu_result == 32'b0);
            end
            SRL: begin
                alu_result = in_data_read_1 >> in_ex_mux[4:0];
                out_zero = (alu_result == 32'b0);
            end
            SRA: begin
                alu_result = $signed(in_data_read_1) >>> in_ex_mux[4:0];
                out_zero = (alu_result == 32'b0);
            end
            SLLV: begin
                alu_result = in_ex_mux << in_data_read_1[4:0];
                out_zero = (alu_result == 32'b0);
            end
            SRLV: begin
                alu_result = in_ex_mux >> in_data_read_1[4:0];
                out_zero = (alu_result == 32'b0);
            end
            SRAV: begin
                alu_result = $signed(in_ex_mux) >>> in_data_read_1[4:0];
                out_zero = (alu_result == 32'b0);
            end
            default: begin
                alu_result = 32'b0;
                out_zero = 1'b1;
            end
        endcase
    end
end

endmodule
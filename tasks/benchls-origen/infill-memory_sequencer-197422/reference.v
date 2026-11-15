module origen_197422(
    input clk,
    input rst_n,
    input [31:0] aluout,
    input [31:0] rd,
    input [31:0] ram_rd,
    output reg [5:0] ra,
    output reg [5:0] wa,
    output reg [31:0] wd,
    output reg [31:0] td,
    output reg ram_we,
    output reg [5:0] ram_ra
);

reg [1:0] state;

always @(negedge clk) begin
    if (!rst_n) begin
        state <= 2'b11;
        ra <= 6'b0;
        wa <= 6'b0;
    end
    else begin
        case (state)
            2'b11: state <= 2'b00;
            2'b00: begin
                wd <= ram_rd;
                wa <= wa + 1;
                state <= 2'b01;
            end
            2'b01: begin
                wd <= ram_rd;
                td <= rd;
                ra <= ra + 1;
                wa <= wa + 1;
                state <= 2'b10;
            end
            2'b10: begin
                wd <= aluout;
                td <= rd;
                ram_we <= 1;
                ra <= ra + 1;
                wa <= wa + 1;
                ram_ra <= ram_ra + 1;
                state <= 2'b10;
            end
        endcase
    end
end

endmodule
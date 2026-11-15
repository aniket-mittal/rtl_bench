module origen_164025(
    input clk_i,
    input rst_i,
    input [7:0] a_bi,
    input [7:0] b_bi,
    input start_i,
    output reg busy_o,
    output reg [15:0] y_bo
);

reg [7:0] a, b;
reg [7:0] ctr;
reg [15:0] part_res;
reg [1:0] state;

parameter IDLE = 2'b00, WORK = 2'b01;

always @(posedge clk_i or posedge rst_i) begin
    if (rst_i) begin
        state <= IDLE;
        busy_o <= 0;
        y_bo <= 0;
    end
    else begin
        case (state)
            IDLE: begin
                if (start_i) begin
                    a <= a_bi;
                    b <= b_bi;
                    ctr <= 0;
                    part_res <= 0;
                    state <= WORK;
                    busy_o <= 1;
                end
                else begin
                    busy_o <= 0;
                end
            end
            WORK: begin
                part_res <= part_res + (a & (b[ctr] ? 8'hff : 8'h00)) << ctr;
                ctr <= ctr + 1;
                if (ctr == 7) begin
                    state <= IDLE;
                    y_bo <= part_res;
                    busy_o <= 0;
                end
            end
        endcase
    end
end

endmodule
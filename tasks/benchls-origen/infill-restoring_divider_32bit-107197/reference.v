module origen_107197 (
    input wire i_clk,
    input wire i_rst,
    input wire i_start,
    input wire [31:0] i_rs1,
    input wire [31:0] i_rs2,
    output reg [31:0] o_res,
    output reg [31:0] o_rem,
    output wire ok
);

    reg active;
    reg [4:0] cycle;
    reg [31:0] result;
    reg [63:0] work;
    wire [32:0] sub = work[63:31] - {1'b0, i_rs2};

    assign ok = ~active;

    always @(posedge i_clk or negedge i_rst) begin
        if (~i_rst) begin
            active <= 1'b0;
            cycle <= 5'd0;
            result <= 32'd0;
            work <= 64'd0;
            o_res <= 32'd0;
            o_rem <= 32'd0;
        end else begin
            if (i_start && !active) begin
                active <= 1'b1;
                cycle <= 5'd0;
                result <= 32'd0;
                work <= {32'd0, i_rs1};
            end else if (active) begin
                if (sub[32] == 1'b0) begin
                    work <= {sub[31:0], work[30:0], 1'b0};
                    result <= {result[30:0], 1'b1};
                end else begin
                    work <= {work[62:0], 1'b0};
                    result <= {result[30:0], 1'b0};
                end
                
                if (cycle == 5'd31) begin
                    active <= 1'b0;
                    o_res <= result;
                    o_rem <= work[63:32];
                end else begin
                    cycle <= cycle + 1'b1;
                end
            end
        end
    end

endmodule
module origen_035131 (
    input wire clk,
    input wire rst_n,
    input wire s1_flg_384,
    input wire [15:0] wr_size,
    input wire [15:0] cmd_extend,
    input wire size0_clr,
    input wire size0_add,
    input wire size1_clr,
    input wire size1_en,
    input wire [1:0] size1_op,
    output reg [31:0] size0,
    output reg [31:0] size1
);

    reg [31:0] size0_next, size1_next;

    always @(*) begin
        // size0 logic
        if (size0_clr)
            size0_next = 32'd0;
        else if (size0_add)
            size0_next = size0 + {16'd0, wr_size};
        else
            size0_next = size0;

        // size1 logic
        if (size1_clr)
            size1_next = 32'd0;
        else if (size1_en) begin
            case (size1_op)
                2'b00: size1_next = {16'd0, wr_size};
                2'b01: size1_next = size1 + {16'd0, wr_size};
                2'b10: size1_next = size1 + {16'd0, cmd_extend};
                2'b11: size1_next = size1 + (s1_flg_384 ? 32'd48 : 32'd32);
            endcase
        end
        else
            size1_next = size1;
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            size0 <= 32'd0;
            size1 <= 32'd0;
        end
        else begin
            size0 <= size0_next;
            size1 <= size1_next;
        end
    end

endmodule
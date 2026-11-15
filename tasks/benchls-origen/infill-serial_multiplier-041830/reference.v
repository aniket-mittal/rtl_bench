module origen_041830 #(
    parameter WIDTH = 32
) (
    input wire alu_op_mul,
    input wire clk,
    input wire ex_freeze,
    input wire reset,
    input wire [WIDTH-1:0] a_in,
    input wire [WIDTH-1:0] b_in,
    output reg [2*WIDTH-1:0] mul_prod_r,
    output wire mul_stall
);

reg [5:0] serial_mul_cnt;
reg mul_free;
reg [WIDTH-1:0] x, y;
reg ex_freeze_r;

wire start_mul = alu_op_mul && mul_free && !ex_freeze;

assign mul_stall = (serial_mul_cnt != 6'd0) || (alu_op_mul && !ex_freeze);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        serial_mul_cnt <= 6'd0;
        mul_free <= 1'b1;
        mul_prod_r <= {(2*WIDTH){1'b0}};
        x <= {WIDTH{1'b0}};
        y <= {WIDTH{1'b0}};
        ex_freeze_r <= 1'b0;
    end else begin
        ex_freeze_r <= ex_freeze;

        if (start_mul) begin
            serial_mul_cnt <= WIDTH[5:0];
            mul_free <= 1'b0;
            x <= a_in;
            y <= b_in;
            mul_prod_r <= {{WIDTH{1'b0}}, b_in};
        end else if (serial_mul_cnt != 6'd0 && !ex_freeze && !ex_freeze_r) begin
            if (mul_prod_r[0])
                mul_prod_r[2*WIDTH-1:WIDTH] <= mul_prod_r[2*WIDTH-1:WIDTH] + x;
            
            mul_prod_r <= {1'b0, mul_prod_r[2*WIDTH-1:1]};
            serial_mul_cnt <= serial_mul_cnt - 6'd1;

            if (serial_mul_cnt == 6'd1)
                mul_free <= 1'b1;
        end
    end
end

// Debug display
always @(posedge clk) begin
    if (alu_op_mul && !ex_freeze && !reset)
        ;
end

endmodule
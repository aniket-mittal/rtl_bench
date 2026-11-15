module origen_095659(
    input wire reset,
    input wire clk,
    input wire [31:0] a_in,
    input wire [31:0] b_in,
    input wire start,
    output wire [63:0] product,
    output wire done
);

    reg [63:0] prod_reg;
    reg [31:0] reg_a;
    wire prod_reg_ld_high, prod_reg_shift_rt;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            prod_reg <= 64'b0;
            reg_a <= 32'b0;
        end else if (start) begin
            prod_reg <= {32'b0, b_in};
            reg_a <= a_in;
        end else if (prod_reg_ld_high) begin
            prod_reg[63:32] <= prod_reg[63:32] + reg_a;
        end else if (prod_reg_shift_rt) begin
            prod_reg <= {1'b0, prod_reg[63:1]};
        end
    end

    assign product = prod_reg;

    mult3_ctl control(
        .reset(reset),
        .clk(clk),
        .start(start),
        .prod_lsb(prod_reg[0]),
        .prod_reg_ld_high(prod_reg_ld_high),
        .prod_reg_shift_rt(prod_reg_shift_rt),
        .done(done)
    );

endmodule

module mult3_ctl(
    input wire reset,
    input wire clk,
    input wire start,
    input wire prod_lsb,
    output reg prod_reg_ld_high,
    output reg prod_reg_shift_rt,
    output wire done
);

    localparam IDLE = 2'b00;
    localparam TEST = 2'b01;
    localparam ADD = 2'b10;
    localparam SHIFT = 2'b11;

    reg [1:0] state, next_state;
    reg [5:0] cycle_cnt;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            cycle_cnt <= 6'b0;
        end else begin
            state <= next_state;
            if (state == TEST && !done)
                cycle_cnt <= cycle_cnt + 1'b1;
            else if (state == IDLE)
                cycle_cnt <= 6'b0;
        end
    end

    always @(*) begin
        next_state = state;
        prod_reg_ld_high = 1'b0;
        prod_reg_shift_rt = 1'b0;

        case (state)
            IDLE: begin
                if (start) next_state = TEST;
            end
            TEST: begin
                if (done) next_state = IDLE;
                else if (prod_lsb) next_state = ADD;
                else next_state = SHIFT;
            end
            ADD: begin
                prod_reg_ld_high = 1'b1;
                next_state = SHIFT;
            end
            SHIFT: begin
                prod_reg_shift_rt = 1'b1;
                next_state = TEST;
            end
        endcase
    end

    assign done = cycle_cnt[5];

endmodule
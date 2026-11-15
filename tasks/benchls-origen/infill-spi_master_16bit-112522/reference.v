module origen_112522 (
    input wire clk,
    input wire rst_n,
    input wire wrt,
    input wire [15:0] cmd,
    input wire MISO,
    output reg done,
    output reg SS_n,
    output reg SCLK,
    output wire MOSI,
    output reg [15:0] rd_data
);

    // State encoding
    localparam IDLE = 2'b00;
    localparam FRT_PCH = 2'b01;
    localparam ACTIVE = 2'b10;
    localparam BCK_PCH = 2'b11;

    reg [1:0] state, next_state;
    reg [4:0] bitcnt;
    reg [4:0] sclk_div;
    reg [15:0] shift_reg;
    reg sclk_int, sclk_prev;
    wire smpl, shft;

    // State machine
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (state)
            IDLE:    next_state = wrt ? FRT_PCH : IDLE;
            FRT_PCH: next_state = ACTIVE;
            ACTIVE:  next_state = (bitcnt == 5'd16 && sclk_div == 5'd31) ? BCK_PCH : ACTIVE;
            BCK_PCH: next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end

    // SCLK generation
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            sclk_div <= 5'd0;
            sclk_int <= 1'b0;
        end else if (state == ACTIVE) begin
            sclk_div <= sclk_div + 5'd1;
            if (sclk_div == 5'd31)
                sclk_int <= ~sclk_int;
        end else begin
            sclk_div <= 5'd0;
            sclk_int <= 1'b0;
        end
    end

    // Bit counter
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            bitcnt <= 5'd0;
        else if (state == ACTIVE && sclk_div == 5'd31)
            bitcnt <= bitcnt + 5'd1;
        else if (state == IDLE)
            bitcnt <= 5'd0;
    end

    // Shift register
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            shift_reg <= 16'd0;
        else if (state == IDLE && wrt)
            shift_reg <= cmd;
        else if (shft)
            shift_reg <= {shift_reg[14:0], MISO};
    end

    // Output logic
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            SS_n <= 1'b1;
            done <= 1'b0;
            rd_data <= 16'd0;
        end else begin
            SS_n <= (state == IDLE);
            done <= (state == BCK_PCH);
            if (state == BCK_PCH)
                rd_data <= shift_reg;
        end
    end

    always @(posedge clk) begin
        sclk_prev <= sclk_int;
        SCLK <= sclk_int;
    end

    assign MOSI = shift_reg[15];
    assign smpl = sclk_prev & ~sclk_int;
    assign shft = ~sclk_prev & sclk_int;

endmodule
module origen_031225 #(
    parameter CLK_DIV = 4
) (
    input wire clk,
    input wire rst,
    input wire start,
    input wire miso,
    input wire [7:0] addr,
    output reg sclk,
    output reg busy,
    output reg finish,
    output reg mosi,
    output reg [7:0] data
);

    localparam IDLE = 2'b00;
    localparam WAIT_HALF = 2'b01;
    localparam TRANSFER = 2'b10;

    reg [1:0] state_q, state_d;
    reg [7:0] addr_q, addr_d;
    reg [2:0] ctr_q, ctr_d;
    reg [CLK_DIV-1:0] sclk_q, sclk_d;
    reg mosi_q, mosi_d;
    reg [7:0] data_q, data_d;
    reg finish_q, finish_d;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state_q <= IDLE;
            addr_q <= 8'b0;
            ctr_q <= 3'b0;
            sclk_q <= {CLK_DIV{1'b0}};
            mosi_q <= 1'b1;
            data_q <= 8'b0;
            finish_q <= 1'b0;
        end else begin
            state_q <= state_d;
            addr_q <= addr_d;
            ctr_q <= ctr_d;
            sclk_q <= sclk_d;
            mosi_q <= mosi_d;
            data_q <= data_d;
            finish_q <= finish_d;
        end
    end

    always @(*) begin
        state_d = state_q;
        addr_d = addr_q;
        ctr_d = ctr_q;
        sclk_d = sclk_q;
        mosi_d = mosi_q;
        data_d = data_q;
        finish_d = 1'b0;

        case (state_q)
            IDLE: begin
                sclk_d = {CLK_DIV{1'b0}};
                mosi_d = 1'b1;
                if (start) begin
                    addr_d = addr;
                    state_d = WAIT_HALF;
                    ctr_d = 3'b0;
                end
            end

            WAIT_HALF: begin
                sclk_d = sclk_q + 1'b1;
                if (sclk_q == {CLK_DIV-1{1'b1}}) begin
                    sclk_d = {CLK_DIV{1'b0}};
                    state_d = TRANSFER;
                end
            end

            TRANSFER: begin
                sclk_d = sclk_q + 1'b1;
                if (sclk_q == {CLK_DIV-1{1'b1}}) begin
                    mosi_d = addr_q[7];
                    addr_d = {addr_q[6:0], miso};
                    ctr_d = ctr_q + 1'b1;
                    if (ctr_q == 3'b111) begin
                        state_d = IDLE;
                        data_d = {addr_q[6:0], miso};
                        finish_d = 1'b1;
                    end
                end
            end
        endcase
    end

    always @(*) begin
        sclk = (state_q == TRANSFER) ? sclk_q[CLK_DIV-1] : 1'b0;
        busy = (state_q != IDLE);
        finish = finish_q;
        mosi = mosi_q;
        data = data_q;
    end

endmodule
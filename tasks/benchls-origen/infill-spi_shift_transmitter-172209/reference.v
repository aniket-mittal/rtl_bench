module origen_172209(
    input clock,
    input reset,
    input start_tr,
    input device,
    input [4:0] num_bits,
    input [31:0] sclk_divider,
    input [31:0] set_data,
    output reg ready,
    output reg [1:0] sen,
    output reg sclk,
    output reg mosi
);

reg [31:0] sclk_counter;
reg [4:0] bit_counter;
reg [31:0] dataout_reg;
reg sen_is_idle;

localparam WAIT_TRIG = 3'b000;
localparam PRE_IDLE = 3'b001;
localparam CLK_REG = 3'b010;
localparam CLK_INV = 3'b011;
localparam POST_IDLE = 3'b100;
localparam IDLE_SEN = 3'b101;
localparam READY_LOW = 3'b110;

reg [2:0] state;

always @(posedge clock or posedge reset) begin
    if (reset) begin
        state <= WAIT_TRIG;
        ready <= 1'b1;
        sen <= 2'b11;
        sclk <= 1'b0;
        mosi <= 1'b0;
        sclk_counter <= 0;
        bit_counter <= 0;
        dataout_reg <= 0;
        sen_is_idle <= 1'b1;
    end else begin
        case (state)
            WAIT_TRIG: begin
                if (start_tr) begin
                    state <= PRE_IDLE;
                    sclk_counter <= 0;
                    bit_counter <= num_bits - 1;
                    dataout_reg <= set_data;
                    sen_is_idle <= 1'b0;
                end
            end
            PRE_IDLE: begin
                state <= CLK_REG;
            end
            CLK_REG: begin
                sclk <= 1'b0;
                mosi <= dataout_reg[bit_counter];
                if (sclk_counter == sclk_divider - 1) begin
                    state <= CLK_INV;
                    sclk_counter <= 0;
                end else begin
                    sclk_counter <= sclk_counter + 1;
                end
            end
            CLK_INV: begin
                sclk <= 1'b1;
                if (bit_counter == 0) begin
                    state <= POST_IDLE;
                end else begin
                    state <= CLK_REG;
                    bit_counter <= bit_counter - 1;
                    dataout_reg <= {dataout_reg[30:0], 1'b0};
                end
            end
            POST_IDLE: begin
                sclk_counter <= 0;
                state <= IDLE_SEN;
            end
            IDLE_SEN: begin
                ready <= 1'b1;
                state <= READY_LOW;
            end
            READY_LOW: begin
                ready <= 1'b0;
                state <= WAIT_TRIG;
                sen_is_idle <= 1'b1;
            end
        endcase

        if (sen_is_idle) begin
            sen <= {~device, device};
        end else begin
            sen <= 2'b00;
        end
    end
end

endmodule
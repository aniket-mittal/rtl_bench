module origen_134615 (
    input wire rst,
    input wire i_tear_effect,
    input wire i_fsync,
    input wire [31:0] i_pixel_count,
    input wire i_axi_clk,
    input wire [31:0] i_axi_data,
    input wire [3:0] i_axi_keep,
    input wire i_axi_last,
    input wire i_axi_valid,
    input wire [1:0] i_ppfifo_rdy,
    input wire [23:0] i_ppfifo_size,
    output wire o_ppfifo_clk,
    output reg o_axi_ready,
    output reg [1:0] o_ppfifo_act,
    output reg o_ppfifo_stb,
    output reg [31:0] o_ppfifo_data
);

    localparam WAIT_FOR_TEAR_EFFECT = 2'b00;
    localparam WAIT_FOR_FRAME = 2'b01;
    localparam READ_FRAME = 2'b10;
    localparam WAIT_FOR_END_TEAR = 2'b11;

    localparam TEAR_WINDOW_COUNT = 1000; // Adjust as needed

    reg [1:0] state;
    reg [31:0] pixel_counter;
    reg [9:0] tear_window_counter;
    reg [1:0] active_fifo;

    assign o_ppfifo_clk = i_axi_clk;

    always @(posedge i_axi_clk or posedge rst) begin
        if (rst) begin
            state <= WAIT_FOR_TEAR_EFFECT;
            pixel_counter <= 0;
            tear_window_counter <= 0;
            active_fifo <= 2'b00;
            o_axi_ready <= 1'b0;
            o_ppfifo_act <= 2'b00;
            o_ppfifo_stb <= 1'b0;
            o_ppfifo_data <= 32'b0;
        end else begin
            case (state)
                WAIT_FOR_TEAR_EFFECT: begin
                    if (i_tear_effect) begin
                        state <= WAIT_FOR_FRAME;
                        tear_window_counter <= 0;
                    end
                    o_axi_ready <= 1'b0;
                    o_ppfifo_act <= 2'b00;
                    o_ppfifo_stb <= 1'b0;
                end

                WAIT_FOR_FRAME: begin
                    if (i_fsync) begin
                        state <= READ_FRAME;
                        pixel_counter <= 0;
                        active_fifo <= (i_ppfifo_rdy == 2'b01) ? 2'b01 : 2'b10;
                    end else if (tear_window_counter == TEAR_WINDOW_COUNT - 1) begin
                        state <= WAIT_FOR_TEAR_EFFECT;
                    end else begin
                        tear_window_counter <= tear_window_counter + 1;
                    end
                    o_axi_ready <= 1'b0;
                    o_ppfifo_act <= 2'b00;
                    o_ppfifo_stb <= 1'b0;
                end

                READ_FRAME: begin
                    o_axi_ready <= (pixel_counter < i_ppfifo_size) && (i_ppfifo_rdy[active_fifo[0]]);
                    o_ppfifo_act <= active_fifo;
                    
                    if (i_axi_valid && o_axi_ready) begin
                        o_ppfifo_stb <= 1'b1;
                        o_ppfifo_data <= i_axi_data;
                        pixel_counter <= pixel_counter + 1;

                        if (pixel_counter == i_pixel_count - 1 || i_axi_last) begin
                            state <= WAIT_FOR_END_TEAR;
                        end
                    end else begin
                        o_ppfifo_stb <= 1'b0;
                    end
                end

                WAIT_FOR_END_TEAR: begin
                    if (!i_tear_effect) begin
                        state <= WAIT_FOR_TEAR_EFFECT;
                    end
                    o_axi_ready <= 1'b0;
                    o_ppfifo_act <= 2'b00;
                    o_ppfifo_stb <= 1'b0;
                end

                default: state <= WAIT_FOR_TEAR_EFFECT;
            endcase
        end
    end

endmodule
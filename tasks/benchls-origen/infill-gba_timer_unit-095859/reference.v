module origen_095859 (
    input wire clk_16MHz,
    input wire reset,
    input wire [15:0] TMxCNT_L,
    input wire [15:0] TMxCNT_H,
    input wire [15:0] prev_timer_value,
    output reg [15:0] timer_count,
    output reg interrupt_req
);

    // Configuration bits
    wire start_stop = TMxCNT_H[7];
    wire interrupt_enable = TMxCNT_H[6];
    wire count_up_mode = TMxCNT_H[2];
    wire [1:0] prescaler_select = TMxCNT_H[1:0];

    // Clock divider signals
    wire clk_250kHz, clk_62_5kHz, clk_15_625kHz;
    reg selected_clk;

    // Internal signals
    reg [15:0] reload_value;
    reg timer_running;
    reg prev_start_stop;

    // Clock divider instantiation
    clock_divider clk_div (
        .clk_16MHz(clk_16MHz),
        .clk_250kHz(clk_250kHz),
        .clk_62_5kHz(clk_62_5kHz),
        .clk_15_625kHz(clk_15_625kHz)
    );

    // Clock selection based on prescaler
    always @(*) begin
        case (prescaler_select)
            2'b00: selected_clk = clk_16MHz;
            2'b01: selected_clk = clk_250kHz;
            2'b10: selected_clk = clk_62_5kHz;
            2'b11: selected_clk = clk_15_625kHz;
        endcase
    end

    // Timer logic
    always @(posedge selected_clk or posedge reset) begin
        if (reset) begin
            timer_count <= 16'h0000;
            timer_running <= 1'b0;
            interrupt_req <= 1'b0;
            prev_start_stop <= 1'b0;
            reload_value <= TMxCNT_L;
        end else begin
            prev_start_stop <= start_stop;

            if (start_stop && !prev_start_stop) begin
                timer_running <= 1'b1;
                timer_count <= TMxCNT_L;
                reload_value <= TMxCNT_L;
            end else if (!start_stop) begin
                timer_running <= 1'b0;
            end

            if (timer_running) begin
                if (timer_count == 16'hFFFF) begin
                    if (interrupt_enable) interrupt_req <= 1'b1;
                    
                    if (count_up_mode) begin
                        timer_count <= reload_value;
                    end else begin
                        if (prev_timer_value == 16'hFFFF) begin
                            timer_count <= reload_value;
                        end else begin
                            timer_running <= 1'b0;
                        end
                    end
                end else begin
                    timer_count <= timer_count + 1'b1;
                    interrupt_req <= 1'b0;
                end
            end
        end
    end

endmodule

module clock_divider (
    input wire clk_16MHz,
    output reg clk_250kHz,
    output reg clk_62_5kHz,
    output reg clk_15_625kHz
);

    reg [5:0] counter_250kHz = 0;
    reg [7:0] counter_62_5kHz = 0;
    reg [9:0] counter_15_625kHz = 0;

    always @(posedge clk_16MHz) begin
        // 250 kHz clock (divide by 64)
        if (counter_250kHz == 31) begin
            counter_250kHz <= 0;
            clk_250kHz <= ~clk_250kHz;
        end else begin
            counter_250kHz <= counter_250kHz + 1;
        end

        // 62.5 kHz clock (divide by 256)
        if (counter_62_5kHz == 127) begin
            counter_62_5kHz <= 0;
            clk_62_5kHz <= ~clk_62_5kHz;
        end else begin
            counter_62_5kHz <= counter_62_5kHz + 1;
        end

        // 15.625 kHz clock (divide by 1024)
        if (counter_15_625kHz == 511) begin
            counter_15_625kHz <= 0;
            clk_15_625kHz <= ~clk_15_625kHz;
        end else begin
            counter_15_625kHz <= counter_15_625kHz + 1;
        end
    end

endmodule
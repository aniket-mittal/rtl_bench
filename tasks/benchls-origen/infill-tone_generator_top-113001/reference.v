module origen_113001 (
    input wire [9:0] freq,
    input wire reset,
    input wire clk,
    input wire enable,
    input wire acquire,
    output reg signed [15:0] waveform,
    output reg waveform_valid
);

    reg [15:0] step_size;
    wire [15:0] div_result;
    wire div_done;
    reg div_start;
    wire [4:0] count;
    reg wave_gen_enable;

    // Divider instantiation
    divider div_inst (
        .clk(clk),
        .reset(reset),
        .start(div_start),
        .dividend(16'd152727),
        .divisor({6'b0, freq}),
        .quotient(div_result),
        .done(div_done)
    );

    // Counter instantiation
    counter cnt_inst (
        .clk(clk),
        .reset(reset),
        .enable(div_start),
        .count(count)
    );

    // Wave generator instantiation
    waveGen wave_gen_inst (
        .clk(clk),
        .reset(reset),
        .enable(wave_gen_enable),
        .step_size(step_size),
        .waveform(waveform)
    );

    // Top-level controller
    reg [1:0] state;
    localparam IDLE = 2'b00, DIVIDING = 2'b01, GENERATING = 2'b10;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            div_start <= 1'b0;
            wave_gen_enable <= 1'b0;
            step_size <= 16'd0;
            waveform_valid <= 1'b0;
        end else begin
            case (state)
                IDLE: begin
                    if (enable) begin
                        div_start <= 1'b1;
                        state <= DIVIDING;
                    end
                end
                DIVIDING: begin
                    if (div_done) begin
                        div_start <= 1'b0;
                        step_size <= div_result;
                        wave_gen_enable <= 1'b1;
                        state <= GENERATING;
                    end
                end
                GENERATING: begin
                    waveform_valid <= acquire;
                    if (!enable) begin
                        wave_gen_enable <= 1'b0;
                        state <= IDLE;
                    end
                end
            endcase
        end
    end
endmodule

module divider (
    input wire clk,
    input wire reset,
    input wire start,
    input wire [15:0] dividend,
    input wire [15:0] divisor,
    output reg [15:0] quotient,
    output reg done
);

    reg [15:0] remainder;
    reg [4:0] count;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            quotient <= 16'd0;
            remainder <= 16'd0;
            count <= 5'd0;
            done <= 1'b0;
        end else if (start) begin
            quotient <= 16'd0;
            remainder <= dividend;
            count <= 5'd19;
            done <= 1'b0;
        end else if (count > 0) begin
            if (remainder >= divisor) begin
                remainder <= remainder - divisor;
                quotient <= (quotient << 1) | 1'b1;
            end else begin
                quotient <= quotient << 1;
            end
            count <= count - 1;
        end else if (count == 0) begin
            done <= 1'b1;
        end
    end
endmodule

module waveGen (
    input wire clk,
    input wire reset,
    input wire enable,
    input wire [15:0] step_size,
    output reg signed [15:0] waveform
);

    reg direction;
    wire overflow_pos, overflow_neg;

    assign overflow_pos = (waveform > 0) && (waveform + step_size < 0);
    assign overflow_neg = (waveform < 0) && (waveform - step_size > 0);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            waveform <= 16'd0;
            direction <= 1'b1;
        end else if (enable) begin
            if (direction) begin
                if (overflow_pos) begin
                    direction <= 1'b0;
                    waveform <= waveform - step_size;
                end else begin
                    waveform <= waveform + step_size;
                end
            end else begin
                if (overflow_neg) begin
                    direction <= 1'b1;
                    waveform <= waveform + step_size;
                end else begin
                    waveform <= waveform - step_size;
                end
            end
        end
    end
endmodule

module counter (
    input wire clk,
    input wire reset,
    input wire enable,
    output reg [4:0] count
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            count <= 5'd18;
        end else if (enable) begin
            if (count > 0) begin
                count <= count - 1;
            end else begin
                count <= 5'd18;
            end
        end
    end
endmodule
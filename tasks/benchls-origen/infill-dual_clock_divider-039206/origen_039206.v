module origen_039206(
    input wire CLOCK,
    input wire SLOWER_CLOCK,
    input wire RESET,
    input wire abtoggle,
    input wire HF_toggle,
    input wire sw13,
    input wire sw14,
    input wire sw15,
    input wire btnL,
    input wire btnR,
    input wire [11:0] stepsize_input,
    input wire PULSE_l,
    input wire PULSE_r,
    output reg [27:0] frequency,
    output reg [27:0] frequency2,
    output reg outputclock,
    output reg outputclock2
);

    reg [27:0] n, n2;
    reg [27:0] counter, counter2;
    reg [4:0] hold_counter;
    wire [27:0] stepsize;

    assign stepsize = HF_toggle ? stepsize_input * 100 : stepsize_input;

    always @(posedge CLOCK or posedge RESET) begin
        if (RESET) begin
            n <= 28'd250000;
            n2 <= 28'd250000;
            frequency <= 28'd200;
            frequency2 <= 28'd200;
            counter <= 28'd0;
            counter2 <= 28'd0;
            outputclock <= 1'b0;
            outputclock2 <= 1'b0;
        end else begin
            if (counter == 28'd0) begin
                counter <= n - 1;
                outputclock <= ~outputclock;
            end else begin
                counter <= counter - 1;
            end

            if (counter2 == 28'd0) begin
                counter2 <= n2 - 1;
                outputclock2 <= ~outputclock2;
            end else begin
                counter2 <= counter2 - 1;
            end
        end
    end

    [MASKED]

endmodule
module origen_058444(
    input clk,
    input in,
    input reset,
    input start,
    input pause,
    output reg [7:0] LEDG,
    output reg [2:0] state,
    output reg [0:0] value
);

    // State definitions
    parameter S0 = 3'b000;
    parameter S1 = 3'b001;
    parameter S2 = 3'b010;
    parameter S3 = 3'b011;

    // State transition logic
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S0;
        end else begin
            case (state)
                S0: state <= in ? S1 : S0;
                S1: state <= in ? S2 : S1;
                S2: state <= in ? S3 : S2;
                S3: state <= in ? S0 : S3;
                default: state <= S0;
            endcase
        end
    end

    // LED output logic
    always @(posedge clk) begin
        if (value == 1'b0) begin
            case (state)
                S0: LEDG <= 8'hFF;
                S1: LEDG <= (clk) ? 8'hAA : 8'h55;
                S2: LEDG <= 8'h00;
                S3: LEDG <= (clk) ? 8'hF0 : 8'h0F;
                default: LEDG <= 8'hFF;
            endcase
        end
    end

    // Pause/Start control
    always @(posedge pause or posedge start) begin
        if (pause)
            value <= 1'b1;
        else if (start)
            value <= 1'b0;
    end

endmodule
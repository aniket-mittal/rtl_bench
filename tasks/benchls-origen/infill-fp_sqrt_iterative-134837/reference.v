module origen_134837 #(
    parameter INPUT_WIDTH = 17,
    parameter OUTPUT_WIDTH = 9,
    parameter EXCEPTION_WIDTH = 4,
    parameter ROUNDING_MODE_WIDTH = 3,
    parameter floatControlWidth = 5
) (
    input wire nReset,
    input wire clock,
    input wire inValid,
    input wire [INPUT_WIDTH-1:0] a,
    input wire [ROUNDING_MODE_WIDTH-1:0] roundingMode,
    input wire [floatControlWidth-1:0] control,
    output reg inReady,
    output reg outValid,
    output reg [OUTPUT_WIDTH-1:0] out,
    output reg [EXCEPTION_WIDTH-1:0] exceptionFlags
);

    localparam IDLE = 2'b00;
    localparam CALCULATE = 2'b01;
    localparam FINISH = 2'b10;

    reg [1:0] state;
    reg [INPUT_WIDTH-1:0] x;
    reg [OUTPUT_WIDTH-1:0] y;
    reg [OUTPUT_WIDTH:0] m;
    reg [5:0] i;

    always @(posedge clock or negedge nReset) begin
        if (!nReset) begin
            state <= IDLE;
            inReady <= 1'b1;
            outValid <= 1'b0;
            out <= {OUTPUT_WIDTH{1'b0}};
            exceptionFlags <= {EXCEPTION_WIDTH{1'b0}};
            x <= {INPUT_WIDTH{1'b0}};
            y <= {OUTPUT_WIDTH{1'b0}};
            m <= {(OUTPUT_WIDTH+1){1'b0}};
            i <= 6'd0;
        end else begin
            case (state)
                IDLE: begin
                    if (inValid) begin
                        state <= CALCULATE;
                        inReady <= 1'b0;
                        x <= a;
                        y <= {OUTPUT_WIDTH{1'b0}};
                        m <= {1'b1, {OUTPUT_WIDTH{1'b0}}};
                        i <= OUTPUT_WIDTH;
                        exceptionFlags <= {EXCEPTION_WIDTH{1'b0}};
                    end
                end

                CALCULATE: begin
                    if (i > 0) begin
                        if (x >= (y | m)) begin
                            x <= x - (y | m);
                            y <= (y >> 1) | m;
                        end else begin
                            y <= y >> 1;
                        end
                        m <= m >> 2;
                        i <= i - 1;
                    end else begin
                        state <= FINISH;
                    end
                end

                FINISH: begin
                    out <= y;
                    outValid <= 1'b1;
                    state <= IDLE;
                    inReady <= 1'b1;

                    // Check for exceptions
                    if (a > 17'h1FFFF) begin // Input out of range
                        exceptionFlags[0] <= 1'b1; // Invalid operation
                    end
                    if (y == {OUTPUT_WIDTH{1'b1}}) begin // Maximum output value
                        exceptionFlags[2] <= 1'b1; // Overflow
                    end

                    // Apply rounding
                    case (roundingMode)
                        3'b000: begin // Round to nearest
                            if (x > (y >> 1)) begin
                                out <= y + 1;
                            end
                        end
                        3'b001: begin // Round to zero
                            // No action needed
                        end
                        3'b010: begin // Round up
                            if (x > 0) begin
                                out <= y + 1;
                            end
                        end
                        3'b011: begin // Round down
                            // No action needed
                        end
                        default: begin
                            exceptionFlags[0] <= 1'b1; // Invalid operation
                        end
                    endcase
                end

                default: begin
                    state <= IDLE;
                end
            endcase
        end
    end

endmodule
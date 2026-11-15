module origen_030145(
    input wire clk,
    input wire clr,
    output reg [5:0] lights
);

    // State definitions
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010,
              S3 = 3'b011, S4 = 3'b100, S5 = 3'b101;

    // Timing parameters
    parameter SEC5 = 25'd250000000; // 5 seconds at 50MHz clock
    parameter SEC1 = 25'd50000000;  // 1 second at 50MHz clock

    reg [2:0] state;
    reg [24:0] count;

    // Sequential block for state transitions and timing
    always @(posedge clk or posedge clr) begin
        if (clr) begin
            state <= S0;
            count <= 25'd0;
        end else begin
            case (state)
                S0: if (count == SEC5) begin state <= S1; count <= 25'd0; end
                    else count <= count + 1;
                S1: if (count == SEC1) begin state <= S2; count <= 25'd0; end
                    else count <= count + 1;
                S2: if (count == SEC1) begin state <= S3; count <= 25'd0; end
                    else count <= count + 1;
                S3: if (count == SEC5) begin state <= S4; count <= 25'd0; end
                    else count <= count + 1;
                S4: if (count == SEC1) begin state <= S5; count <= 25'd0; end
                    else count <= count + 1;
                S5: if (count == SEC1) begin state <= S0; count <= 25'd0; end
                    else count <= count + 1;
                default: state <= S0;
            endcase
        end
    end

    // Combinational block for light configuration
    always @(*) begin
        case (state)
            S0: lights = 6'b100001;
            S1: lights = 6'b100010;
            S2: lights = 6'b100100;
            S3: lights = 6'b001100;
            S4: lights = 6'b010100;
            S5: lights = 6'b100100;
            default: lights = 6'b100001;
        endcase
    end

endmodule
module origen_115065 (
    input logic clk, reset,
    input logic [1:0] IN,
    output logic [2:0] OUT
);

    typedef enum logic [1:0] {A, B, C, D} state_t;
    state_t ps, ns;

    always_comb begin
        case (ps)
            A: case (IN)
                2'b00: ns = B;
                2'b01: ns = C;
                2'b10: ns = D;
                default: ns = A;
            endcase
            B: case (IN)
                2'b00: ns = C;
                2'b01: ns = D;
                2'b10: ns = A;
                default: ns = B;
            endcase
            C: case (IN)
                2'b00: ns = D;
                2'b01: ns = A;
                2'b10: ns = B;
                default: ns = C;
            endcase
            D: case (IN)
                2'b00: ns = A;
                2'b01: ns = B;
                2'b10: ns = C;
                default: ns = D;
            endcase
            default: ns = A;
        endcase
    end

    always_comb begin
        OUT[2] = (ns == A) || (ns == D);
        OUT[1] = (ns == C);
        OUT[0] = (ns == A) || (ns == B);
    end

    [MASKED]
endmodule

module hazardlights_testbench();
    logic clk, reset;
    logic [1:0] IN;
    logic [2:0] OUT;

    hazardlights dut (.*);

    initial begin
        clk = 0;
        forever #50 clk = ~clk;
    end

    initial begin
        reset = 1; IN = 2'b00; @(posedge clk);
        reset = 0; @(posedge clk);
        IN = 2'b01; @(posedge clk);
        IN = 2'b10; @(posedge clk);
        IN = 2'b11; @(posedge clk);
        IN = 2'b00; @(posedge clk);
        ;
    end
endmodule

module DE1_SoC (
    input logic CLOCK_50,
    input logic [3:0] KEY,
    input logic [9:0] SW,
    output logic [9:0] LEDR
);

    logic [31:0] div_clk;
    clock_divider divider (.clock(CLOCK_50), .divided_clocks(div_clk));

    hazardlights hl (
        .clk(div_clk[23]),
        .reset(~KEY[0]),
        .IN(SW[1:0]),
        .OUT(LEDR[2:0])
    );

    assign LEDR[9] = div_clk[23];
    assign LEDR[8] = ~KEY[0];
endmodule

module clock_divider (
    input logic clock,
    output logic [31:0] divided_clocks
);

    initial divided_clocks = 0;

    always_ff @(posedge clock) begin
        divided_clocks <= divided_clocks + 1;
    end
endmodule
module origen_114204 (
    input wire clk,
    input wire [7:0] A, B,
    input wire CarryIn,
    input wire [4:0] Sel,
    output reg [7:0] Y
);

    reg [7:0] pp1A, pp1B;
    reg pp1CarryIn;
    reg [4:0] pp1Sel;
    
    reg [7:0] pp2Y;
    reg [4:0] pp2Sel;
    
    reg [7:0] pp3Y;
    
    wire [7:0] comb1Y, comb2Y;

    // Pipeline stage 1: Input Registration
    always @(posedge clk) begin
        pp1A <= A;
        pp1B <= B;
        pp1CarryIn <= CarryIn;
        pp1Sel <= Sel;
    end

    // ALU Operations
    assign comb1Y = (pp1Sel[2:0] == 3'b000) ? pp1A :
                    (pp1Sel[2:0] == 3'b001) ? pp1A + pp1B + pp1CarryIn :
                    (pp1Sel[2:0] == 3'b010) ? pp1A + pp1B :
                    (pp1Sel[2:0] == 3'b011) ? pp1B :
                    (pp1Sel[2:0] == 3'b100) ? pp1A & pp1B :
                    (pp1Sel[2:0] == 3'b101) ? pp1A | pp1B :
                    (pp1Sel[2:0] == 3'b110) ? pp1A ^ pp1B :
                    ~pp1A;

    // Pipeline stage 2: ALU Operation
    always @(posedge clk) begin
        pp2Y <= comb1Y;
        pp2Sel <= pp1Sel;
    end

    // Shift Operations
    assign comb2Y = (pp2Sel[4:3] == 2'b00) ? pp2Y :
                    (pp2Sel[4:3] == 2'b01) ? {pp2Y[6:0], 1'b0} :
                    (pp2Sel[4:3] == 2'b10) ? {1'b0, pp2Y[7:1]} :
                    8'b0;

    // Pipeline stage 3: Shift/Pass-through
    always @(posedge clk) begin
        pp3Y <= comb2Y;
    end

    // Output assignment
    always @(posedge clk) begin
        Y <= pp3Y;
    end

endmodule
module origen_191567(
    input  wire req24, req23, req22, req21, req20,
    input  wire clk, rst,
    output reg  gnt24, gnt23, gnt22, gnt21, gnt20
);

    // State definitions
    localparam IDLE = 3'b000, GNT0 = 3'b001, GNT1 = 3'b010, GNT2 = 3'b011, GNT3 = 3'b100, GNT4 = 3'b101;

    // State register
    reg [2:0] state, next_state;

    // Next state logic
    always @(*) begin
        case (state)
            IDLE: begin
                if (req20) next_state = GNT0;
                else if (req21) next_state = GNT1;
                else if (req22) next_state = GNT2;
                else if (req23) next_state = GNT3;
                else if (req24) next_state = GNT4;
                else next_state = IDLE;
            end
            GNT0: next_state = req20 ? GNT0 : IDLE;
            GNT1: next_state = req21 ? GNT1 : IDLE;
            GNT2: next_state = req22 ? GNT2 : IDLE;
            GNT3: next_state = req23 ? GNT3 : IDLE;
            GNT4: next_state = req24 ? GNT4 : IDLE;
            default: next_state = IDLE;
        endcase
    end

    // State register update
    always @(posedge clk or posedge rst) begin
        if (rst) state <= IDLE;
        else state <= next_state;
    end

    // Output logic
    always @(*) begin
        gnt20 = 1'b0;
        gnt21 = 1'b0;
        gnt22 = 1'b0;
        gnt23 = 1'b0;
        gnt24 = 1'b0;

        case (state)
            GNT0: gnt20 = 1'b1;
            GNT1: gnt21 = 1'b1;
            GNT2: gnt22 = 1'b1;
            GNT3: gnt23 = 1'b1;
            GNT4: gnt24 = 1'b1;
        endcase
    end

endmodule
module origen_146537 (
    input wire clk,
    input wire reset,
    output reg [2:0] count,
    output reg done
);

    // State encoding
    localparam RESET = 2'b00;
    localparam COUNT1 = 2'b01;
    localparam COUNT2 = 2'b10;
    localparam COUNT3 = 2'b11;

    reg [1:0] current_state, next_state;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= RESET;
        else
            current_state <= next_state;
    end

    // Next state logic and output logic
    always @(*) begin
        next_state = current_state;
        count = 3'b000;
        done = 1'b0;

        case (current_state)
            RESET: begin
                done = 1'b1;
                if (!reset)
                    next_state = COUNT1;
            end
            COUNT1: begin
                count = 3'b001;
                if (count == 3'b010)
                    next_state = COUNT2;
            end
            COUNT2: begin
                count = 3'b011;
                if (count == 3'b100)
                    next_state = COUNT3;
            end
            COUNT3: begin
                count = 3'b101;
                if (count == 3'b111)
                    next_state = RESET;
            end
        endcase
    end

endmodule
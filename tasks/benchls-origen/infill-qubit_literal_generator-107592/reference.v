module origen_107592 #(
    parameter num_qubit = 3
) (
    input wire clk,
    input wire rst_new,
    output reg [2*num_qubit-1:0] literals_out,
    output reg phase_out,
    output reg valid_out
);

    localparam S0 = 2'b00;
    localparam S1 = 2'b01;
    localparam S2 = 2'b10;

    reg [1:0] state, next_state;
    reg [31:0] counter;

    always @(posedge clk or posedge rst_new) begin
        if (rst_new) begin
            state <= S0;
            counter <= 0;
        end else begin
            state <= next_state;
            if (state == S1)
                counter <= counter + 1;
        end
    end

    always @(*) begin
        case (state)
            S0: next_state = S1;
            S1: next_state = (counter == num_qubit - 1) ? S2 : S1;
            S2: next_state = S2;
            default: next_state = S0;
        endcase
    end

    always @(*) begin
        literals_out = {num_qubit{2'b00}};
        valid_out = 0;
        phase_out = 0;

        case (state)
            S1: begin
                literals_out[2*counter +: 2] = 2'b01;
                valid_out = 1;
            end
            default: begin
                literals_out = {num_qubit{2'b00}};
                valid_out = 0;
            end
        endcase
    end

endmodule
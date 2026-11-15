module origen_150673(
    input [2:0] SW,
    input CLOCK_27,
    output reg [1:0] LEDG,
    output reg [3:0] LEDR
);

reg [2:0] state;
localparam A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011, E = 3'b100;

initial begin
    state = A;
end

always @(posedge CLOCK_27) begin
    case (state)
        A: begin
            if (SW[2] == 0 && SW[1] == 1)
                state <= B;
            else if (SW == 3'b100)
                state <= C;
            else if (SW == 3'b101)
                state <= D;
            else if (SW[2] == 1 && SW[1] == 1)
                state <= E;
            else
                state <= A;
        end
        B: begin
            if (SW[2] == 1)
                state <= E;
            else if (SW[1] == 0)
                state <= A;
            else
                state <= B;
        end
        C: begin
            if (SW[1] == 1)
                state <= E;
            else if (SW[0] == 1)
                state <= D;
            else if (SW[2] == 0)
                state <= A;
            else
                state <= C;
        end
        D: begin
            if (SW[1] == 1)
                state <= E;
            else if (SW[0] == 0)
                state <= C;
            else if (SW[2] == 0)
                state <= A;
            else
                state <= D;
        end
        E: begin
            if (SW[2] == 0)
                state <= B;
            else if (SW[1] == 0 && SW[0] == 0)
                state <= C;
            else if (SW[1] == 0 && SW[0] == 1)
                state <= D;
            else if (SW[2] == 0 && SW[1] == 0)
                state <= A;
            else
                state <= E;
        end
    endcase

    case (state)
        A: begin
            LEDG = 2'b00;
            LEDR = 4'b0001;
        end
        B: begin
            LEDG = 2'b01;
            LEDR = 4'b0010;
        end
        C: begin
            LEDG = 2'b10;
            LEDR = 4'b0000;
        end
        D: begin
            LEDG = 2'b00;
            LEDR = 4'b0100;
        end
        E: begin
            LEDG = 2'b00;
            LEDR = 4'b1001;
        end
    endcase
end

endmodule
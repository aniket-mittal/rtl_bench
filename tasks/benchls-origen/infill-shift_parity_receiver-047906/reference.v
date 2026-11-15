module origen_047906(
    input wire data,
    input wire shift,
    input wire clk,
    output reg error,
    output wire [3:0] number
);
    reg [3:0] Q;
    wire [2:0] thisisathing;

    always @(posedge clk) begin
        if (shift) begin
            Q <= {data, Q[3:1]};
        end
    end

    assign thisisathing = Q[2:0];
    assign number = {1'b0, thisisathing};
    
    always @(posedge clk) begin
        error <= (Q[3] ^ Q[2] ^ Q[1] ^ Q[0]) ? 1'b1 : 1'b0;
    end
endmodule

module receivestatemachine(
    input wire clk,
    input wire ready,
    input wire reset,
    output reg ack,
    output reg shift
);
    localparam A = 2'b00, B = 2'b01, C = 2'b10, D = 2'b11;
    reg [1:0] state, next_state;

    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= A;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)
            A: next_state = ready ? A : B;
            B: next_state = C;
            C: next_state = ready ? D : C;
            D: next_state = A;
            default: next_state = A;
        endcase
    end

    always @(*) begin
        ack = (state == A) || (state == B);
        shift = (state == B) || (state == D);
    end
endmodule

module codeconverter(
    input wire [2:0] numbertoconvert,
    input wire errorinput,
    output reg [3:0] AN,
    output reg [6:0] ssegdisp,
    output wire error
);
    always @(*) begin
        AN = 4'b1110;
        case (numbertoconvert)
            3'b000: ssegdisp = 7'b1000000;
            3'b001: ssegdisp = 7'b1111001;
            3'b010: ssegdisp = 7'b0100100;
            3'b011: ssegdisp = 7'b0110000;
            3'b100: ssegdisp = 7'b0011001;
            3'b101: ssegdisp = 7'b0010010;
            3'b110: ssegdisp = 7'b0000010;
            3'b111: ssegdisp = 7'b1111000;
            default: ssegdisp = 7'b1111111;
        endcase
    end

    assign error = errorinput;
endmodule

module topmodr(
    input wire clk,
    input wire data,
    input wire reset,
    input wire ready,
    output wire ack,
    output wire error,
    output wire [3:0] AN,
    output wire [7:0] SSEG
);
    wire shift;
    wire [3:0] number;
    wire shiftr_error;

    receivestatemachine rsm(
        .clk(clk),
        .ready(ready),
        .reset(reset),
        .ack(ack),
        .shift(shift)
    );

    shiftr sr(
        .data(data),
        .shift(shift),
        .clk(clk),
        .error(shiftr_error),
        .number(number)
    );

    codeconverter cc(
        .numbertoconvert(number[2:0]),
        .errorinput(shiftr_error),
        .AN(AN),
        .ssegdisp(SSEG[6:0]),
        .error(error)
    );

    assign SSEG[7] = 1'b1;
endmodule
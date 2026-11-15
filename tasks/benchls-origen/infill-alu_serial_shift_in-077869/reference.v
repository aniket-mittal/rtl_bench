module origen_077869 (
    input [2:0] opcode,
    input [3:0] data,
    input GO, clock, reset,
    output [3:0] result,
    output cout, borrow,
    output [3:0] LED
);

    wire load, ready;
    wire [3:0] A, B;

    ALU_State state_control (
        .GO(GO),
        .clock(clock),
        .reset(reset),
        .load(load),
        .ready(ready),
        .LED(LED)
    );

    Shift_in shift_module (
        .data(data),
        .load(load),
        .clock(clock),
        .reset(reset),
        .A(A),
        .B(B)
    );

    ALU alu_module (
        .opcode(opcode),
        .A(A),
        .B(B),
        .result(result),
        .cout(cout),
        .borrow(borrow)
    );

endmodule

module ALU_State (
    input GO, clock, reset,
    output reg load, ready,
    output reg [3:0] LED
);

    localparam IDLE = 2'b00, LOAD = 2'b01, READY = 2'b10, DONE = 2'b11;
    reg [1:0] state, next_state;

    always @(posedge clock or posedge reset) begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end

    always @(*) begin
        case (state)
            IDLE: next_state = GO ? LOAD : IDLE;
            LOAD: next_state = READY;
            READY: next_state = DONE;
            DONE: next_state = GO ? DONE : IDLE;
            default: next_state = IDLE;
        endcase
    end

    always @(*) begin
        load = (state == LOAD);
        ready = (state == READY);
        LED = 4'b0001 << state;
    end

endmodule

module Shift_in (
    input [3:0] data,
    input load, clock, reset,
    output reg [3:0] A, B
);

    always @(posedge clock or posedge reset) begin
        if (reset) begin
            A <= 4'b0;
            B <= 4'b0;
        end
        else if (load) begin
            A <= data;
        end
    end

    always @(negedge clock or posedge reset) begin
        if (reset)
            B <= 4'b0;
        else if (load)
            B <= data;
    end

endmodule

module ALU (
    input [2:0] opcode,
    input [3:0] A, B,
    output reg [3:0] result,
    output reg cout, borrow
);

    always @(*) begin
        {cout, borrow} = 2'b00;
        case (opcode)
            3'b000: {cout, result} = A + B;
            3'b001: {borrow, result} = A - B;
            3'b010: result = ~A;
            3'b011: result = ~B;
            3'b100: result = A & B;
            3'b101: result = A | B;
            3'b110: result = A ^ B;
            3'b111: result = ~(A ^ B);
            default: result = 4'b0;
        endcase
    end

endmodule
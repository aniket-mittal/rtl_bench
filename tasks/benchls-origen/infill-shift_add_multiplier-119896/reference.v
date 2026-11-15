module origen_119896 (
    input wire clk,
    input wire reset,
    input wire start,
    input wire [7:0] A,
    output wire [3:0] result,
    output wire done
);

    wire clr_result, init_A, rshift, incre_result;
    wire [7:0] A_cur;

    controller ctrl (
        .clk(clk),
        .reset(reset),
        .start(start),
        .A_cur(A_cur),
        .clr_result(clr_result),
        .init_A(init_A),
        .rshift(rshift),
        .incre_result(incre_result),
        .done(done)
    );

    datapath dp (
        .clk(clk),
        .reset(reset),
        .A(A),
        .clr_result(clr_result),
        .init_A(init_A),
        .rshift(rshift),
        .incre_result(incre_result),
        .A_cur(A_cur),
        .result(result)
    );

endmodule

module controller (
    input wire clk,
    input wire reset,
    input wire start,
    input wire [7:0] A_cur,
    output reg clr_result,
    output reg init_A,
    output reg rshift,
    output reg incre_result,
    output reg done
);

    localparam S1 = 2'b00, S2 = 2'b01, S3 = 2'b10;
    reg [1:0] state, next_state;

    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S1;
        else
            state <= next_state;
    end

    always @(*) begin
        next_state = state;
        case (state)
            S1: if (start) next_state = S2;
            S2: if (A_cur == 8'b0) next_state = S3;
            S3: if (!start) next_state = S1;
        endcase
    end

    always @(*) begin
        clr_result = 0;
        init_A = 0;
        rshift = 0;
        incre_result = 0;
        done = 0;

        case (state)
            S1: begin
                clr_result = 1;
                init_A = !start;
            end
            S2: begin
                rshift = 1;
                incre_result = A_cur[0];
            end
            S3: done = 1;
        endcase
    end

endmodule

module datapath (
    input wire clk,
    input wire reset,
    input wire [7:0] A,
    input wire clr_result,
    input wire init_A,
    input wire rshift,
    input wire incre_result,
    output reg [7:0] A_cur,
    output reg [3:0] result
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            A_cur <= 8'b0;
            result <= 4'b0;
        end else begin
            if (init_A)
                A_cur <= A;
            else if (rshift)
                A_cur <= A_cur >> 1;

            if (clr_result)
                result <= 4'b0;
            else if (incre_result)
                result <= result + 1;
        end
    end

endmodule
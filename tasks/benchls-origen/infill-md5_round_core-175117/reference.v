module origen_175117 #(
    parameter WIDTH = 32
)
(
    input  [WIDTH-1:0] a_i, b_i, c_i, d_i,
    input  [1:0]       round_i,
    input  [WIDTH-1:0] m_i,
    input  [1:0]       s_i,
    input  [WIDTH-1:0] t_i,
    output [WIDTH-1:0] a_o
);

    localparam CORE_ROUND1 = 2'b00;
    localparam CORE_ROUND2 = 2'b01;
    localparam CORE_ROUND3 = 2'b10;
    localparam CORE_ROUND4 = 2'b11;

    function [WIDTH-1:0] F;
        input [WIDTH-1:0] b, c, d;
        begin
            F = (b & c) | ((~b) & d);
        end
    endfunction

    function [WIDTH-1:0] G;
        input [WIDTH-1:0] b, c, d;
        begin
            G = (b & d) | (c & (~d));
        end
    endfunction

    function [WIDTH-1:0] H;
        input [WIDTH-1:0] b, c, d;
        begin
            H = b ^ c ^ d;
        end
    endfunction

    function [WIDTH-1:0] I;
        input [WIDTH-1:0] b, c, d;
        begin
            I = c ^ (b | (~d));
        end
    endfunction

    reg [WIDTH-1:0] f;

    always @* begin
        case (round_i)
            CORE_ROUND1: f = F(b_i, c_i, d_i);
            CORE_ROUND2: f = G(b_i, c_i, d_i);
            CORE_ROUND3: f = H(b_i, c_i, d_i);
            CORE_ROUND4: f = I(b_i, c_i, d_i);
        endcase
    end

    assign a_o = a_i + f + m_i + t_i;

endmodule
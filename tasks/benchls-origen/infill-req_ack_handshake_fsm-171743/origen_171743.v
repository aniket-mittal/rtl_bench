module origen_171743(
    input clk,
    input clr,
    input req,
    input [5:0] data_in,
    output reg ack,
    output reg complete,
    output reg [5:0] data_out
);

// States
localparam s0 = 2'b00, s1 = 2'b01, s2 = 2'b10;
reg [1:0] PS, NS;

[MASKED]

always @(*) begin
    case (PS)
        s0: begin
            ack = 0;
            complete = 0;
            if (req)
                NS = s1;
            else
                NS = s0;
        end
        s1: begin
            ack = 0;
            complete = 1;
            data_out = data_in;
            NS = s2;
        end
        s2: begin
            ack = 1;
            complete = 0;
            if (!req)
                NS = s0;
            else
                NS = s2;
        end
        default: begin
            ack = 0;
            complete = 0;
            NS = s0;
        end
    endcase
end

endmodule
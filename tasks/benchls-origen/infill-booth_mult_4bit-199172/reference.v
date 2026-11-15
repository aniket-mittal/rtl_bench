module origen_199172(
    input start,
    input clk,
    input [3:0] a,
    input [3:0] b,
    output reg flag,
    output reg [7:0] mul
);

reg [3:0] State;
reg c;
reg [3:0] Acc;
reg [3:0] Q;

wire [3:0] m1, m2, m3, m4;

assign m1 = {c, Acc[3:1]};
assign m2 = {Acc[0], Acc[3:1]};
assign m3 = {c, Q[3:1]};
assign m4 = {Q[0], Q[3:1]};

always @(posedge clk) begin
    case (State)
        4'b0000: begin
            if (start) begin
                c <= 1'b0;
                Acc <= 4'b0000;
                Q <= a;
                State <= 4'b0001;
            end
        end
        4'b0001: begin
            if (Q[0]) begin
                Acc <= m1 + b;
                c <= Acc[0];
            end else begin
                Acc <= m2;
                c <= 1'b0;
            end
            Q <= m3;
            State <= 4'b0010;
        end
        4'b0010: begin
            Acc <= m2;
            Q <= m4;
            State <= 4'b0011;
        end
        4'b0011: begin
            if (Q[0]) begin
                Acc <= m1 + b;
                c <= Acc[0];
            end else begin
                Acc <= m2;
                c <= 1'b0;
            end
            Q <= m3;
            State <= 4'b0100;
        end
        4'b0100: begin
            Acc <= m2;
            Q <= m4;
            State <= 4'b0101;
        end
        4'b0101: begin
            if (Q[0]) begin
                Acc <= m1 + b;
                c <= Acc[0];
            end else begin
                Acc <= m2;
                c <= 1'b0;
            end
            Q <= m3;
            State <= 4'b0110;
        end
        4'b0110: begin
            Acc <= m2;
            Q <= m4;
            State <= 4'b0111;
        end
        4'b0111: begin
            if (Q[0]) begin
                Acc <= m1 + b;
                c <= Acc[0];
            end else begin
                Acc <= m2;
                c <= 1'b0;
            end
            Q <= m3;
            State <= 4'b1000;
        end
        4'b1000: begin
            Acc <= m2;
            Q <= m4;
            State <= 4'b1001;
        end
        4'b1001: begin
            flag <= 1'b1;
            mul <= {c, Acc, Q};
        end
        default: State <= 4'b0000;
    endcase
end

endmodule